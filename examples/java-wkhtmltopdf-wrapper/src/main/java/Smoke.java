import com.github.jhonnymertz.wkhtmltopdf.wrapper.Pdf;
import com.github.jhonnymertz.wkhtmltopdf.wrapper.configurations.WrapperConfig;

public class Smoke {
    public static void main(String[] args) throws Exception {
        Pdf pdf = new Pdf(new WrapperConfig(System.getenv().getOrDefault("WKHTMLTOPDF_BINARY", "/usr/local/bin/wkhtmltopdf")));
        pdf.addPageFromString("<h1>Invoice 1001</h1><p>Total due: 120.00 EUR</p>");
        pdf.saveAs(args[0]);
    }
}
