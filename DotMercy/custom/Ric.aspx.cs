using System;
using System.Web.UI;

namespace DotMercy.custom
{
    public partial class Ric : Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //}

        protected void RicDetailsGrid_DataSelect(object sender, EventArgs e)
        {
            //Session["VarianId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

    }
}