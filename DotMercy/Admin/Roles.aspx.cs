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
    public partial class Roles : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void gridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(Role));
        }

        protected void gridView_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            if ((string)Session["AppId"] == e.Parameters) return;
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

        protected void gridView_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {

        }

        protected void permissionsGridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(Permission));
        }

        protected void permissionsGridView_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "PermissionType")
            {
                var comboBox = e.Editor as ASPxComboBox;
                comboBox.DataSource = Enum.GetNames(typeof(PermissionType));
                comboBox.DataBind();
            }
        }

        protected void permissionsGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["RoleId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void permissionsGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["RoleId"] = Session["RoleId"].ToString();
        }

        protected void permissionsGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["RoleId"] = Session["RoleId"].ToString();
        }
    }
}