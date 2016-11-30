using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotWeb;
using DotWeb.Repositories;
using System.Collections.Specialized;

namespace DotMercy.custom
{
    public partial class STAHeader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                #region Drop Down User
                List<User> userNameList = UserRepository.getUserName();
                ddlQEP.DataSource = userNameList;
                ddlQEP.TextField = "UserName";
                ddlQEP.ValueField = "Id";
                ddlQEP.DataBind();

                ddlEPC.DataSource = userNameList;
                ddlEPC.TextField = "UserName";
                ddlEPC.ValueField = "Id";
                ddlEPC.DataBind();

                ddlAPC.DataSource = userNameList;
                ddlAPC.TextField = "UserName";
                ddlAPC.ValueField = "Id";
                ddlAPC.DataBind();

                ddlPLG.DataSource = userNameList;
                ddlPLG.TextField = "UserName";
                ddlPLG.ValueField = "Id";
                ddlPLG.DataBind();
                #endregion

                txtIssuedOn.Text = DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture) +
                    ", " + DateTime.Now.ToString("dd") + ", " + DateTime.Now.ToString("yyyy");

                NameValueCollection query = HttpUtility.ParseQueryString(Page.Request.QueryString.ToString());
                if (query["vpm"] != null && query["model"] != null && query["variant"] != null)
                {
                    string date = query["vpm"].Substring(4, 2) + "/" + query["vpm"].Substring(2, 2);
                    //string date = string.Format("{0: MM/yy}", query["vpm"]);
                    int vehicleId = RecordImplemControlRepository.RetrieveVehiclesIdByPM(query["vpm"]);

                    txtTechnicalAlteration.Text = date;
                    txtPackingMonth.Text = date;
                    lblbaumuster.Text = RecordImplemControlRepository.RetrieveBauMusterByModelId(Convert.ToInt32(query["model"]));
                    lblModelName.Text = RecordImplemControlRepository.RetrieveModelNameByModelId(Convert.ToInt32(query["model"]));
                    lblRicNumber.Text = "X" + query["vpm"].Substring(2, 4) + "XX";
                    lblCommnos2.Text = RecordImplemControlRepository.RetrieveProdNumberMinById(vehicleId).ToString();
                    lblCommnos3.Text = RecordImplemControlRepository.RetrieveProdNumberMaxById(vehicleId).ToString();
                    lblCommnosUnits.Text = "(" + (Convert.ToInt32(lblCommnos3.Text) - Convert.ToInt32(lblCommnos2.Text)).ToString() + " units)";
                    lblChassis1.Text = RecordImplemControlRepository.RetrieveChassisNumberMaxById(vehicleId);
                    lblChassis2.Text = RecordImplemControlRepository.RetrieveChassisNumberMinById(vehicleId);
                    txtCodes.Text = RecordImplemControlRepository.GetCodes(vehicleId).ToString();
                    lblOldUntil.Text = date;
                    lblNewFrom.Text = date;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            NameValueCollection query = HttpUtility.ParseQueryString(Page.Request.QueryString.ToString());
            string packingMonth = query["vpm"];
            int model = int.Parse(query["model"]);
            int variant = int.Parse(query["variant"]);
            bool approved;
            if (ddlRemark.SelectedIndex == 0)
                approved = true;
            else
                approved = false;

            try
            {
                RecordImplemControlRepository.SaveSTA(txtIssuer.Text, DateTime.Now, 1, lblRicNumber.Text, "", txtReasonOfAlteration.Text, int.Parse(lblCommnos1.Text),
                    int.Parse(lblCommnos2.Text), int.Parse(lblCommnos3.Text), packingMonth, lblChassis1.Text, "", txtCumulativeFigure.Text,
                    DateTime.Parse(txtImpleDate.Text), DateTime.Now, approved, txtCodes.Text, DateTime.Now, DateTime.Now,
                    ddlEPC.SelectedItem.Text, ddlPLG.SelectedItem.Text, ddlAPC.SelectedItem.Text, ddlQEP.SelectedItem.Text, model, variant);
                
                int Id = RecordImplemControlRepository.GetLastId() + 1;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Data saved successfully !');window.location.assign('STAView.aspx?id=" + Id + "');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Failed to save data, " + ex.Message + " !');", true);
            }
        }
    }
}