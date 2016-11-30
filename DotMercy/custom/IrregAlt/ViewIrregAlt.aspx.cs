using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotWeb.Models;
using DotWeb.Utils;
using DotWeb.Repositories;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using DevExpress.WebUtils;

namespace DotMercy.custom.IrregAlt
{
    public partial class ViewIrregAlt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Username = string.Empty;
                BindViewData(Username);
            }
        }
        protected void BindViewData(string UserName)
        {
            DataTable dtIrregAlt = new DataTable();
            IrregAltRepository repoIrregAlt = new IrregAltRepository();

            dtIrregAlt = repoIrregAlt.dtBindView("", "usp_GetViewIrregAlt");
            gvIrregAltvw.DataSource = dtIrregAlt;
            gvIrregAltvw.DataBind();
        }

        protected void gvIrregAltvw_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
           
        }
    }
}