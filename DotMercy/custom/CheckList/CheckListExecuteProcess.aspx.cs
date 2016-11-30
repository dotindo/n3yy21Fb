using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI;
using DevExpress.Web;
using DotWeb.Repositories;

namespace DotMercy.custom.CheckList
{
    public partial class CheckListExecuteProcess : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            if (Request.QueryString.Count > 0)
            {
                lblSPName.Text = Request.QueryString["spName"];
                BindLayout();

                Session["id"] = Request.QueryString["id"];
            }

            //loadingPanel.ContainerElementID = btnExecuteSP.ID;
            //}
        }

        private void BindLayout()
        {
            DataTable spParams = CheckListInstanceRepository.RetrieveSpParamBySpName(lblSPName.Text);
            if (spParams.Rows.Count > 0)
            {
                foreach (DataRow oRow in spParams.Rows)
                {
                    ASPxLabel aLabel = new ASPxLabel();
                    aLabel.Text = oRow["PARAMETER_NAME"].ToString();
                    pnlParameter.Controls.Add(aLabel);

                    Session["txt" + oRow["PARAMETER_NAME"].ToString().Replace("@", "")] = "";
                    ASPxTextBox aText = new ASPxTextBox();
                    aText.ID = "txt" + oRow["PARAMETER_NAME"].ToString().Replace("@", "");
                    aText.Width = 200;
                    if (oRow["DATA_TYPE"].Equals("varchar") || oRow["DATA_TYPE"].Equals("nvarchar") || oRow["DATA_TYPE"].Equals("char"))
                        aText.MaxLength = Convert.ToInt32(oRow["CHARACTER_MAXIMUM_LENGTH"]);
                    pnlParameter.Controls.Add(aText);
                }
            }
        }

        protected void btnExecuteSP_Click(object sender, EventArgs e)
        {
            DateTime startProcess = DateTime.Now;
            DateTime endProcess = new DateTime();

            List<string> lParams = new List<string>();
            foreach (Control lControl in pnlParameter.Controls)
            {
                if (lControl is ASPxLabel)
                {
                    lParams.Add(((ASPxLabel)lControl).Text);
                }
                if (lControl is ASPxTextBox)
                {
                    ASPxTextBox xTextBox = lControl as ASPxTextBox;
                    Session[xTextBox.ID] = xTextBox.Text;
                }
            }

            StringBuilder sbScript = new StringBuilder();
            sbScript.Append("EXEC " + lblSPName.Text);
            foreach (string paramName in lParams)
            {
                sbScript.Append(" " + paramName + " = '" + Session["txt" + paramName.Replace("@", "")] + "',");
            }

            string fullScript = sbScript.ToString().Substring(0, sbScript.ToString().LastIndexOf(','));

            bool isUpdateToComplete = chkUpdate.Checked;

            CheckListInstanceRepository.ExecuteProcessData(fullScript, isUpdateToComplete,
                Convert.ToInt32(Session["id"]), startProcess, endProcess);
        }
    }
}