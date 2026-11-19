package main

import (
    "log"
    "os"
    "os/exec"
    "strings"

    wkhtmltopdf "github.com/SebastiaanKlippert/go-wkhtmltopdf"
)

func main() {
    binary, err := exec.LookPath("wkhtmltopdf")
    if err != nil { log.Fatal(err) }
    wkhtmltopdf.SetPath(binary)
    pdfg, err := wkhtmltopdf.NewPDFGenerator()
    if err != nil {
        log.Fatal(err)
    }
    html := "<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>"
    pdfg.AddPage(wkhtmltopdf.NewPageReader(strings.NewReader(html)))
    if err := pdfg.Create(); err != nil {
        log.Fatal(err)
    }
    if err := pdfg.WriteFile(os.Args[1]); err != nil {
        log.Fatal(err)
    }
}
