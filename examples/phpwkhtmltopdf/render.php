<?php
require __DIR__ . '/vendor/autoload.php';

use mikehaertl\wkhtmlto\Pdf;

$pdf = new Pdf(['binary' => 'wkhtmltopdf']);
$pdf->addPage('<html><h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p></html>');
if (!$pdf->saveAs($argv[1])) {
    exit($pdf->getError() . "\n");
}
