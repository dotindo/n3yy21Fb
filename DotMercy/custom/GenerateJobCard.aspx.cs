using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Data.SqlClient;
namespace DotMercy.custom
{
    public partial class GenerateJobCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grid.DataBind();
            //Session["SessionId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grid_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxGridView Grid = (ASPxGridView)sender;

            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["AppDb"].ConnectionString);
            SqlCommand cmd = new SqlCommand();

            bool isError = false;
            string errMsg = "";

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandTimeout = 0;
            int i=0;
            string sql;
            int pm = 0;
            int type = 0;
            int model = 0;
            string date = "";
            int start = 0;
            int end = 0;

              
            while (i <=  e.NewValues.Count - 1)
            {
                if (i == 0)
                {
                    date = e.NewValues[i].ToString();
                }
                if (i == 1) 
                {
                    model = int.Parse(e.NewValues[i].ToString());
                }
                if (i == 3)
                {
                    start = int.Parse(e.NewValues[i].ToString());
                }
                if (i == 4)
                {
                    end = int.Parse(e.NewValues[i].ToString());
                }
                if (i == 5)
                {
                    type = int.Parse(e.NewValues[i].ToString());
                }
                if (i == 6)
                {
                    pm = int.Parse(e.NewValues[i].ToString());
                }
                   i++;
            }

            cmd.CommandText = "exec sp_GenerateJB @pm=" + pm.ToString() + ",@TypeId=" + type.ToString() + ",@ModelId=" + model.ToString() + ",@Date='" + date.ToString() + "',@StarProdNo=" + start.ToString() + ",@EndProdNo=" + end.ToString();
            
            string exeMsg = Convert.ToString(cmd.ExecuteScalar());
            if (!exeMsg.Trim().Equals(""))
            {
                //Logger.Error("Execution Query : " + exeMsg);
                isError = true;
                errMsg = exeMsg;
            }

            //check error
           
        }


    }
}