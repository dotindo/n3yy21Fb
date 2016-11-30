using System;
using DevExpress.XtraReports.UI;
using DotWeb.Repositories;

namespace DotMercy.custom.Report
{
    public partial class ToolCalibrationBarcode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {

                int paramInventoryId = 0;

                paramInventoryId = Convert.ToInt32(Request.QueryString["inventoryId"]);

                rptToolCalibrationBarcode rpt = new rptToolCalibrationBarcode();
                rpt.Parameters["ToolInventoryId"].Value = paramInventoryId;
                rpt.Parameters["ToolInventoryId"].Visible = false;

                ASPxDocumentViewer1.Report = rpt;

            }
        }

    }
}