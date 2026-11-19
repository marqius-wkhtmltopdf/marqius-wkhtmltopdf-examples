import sys, tempfile
from pathlib import Path
import django
from django.conf import settings
settings.configure(WKHTMLTOPDF_CMD="wkhtmltopdf", WKHTMLTOPDF_CMD_OPTIONS={}, SECRET_KEY="local-example-only")
django.setup()
from wkhtmltopdf.utils import wkhtmltopdf
with tempfile.TemporaryDirectory() as directory:
    source = Path(directory) / "invoice.html"
    source.write_text("<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>")
    Path(sys.argv[1]).write_bytes(wkhtmltopdf([str(source)]))
