using DevExpress.Web;
using DotWeb;
using DotWeb.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotMercy.Admin
{
    public partial class Apps : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(App));
        }

        protected void gridView_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            GridViewHelper.gridView_CustomColumnDisplayText(sender, e, schemaInfo.App.GridTextColumnMaxLength);
        }

        protected void accessRightsGridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(AccessRight));
        }

        protected void accessRightsGridView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "PrincipalType")
            {
                var comboBox = e.Editor as ASPxComboBox;
                comboBox.DataSource = Enum.GetNames(typeof(PrincipalType));
                comboBox.DataBind();
            }
            else if (e.Column.FieldName == "PrincipalId")
            {
                object val = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "PrincipalType");
                if (val == null)
                    val = "Group";
                ASPxComboBox comboBox = e.Editor as ASPxComboBox;
                FillPrincipalIdCombo(comboBox, val.ToString());
                comboBox.Callback += comboBox_Callback;
            }
        }

        void comboBox_Callback(object sender, CallbackEventArgsBase e)
        {
            FillPrincipalIdCombo(sender as ASPxComboBox, e.Parameter);
        }

        void FillPrincipalIdCombo(ASPxComboBox comboBox, string principalType)
        {
            if (principalType == "User")
            {
                using (var context = new DotWebDb())
                {
                    var users = context.Users.ToList();
                    comboBox.DataSource = users;
                    comboBox.ValueField = "Id";
                    comboBox.TextField = "UserName";
                    comboBox.DataBind();
                }
            }
            else if (principalType == "Group")
            {
                using (var context = new DotWebDb())
                {
                    int appId = int.Parse(Session["AppId"].ToString());
                    var userGroups = context.UserGroups.Where(g => g.AppId == appId).ToList();
                    comboBox.DataSource = userGroups;
                    comboBox.ValueField = "Id";
                    comboBox.TextField = "GroupName";
                    comboBox.DataBind();
                }
            }
        }

        protected void accessRightsGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["AppId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void accessRightsGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.App;
            e.NewValues["SecuredObjectId"] = Session["AppId"];
        }

        protected void accessRightsGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.App;
            e.NewValues["SecuredObjectId"] = Session["AppId"];
        }

    }
}