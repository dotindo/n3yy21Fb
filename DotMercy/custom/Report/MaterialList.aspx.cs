using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotMercy.custom.Report
{
    public partial class MaterialList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {

                int paramPackingMonth = 0;
                int paramModel = 0;
               

                paramPackingMonth = Convert.ToInt32(Request.QueryString["vpm"]);
                paramModel = Convert.ToInt32(Request.QueryString["model"]);
              
                rptMaterialList rpt = new rptMaterialList();
                rpt.Parameters["PackingMonth"].Value = paramPackingMonth;
                rpt.Parameters["PackingMonth"].Visible = false;
                rpt.Parameters["ModelID"].Value = paramModel;
                rpt.Parameters["ModelID"].Visible = false;
              

                ASPxDocumentViewer1.Report = rpt;
            }
        }
    }
}