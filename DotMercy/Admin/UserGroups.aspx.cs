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
    public partial class UserGroups : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(UserGroup));
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

        protected void gridView_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            if ((string)Session["AppId"] == e.Parameters) return;
            Session["AppId"] = e.Parameters;
            gridView.DataBind();
        }

        protected void gridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["AppId"] = Session["AppId"].ToString();
            e.NewValues["Id"] = Guid.NewGuid().ToString().ToLower();
        }

        protected void gridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["AppId"] = Session["AppId"].ToString();
        }

        protected void gridView_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {

        }

        protected void membersGridView_Init(object sender, EventArgs e)
        {
            var gridView = (sender as ASPxGridView);
            gridView.ForceDataRowType(typeof(UserGroupMembers));
        }

        protected void membersGridView_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
        }

        protected void membersGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["GroupId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void membersGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["GroupId"] = Session["GroupId"].ToString();
        }

        protected void membersGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["GroupId"] = Session["GroupId"].ToString();
        }

        protected void gridView_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {

        }
    }
}