require "pdfkit"

PDFKit.configure { |config| config.wkhtmltopdf = ENV.fetch("WKHTMLTOPDF_BINARY") { `which wkhtmltopdf`.strip } }
kit = PDFKit.new("<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>")
kit.to_file(ARGV[0])
