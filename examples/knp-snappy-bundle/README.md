# KnpSnappyBundle with Marqius

Keep the existing library and HTML. Configure the executable supplied by [Marqius wkhtmltopdf](https://marqius.com/wkhtmltopdf/).

Language: PHP / Symfony. The sample files are `config/packages/knp_snappy.yaml` and `src/Command/RenderInvoiceCommand.php`. Framework examples run inside an existing application with the named package installed; the CI workflow creates a fresh application to exercise them.

Read the complete [developer-manual chapter](https://marqius.com/download/developer-manual.pdf#page=23) for installation, before/after comparison and deployment notes. Set `WKHTMLTOPDF_BINARY` to the absolute executable path in your application's environment, copy the configuration and command into your Symfony project, then run `php bin/console marqius:invoice invoice.pdf`. The root README lists dependencies.

Use a representative document with your own fonts and compare the PDF before changing production. These examples use static sample HTML, not untrusted user content.

Ensure `config/bundles.php` includes `Knp\Bundle\SnappyBundle\KnpSnappyBundle::class => ['all' => true]`. Symfony may skip the community Flex recipe in a fresh project; add that entry to the existing array if the bundle is not already enabled.
