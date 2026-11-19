import subprocess,sys
from pathlib import Path
for filename in sys.argv[1:]:
    p = Path(filename)
    assert p.is_file() and p.read_bytes().startswith(b"%PDF-"), f"Not a PDF: {p}"
    text = subprocess.check_output(["pdftotext", str(p), "-"]).decode("utf-8", "replace")
    assert "Invoice 1001" in text and "120.00" in text, f"Sample content missing from {p}"
    print(f"PASS {p.name}: valid PDF with expected invoice text")
