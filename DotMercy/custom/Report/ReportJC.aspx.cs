using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotMercy.custom.Report
{

    public partial class ReportJC : System.Web.UI.Page
    {      
        protected void Page_Load(object sender, EventArgs e)
        {
            rptDocViewer.Report = CreateReport();
        }

        JCSub1 CreateReport()
        {
            JCSub1 report = new JCSub1();
            //report.
            string ari = "0";
            ari=Request.QueryString["id"];
            if (ari == null) { ari = "0"; }
            report.Parameters["FDokProdNo"].Value = Convert.ToInt32(ari);
                report.CreateDocument(true);
             
            //report.ExportToPdf(@"D:\Marcedes Benz\SourceCode\CompiledApp\custom\FileUpload\201302\C205\C250\JobCard.pdf");
            return report;
        }
    }
}