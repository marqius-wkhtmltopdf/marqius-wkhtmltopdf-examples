<?php
// Copy this file to the root of an existing Laravel application.
require __DIR__ . '/vendor/autoload.php';
$app = require __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();
app('snappy.pdf.wrapper')
    ->loadHTML('<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>')
    ->save($argv[1]);
