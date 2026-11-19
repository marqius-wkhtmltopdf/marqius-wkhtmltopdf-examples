<?php
require __DIR__ . '/vendor/autoload.php';

use Cake\Core\Configure;
use CakePdf\Pdf\CakePdf;

Configure::write('CakePdf', [
    'engine' => [
        'className' => 'CakePdf.WkHtmlToPdf',
        'binary' => 'wkhtmltopdf',
    ],
]);
$pdf = new CakePdf();
$pdf->write($argv[1], true, '<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>');
