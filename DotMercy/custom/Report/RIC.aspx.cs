using System;
using DevExpress.XtraReports.UI;
using DotWeb.Repositories;

namespace DotMercy.custom.Report
{
    public partial class RIC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {

                int paramPackingMonth = 0;

                int paramModel = 0;
                int paramVarian = 0;

                paramPackingMonth = Convert.ToInt32(Request.QueryString["vpm"]);

                paramModel = Convert.ToInt32(Request.QueryString["model"]);
                paramVarian = Convert.ToInt32(Request.QueryString["variant"]);

                int ricid = GetRicId(paramPackingMonth, paramModel, paramVarian);
                rptRIC rptRIC = new rptRIC();
                rptRIC.Parameters["ricID"].Value = ricid;
                rptRIC.Parameters["ricID"].Visible = false;
                // Show the report's print preview.
                //using (ReportPrintTool tool = new ReportPrintTool(rptRIC))
                //{
                //    tool.ShowPreview();
                //}

                ASPxDocumentViewer1.Report = rptRIC;
            }
        }

        public static int GetRicId(int packingmth, int model, int variant)
        {
            return RicRepository.GetRicId(packingmth, model, variant);
        }
    }
}