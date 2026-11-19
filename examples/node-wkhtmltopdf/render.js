const fs = require('node:fs');
const { pipeline } = require('node:stream/promises');
const wkhtmltopdf = require('wkhtmltopdf');
wkhtmltopdf.command = process.env.WKHTMLTOPDF_BINARY || 'wkhtmltopdf';
async function main() {
  await pipeline(wkhtmltopdf('<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>', { pageSize: 'A4' }), fs.createWriteStream(process.argv[2]));
}
main().catch(error => { console.error(error.message); process.exitCode = 1; });
