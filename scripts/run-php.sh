#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$repo_dir/output"
export WKHTMLTOPDF_BINARY="${WKHTMLTOPDF_BINARY:-$(command -v wkhtmltopdf)}"
if [[ $# == 0 ]]; then
  for example in knplabs-snappy phpwkhtmltopdf cakepdf laravel-snappy knp-snappy-bundle; do
    bash "$0" "$example"
  done
  exit 0
fi
example="${1#php-}"
case "$example" in
  knplabs-snappy|phpwkhtmltopdf|cakepdf)
    (cd "$repo_dir/examples/$example" && composer install --no-interaction --prefer-dist --no-progress && php render.php "$repo_dir/output/$example.pdf")
    ;;
  laravel-snappy)
    laravel_dir="${RUNNER_TEMP:-/tmp}/marqius-laravel-example"
    composer create-project laravel/laravel "$laravel_dir" --no-interaction --prefer-dist --no-progress
    (cd "$laravel_dir" && composer require barryvdh/laravel-snappy --no-interaction --no-progress)
    cp "$repo_dir/examples/laravel-snappy/render.php" "$laravel_dir/render.php"
    (cd "$laravel_dir" && WKHTML_PDF_BINARY="$WKHTMLTOPDF_BINARY" php render.php "$repo_dir/output/$example.pdf")
    ;;
  knp-snappy-bundle)
    symfony_dir="${RUNNER_TEMP:-/tmp}/marqius-symfony-example"
    composer create-project 'symfony/skeleton:^7.4' "$symfony_dir" --no-interaction --prefer-dist --no-progress
    (cd "$symfony_dir" && composer require symfony/framework-bundle symfony/console symfony/yaml knplabs/knp-snappy-bundle --no-interaction --no-progress)
    # Fresh Symfony projects do not enable community Flex recipes by default.
    (cd "$symfony_dir" && php -r '$path = "config/bundles.php"; $bundles = require $path; $bundles["Knp\\Bundle\\SnappyBundle\\KnpSnappyBundle"] = ["all" => true]; file_put_contents($path, "<?php\nreturn " . var_export($bundles, true) . ";\n");')
    mkdir -p "$symfony_dir/src/Command" "$symfony_dir/config/packages"
    cp "$repo_dir/examples/knp-snappy-bundle/src/Command/RenderInvoiceCommand.php" "$symfony_dir/src/Command/"
    cp "$repo_dir/examples/knp-snappy-bundle/config/packages/knp_snappy.yaml" "$symfony_dir/config/packages/"
    (cd "$symfony_dir" && php bin/console marqius:invoice "$repo_dir/output/$example.pdf")
    ;;
  *) echo "Unknown PHP example: $example" >&2; exit 1 ;;
esac
python3 "$repo_dir/scripts/check_pdf.py" "$repo_dir/output/$example.pdf"
