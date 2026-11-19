#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$repo_dir/output"
for package in knplabs-snappy phpwkhtmltopdf cakepdf; do
  (cd "$repo_dir/examples/$package" && composer install --no-interaction --prefer-dist --no-progress && php render.php "$repo_dir/output/$package.pdf")
done
laravel_dir="${RUNNER_TEMP:-/tmp}/marqius-laravel-example"
composer create-project laravel/laravel "$laravel_dir" --no-interaction --prefer-dist --no-progress
(cd "$laravel_dir" && composer require barryvdh/laravel-snappy --no-interaction --no-progress)
cp "$repo_dir/examples/laravel-snappy/render.php" "$laravel_dir/render.php"
(cd "$laravel_dir" && WKHTML_PDF_BINARY=wkhtmltopdf php render.php "$repo_dir/output/laravel-snappy.pdf")
symfony_dir="${RUNNER_TEMP:-/tmp}/marqius-symfony-example"
composer create-project 'symfony/skeleton:^7.4' "$symfony_dir" --no-interaction --prefer-dist --no-progress
(cd "$symfony_dir" && composer require symfony/framework-bundle symfony/console symfony/yaml knplabs/knp-snappy-bundle --no-interaction --no-progress)
mkdir -p "$symfony_dir/src/Command" "$symfony_dir/config/packages"
cp "$repo_dir/examples/knp-snappy-bundle/src/Command/RenderInvoiceCommand.php" "$symfony_dir/src/Command/"
cp "$repo_dir/examples/knp-snappy-bundle/config/packages/knp_snappy.yaml" "$symfony_dir/config/packages/"
(cd "$symfony_dir" && php bin/console marqius:invoice "$repo_dir/output/knp-snappy-bundle.pdf")
python3 "$repo_dir/scripts/check_pdf.py" "$repo_dir"/output/*.pdf
