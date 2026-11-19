require "wicked_pdf"
WickedPdf.configure { |config| config.exe_path = ENV.fetch("WKHTMLTOPDF_BINARY") { `which wkhtmltopdf`.strip } }
html = "<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>"
File.binwrite(ARGV.fetch(0), WickedPdf.new.pdf_from_string(html))
