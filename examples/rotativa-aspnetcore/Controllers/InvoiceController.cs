using Microsoft.AspNetCore.Mvc;
using Rotativa.AspNetCore;
public sealed class InvoiceController : Controller
{
    [HttpGet("invoice")]
    public IActionResult Invoice() => new ViewAsPdf("Invoice") { PageSize = Rotativa.AspNetCore.Options.Size.A4 };
}
