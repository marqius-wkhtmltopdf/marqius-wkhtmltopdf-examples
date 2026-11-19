[out] = System.argv()
html = "<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>"
File.write!(out, PdfGenerator.generate_binary!(html))
