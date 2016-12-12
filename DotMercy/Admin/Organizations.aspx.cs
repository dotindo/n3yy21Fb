using DevExpress.Web;
using DotWeb;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotMercy.Admin
{
    public partial class Organizations : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(Organization));
        }
    }
}