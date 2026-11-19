import sys
import os
import shutil

import pdfkit

config = pdfkit.configuration(wkhtmltopdf=os.environ.get("WKHTMLTOPDF_BINARY") or shutil.which("wkhtmltopdf"))
html = "<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>"
pdfkit.from_string(html, sys.argv[1], configuration=config)
