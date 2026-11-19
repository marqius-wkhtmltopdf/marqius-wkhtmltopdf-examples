<?php
namespace App\Command;
use Knp\Snappy\Pdf;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
#[AsCommand(name: 'marqius:invoice', description: 'Render a sample invoice with Marqius')]
final class RenderInvoiceCommand extends Command {
    public function __construct(private readonly Pdf $pdf) { parent::__construct(); }
    protected function configure(): void { $this->addArgument('output', InputArgument::REQUIRED); }
    protected function execute(InputInterface $input, OutputInterface $output): int {
        $this->pdf->generateFromHtml('<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>', $input->getArgument('output'), [], true);
        return Command::SUCCESS;
    }
}
