using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotMercy.custom.Report
{
    public partial class BackupJobCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {

                int paramPackingMonth = 0;
                int paramModel = 0;
                int paramVariant = 0;
                int paramStation = 0;

                paramPackingMonth = Convert.ToInt32(Request.QueryString["vpm"]);
                paramModel = Convert.ToInt32(Request.QueryString["model"]);
                paramVariant = Convert.ToInt32(Request.QueryString["variant"]);
                paramStation = Convert.ToInt32(Request.QueryString["station"]);

                rptBackupJobCard rpt = new rptBackupJobCard();
                rpt.Parameters["PackingMonth"].Value = paramPackingMonth;
                rpt.Parameters["PackingMonth"].Visible = false;
                rpt.Parameters["ModelID"].Value = paramModel;
                rpt.Parameters["ModelID"].Visible = false;
                rpt.Parameters["VariantId"].Value = paramVariant;
                rpt.Parameters["VariantId"].Visible = false;
                rpt.Parameters["StationId"].Visible = false;
                rpt.Parameters["StationId"].Value = paramStation;

                ASPxDocumentViewer1.Report = rpt;
            }
        }
    }
}