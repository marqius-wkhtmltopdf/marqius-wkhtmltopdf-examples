# wicked_pdf with Marqius

Keep the existing library and HTML. Configure the executable supplied by [Marqius wkhtmltopdf](https://marqius.com/wkhtmltopdf/).

Language: Ruby. The sample files are `config/initializers/wicked_pdf.rb`, `render.rb`. Framework examples run inside an existing application with the named package installed; the CI workflow creates a fresh application to exercise them.

Read the complete [developer-manual chapter](https://marqius.com/download/developer-manual.pdf#page=29) for installation, before/after comparison and deployment notes. The root README lists the exact example commands and dependencies.

Use a representative document with your own fonts and compare the PDF before changing production. These examples use static sample HTML, not untrusted user content.
