using System;
using System.Web.UI;
using DevExpress.XtraReports.Parameters;
using DevExpress.XtraReports.UI;
using DotMercy.custom.Report;

namespace DotMercy.custom.ReportDesigner
{
    public partial class RicEditor : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                XtraReport ricReport = new rptRIC();
                Parameter ricIDParam = new Parameter() { Name = "ricID", Type = Type.GetType("Int32") };
                ricReport.Parameters.AddRange(new Parameter[] { ricIDParam });
                ricReportDesigner.OpenReport(ricReport);
            }
        }
    }
}