using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using DotWeb;
using DotWeb.Models;
using DotWeb.Repositories;

namespace DotMercy.custom.CheckList
{
    public partial class CheckListTemplateInfo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void UpdateRow(int i)
        {
            SqlDataSource sqlDS = new SqlDataSource();
            AppDb appDb = new AppDb();
            sqlDS.ConnectionString = appDb.Database.Connection.ConnectionString;

            sqlDS.UpdateCommand = "UPDATE [CheckListTemplateInfo] SET IsActive = 0 WHERE Id=@Id";
            sqlDS.UpdateParameters.Add("Id", i.ToString());
            sqlDS.Update();
        }

        protected void grvCheckListTemplateInfo_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            int id = (int)e.Keys[0];
            UpdateRow(Convert.ToInt32(id));
            e.Cancel = true;
        }

        protected void grvCheckListTemplateInfo_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IsActive"] = 1;
            e.NewValues["CreatedDate"] = DateTime.Now;
        }

        protected void grvCLTemplateStep_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var id = (sender as ASPxGridView).GetMasterRowKeyValue();
            e.NewValues["CheckListTemplateInfoId"] = id;
            e.NewValues["RowStatus"] = 1;
            e.NewValues["CreatedDate"] = DateTime.Now;
        }

        protected void grvCLTemplateStep_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["CheckListTemplateInfoId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grvCLTemplateStep_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            ASPxGridView gridDetail = sender as ASPxGridView;
            if (gridDetail.IsEditing)
            {
                if (e.Column.FieldName == "UserId")
                {
                    if (e.KeyValue == DBNull.Value || e.KeyValue == null) return;
                    object val = gridDetail.GetRowValuesByKeyValue(e.KeyValue, "UserGroupId");
                    if (val == DBNull.Value) return;
                    string groupId = val.ToString();
                    ASPxComboBox combo = e.Editor as ASPxComboBox;
                    FillUserByGroup(combo, groupId);

                    combo.Callback += new CallbackEventHandlerBase(cmbUserId_OnCallback);
                }
            }
            //if (!grvCheckListTemplateInfo.IsEditing || e.Column.FieldName != "UserId") return;

            //if (e.KeyValue == DBNull.Value || e.KeyValue == null) return;
            //object val = grvCheckListTemplateInfo.GetRowValuesByKeyValue(e.KeyValue, "UserGroupId");
            //if (val == DBNull.Value) return;
            //string groupId = (string)val;

            //ASPxComboBox combo = e.Editor as ASPxComboBox;
            //FillUserByGroup(combo, groupId);

            //combo.Callback += new CallbackEventHandlerBase(cmbUserId_OnCallback);
        }

        private void FillUserByGroup(ASPxComboBox cmb, string groupId)
        {
            if (string.IsNullOrEmpty(groupId)) return;

            List<User> userList = GetUserByGroupId(groupId);
            cmb.Items.Clear();
            cmb.DataSource = userList;
            cmb.TextField = "UserName";
            cmb.ValueField = "Id";
            cmb.DataBind();
        }

        private List<User> GetUserByGroupId(string groupId)
        {
            return UserRepository.RetrieveUsersByGroupId(groupId);
        }

        private void cmbUserId_OnCallback(object sender, CallbackEventArgsBase e)
        {
            FillUserByGroup(sender as ASPxComboBox, e.Parameter);
        }

        protected void grvCLTemplateStep_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "UserId")
            {
                if (e.Value != null)
                {
                    if (e.Value.ToString() != string.Empty)
                        e.DisplayText = ""; //UserRepository.RetrieveUserNameById(e.Value);
                }
            }
        }
    }
}