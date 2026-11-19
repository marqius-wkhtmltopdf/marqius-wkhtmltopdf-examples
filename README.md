# Marqius wkhtmltopdf examples

**Drop-in replacement for wkhtmltopdf in 14 libraries.**

Keep your library and templates. These small examples show the executable setting and render a sample invoice using Marqius. Start with the [switching guide](https://marqius.com/wkhtmltopdf/), or read the [developer manual](https://marqius.com/download/developer-manual.pdf).

## Install Marqius

```bash
curl -fsSL https://marqius.com/marqius-wkhtmltopdf.sh -o install-marqius.sh
# Review the installer, then run it. It verifies its executable download.
bash install-marqius.sh
```

The installer supplies a `wkhtmltopdf` executable. Keep your existing executable while evaluating; use the manual when you are ready to take over. Put the installed Marqius executable on PATH before running these examples. You can set `WKHTMLTOPDF_BINARY` to its absolute path (`export WKHTMLTOPDF_BINARY="$(command -v wkhtmltopdf)"`).

## Pick your library

| Library | Runtime | Detailed guide |
| --- | --- | --- |
| [python-pdfkit](examples/python-pdfkit/) | Python | [Chapter](https://marqius.com/download/developer-manual.pdf#page=7) |
| [django-wkhtmltopdf](examples/django-wkhtmltopdf/) | Python / Django | [Chapter](https://marqius.com/download/developer-manual.pdf#page=13) |
| [KnpLabs Snappy](examples/knplabs-snappy/) | PHP | [Chapter](https://marqius.com/download/developer-manual.pdf#page=16) |
| [laravel-snappy](examples/laravel-snappy/) | PHP / Laravel | [Chapter](https://marqius.com/download/developer-manual.pdf#page=18) |
| [phpwkhtmltopdf](examples/phpwkhtmltopdf/) | PHP | [Chapter](https://marqius.com/download/developer-manual.pdf#page=20) |
| [KnpSnappyBundle](examples/knp-snappy-bundle/) | PHP / Symfony | [Chapter](https://marqius.com/download/developer-manual.pdf#page=23) |
| [CakePdf](examples/cakepdf/) | PHP / CakePHP | [Chapter](https://marqius.com/download/developer-manual.pdf#page=26) |
| [wicked_pdf](examples/wicked-pdf/) | Ruby | [Chapter](https://marqius.com/download/developer-manual.pdf#page=29) |
| [PDFKit (Ruby)](examples/ruby-pdfkit/) | Ruby | [Chapter](https://marqius.com/download/developer-manual.pdf#page=31) |
| [wkhtmltopdf for Node](examples/node-wkhtmltopdf/) | Node.js | [Chapter](https://marqius.com/download/developer-manual.pdf#page=33) |
| [go-wkhtmltopdf](examples/go-wkhtmltopdf/) | Go | [Chapter](https://marqius.com/download/developer-manual.pdf#page=35) |
| [java-wkhtmltopdf-wrapper](examples/java-wkhtmltopdf-wrapper/) | Java | [Chapter](https://marqius.com/download/developer-manual.pdf#page=38) |
| [pdf_generator (Elixir)](examples/elixir-pdf-generator/) | Elixir | [Chapter](https://marqius.com/download/developer-manual.pdf#page=41) |
| [Rotativa.AspNetCore](examples/rotativa-aspnetcore/) | .NET | [Chapter](https://marqius.com/download/developer-manual.pdf#page=44) |

## Run a first example

```bash
cd examples/python-pdfkit
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python render.py invoice.pdf
```

For PHP, run `composer install` in a standalone example folder, then `php render.php invoice.pdf`. Laravel and Symfony examples are copied into an existing application; see their individual READMEs and `scripts/run-php.sh` for fresh-project setup. For Node.js, run `npm install` then `node render.js invoice.pdf`. For Ruby, install the Gemfile with Bundler and run `bundle exec ruby render.rb invoice.pdf`. Go uses `go run . invoice.pdf`; Java uses Maven's `exec:java` with `Smoke` as the main class. Elixir uses `mix deps.get` then `mix run render.exs invoice.pdf`. The Rotativa example is an ASP.NET Core MVC application; its runner starts it on loopback only.

## Compare before switching

Render the same representative document with your current engine and Marqius. Compare fonts, wrapping, headers, footers and page breaks. Keep a rollback path until the result meets your production requirements. The examples use static sample HTML and do not configure a service for untrusted documents.

The [render-examples workflow](.github/workflows/render-examples.yml) exercises all 14 integrations on Linux and checks that each output is a PDF containing the expected invoice text. Consult the current workflow result for its latest status.

## Licence and plans

The example code in this repository is MIT licensed. The Marqius converter is proprietary software under its own [licence](https://marqius.com/wkhtmltopdf/licence-agreement/). This repository contains integration examples, not the converter's source or binaries.

[30-day no-card trial and wkhtmltopdf pricing](https://marqius.com/wkhtmltopdf-buy/): $10 USD per Client per month, or $500 USD per Client for a lifetime licence with upgrades; applicable taxes are additional. See the licence for the legal-entity definition of a Client.

[marqius.com](https://marqius.com/) · [All 14 integrations](https://marqius.com/wkhtmltopdf/) · [Download and install](https://marqius.com/wkhtmltopdf/download/)
