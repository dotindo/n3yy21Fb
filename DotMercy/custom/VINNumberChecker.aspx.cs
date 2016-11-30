using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotWeb.Models;
using DotWeb.Repositories;
using DotWeb.Utils;
using DevExpress.XtraEditors.Controls;
using DevExpress.Web;
using System.Drawing;

namespace DotMercy.custom
{
    public partial class VINNumberChecker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ProductionLine> LineList = VINNumberRepository.getLine();
            ddlLine.DataSource = LineList;
            ddlLine.TextField = "LineName";
            ddlLine.ValueField = "Id";
            ddlLine.DataBind();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBarcode.Text))
            {
                if (VINNumberRepository.CheckSerialNumber(txtBarcode.Text) != "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Already serial number " + txtBarcode.Text + " !');", true);
                }
                else
                {
                    PopupLogin.ShowOnPageLoad = true;
                    PopupLogin.Modal = true;
                    PopupLogin.ModalBackgroundStyle.Opacity = 80;
                    PopupLogin.PopupHorizontalAlign = PopupHorizontalAlign.WindowCenter;
                    PopupLogin.PopupVerticalAlign = PopupVerticalAlign.WindowCenter;
                    PopupLogin.AutoUpdatePosition = true;
                }
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Serial number cannot be empty !');", true);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (VINNumberRepository.CheckUser(txtPassword.Text) != "")
            {
                try
                {
                    //string penerima = "yuhu@daimler.com";
                    //string subjectemail = "Testing Email TIDS";
                    //string email = "Halllooo Tes, blablabla";
                    //EmailNotification.GenerateEmail(penerima, subjectemail, email);
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Check VIN Number data successfully !');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Failed " + ex.Message + " !');", true);
                }
                PopupLogin.ShowOnPageLoad = false;
                PopupLogin.Modal = false;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", @"alert('Invalid authorization key !');", true);
                PopupLogin.ShowOnPageLoad = false;
                PopupLogin.Modal = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            PopupLogin.ShowOnPageLoad = false;
            PopupLogin.Modal = false;
        }
    }
}