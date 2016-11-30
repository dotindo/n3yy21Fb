using System;
using DevExpress.XtraReports.UI;
using DotWeb.Repositories;

namespace DotMercy.custom.Report
{
    public partial class ChecklistCS2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {

                int paramPackingMonth = 0;

                int paramModel = 0;
                int paramVariant = 0;

                paramPackingMonth = Convert.ToInt32(Request.QueryString["vpm"]);
                paramModel = Convert.ToInt32(Request.QueryString["model"]);
                paramVariant = Convert.ToInt32(Request.QueryString["variant"]);

                rptChecklistCS2 rpt = new rptChecklistCS2();
                rpt.Parameters["PackingMonth"].Value = paramPackingMonth;
                rpt.Parameters["PackingMonth"].Visible = false;
                rpt.Parameters["ModelId"].Value = paramModel;
                rpt.Parameters["ModelId"].Visible = false;
                rpt.Parameters["VariantId"].Value = paramVariant;
                rpt.Parameters["VariantId"].Visible = false;

                ASPxDocumentViewer1.Report = rpt;
            }
        }

        public static int GetRicId(int packingmth, int model, int variant)
        {
            return RicRepository.GetRicId(packingmth, model, variant);
        }
    }
}