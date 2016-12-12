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
    public partial class Modules : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(ModuleGroup));
        }

        protected void gridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (Session["AppId"] != null && Session["AppId"].ToString() == e.Parameters) return;
            Session["AppId"] = e.Parameters;
            gridView.DataBind();
        }

        protected void gridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["AppId"] = Session["AppId"].ToString();
        }

        protected void gridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["AppId"] = Session["AppId"].ToString();
        }

        protected void gridView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "ShowInLeftMenu")
            {
                (e.Editor as ASPxCheckBox).Checked = true;
            }
        }

        protected void appFilterComboBox_DataBound(object sender, EventArgs e)
        {
            if (Session["AppId"] != null)
            {
                foreach (ListEditItem item in appFilterComboBox.Items)
                {
                    if (item.Value.ToString() == Session["AppId"].ToString())
                    {
                        appFilterComboBox.SelectedItem = item;
                        break;
                    }
                }
            }
        }

        protected void modulesGridView_Init(object sender, EventArgs e)
        {
            var grid = sender as ASPxGridView;
            grid.ForceDataRowType(typeof(Module));
        }

        protected void modulesGridView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "ModuleType")
            {
                var comboBox = e.Editor as ASPxComboBox;
                comboBox.DataSource = Enum.GetNames(typeof(ModuleType));
                comboBox.DataBind();
                foreach (ListEditItem item in comboBox.Items)
                {
                    if (item.Value.ToString() == ModuleType.CustomUrl.ToString())
                    {
                        comboBox.SelectedItem = item;
                        comboBox.Enabled = false;
                        break;
                    }
                }
            }
            else if (e.Column.FieldName == "GroupId")
            {
                var comboBox = e.Editor as ASPxComboBox;
                object masterKey = (sender as ASPxGridView).GetMasterRowKeyValue();
                foreach (ListEditItem item in comboBox.Items)
                {
                    if (item.Value.ToString() == masterKey.ToString())
                    {
                        comboBox.SelectedItem = item;
                        break;
                    }
                }
            }
            else if (e.Column.FieldName == "ShowInLeftMenu")
            {
                var checkBox = e.Editor as ASPxCheckBox;
                checkBox.Checked = true;
            }
        }

        protected void modulesGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["GroupId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void modulesGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            // left this blank
        }

        protected void modulesGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            // left this blank
        }

        protected void groupRightsGridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(AccessRight));
        }

        protected void groupRightsGridView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
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

        protected void groupRightsGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["GroupId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void groupRightsGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.ModuleGroup;
            e.NewValues["SecuredObjectId"] = Session["GroupId"];
        }

        protected void groupRightsGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.ModuleGroup;
            e.NewValues["SecuredObjectId"] = Session["GroupId"];
        }

        protected void moduleRightsGridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(AccessRight));
        }

        protected void moduleRightsGridView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            groupRightsGridView_CellEditorInitialize(sender, e);
        }

        protected void moduleRightsGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ModuleId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void moduleRightsGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.Module;
            e.NewValues["SecuredObjectId"] = Session["ModuleId"];
        }

        protected void moduleRightsGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["SecuredObjectType"] = SecuredObjectType.Module;
            e.NewValues["SecuredObjectId"] = Session["ModuleId"];
        }

    }
}