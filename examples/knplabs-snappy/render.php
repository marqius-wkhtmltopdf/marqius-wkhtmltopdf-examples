<?php
require __DIR__ . '/vendor/autoload.php';

use Knp\Snappy\Pdf;

$snappy = new Pdf('wkhtmltopdf');
$html = '<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>';
$snappy->generateFromHtml($html, $argv[1]);
