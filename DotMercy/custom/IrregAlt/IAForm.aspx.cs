using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotWeb.Models;
using DotWeb.Utils;
using DotWeb.Repositories;

using DevExpress.Web;
using DevExpress.WebUtils;
using System.Data;
using System.Collections;
using System.IO;

namespace DotMercy.custom
{
    public partial class IAForm : System.Web.UI.Page
    {
        public const string _ConStr = "AppDb";
        public DataSet ds = null;
        public ASPxComboBox cmbBcModel;
        public ASPxComboBox ddlAssignee;
        public ASPxComboBox ddlDepartment;
        public ASPxComboBox ddlManager;
        public ASPxComboBox ddlStatus;
        public ASPxComboBox ddlStatusAssignee;
        public ASPxUploadControl ucAttachmentReq;
        public ASPxUploadControl ucAttachmentApproval;
        public ASPxTextBox txtTask;
        public ASPxTextBox txtBcPartNumber;
        public ASPxMemo mmBcDescPartNumb;
        public DataTable dataTable;
        public ASPxGridView detailGvDepartment;
        public static string PathFileLoc = "~/custom/FileUpload/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<IAUser> getUserRole = new List<IAUser>();
                getUserRole = IrregAltRepository.GetUserRole(_ConStr, "usp_GetRoleUser", "test06");//Test06 nanti ganti logic get username
                GetDDL();
                try
                {
                    if (Request.QueryString["id"] != null)
                    {
                        GetData(Convert.ToInt32(Request.QueryString["id"]));
                        //if (getUserRole[0].OrgzName != "ENGDOC")
                        //{
                        //    lblHeader.Text = GetLblHeader("Approval");
                        //    FormApproval(false);//Approval
                        //}
                        //else
                        //{
                            lblHeader.Text = GetLblHeader("Edit");
                            FormApproval(true);//Edit Admin
                        //}

                        
                    }
                    else
                    {
                        lblHeader.Text = GetLblHeader("Create");
                        FormApproval(true);//Create
                    }
                }
                catch (Exception exp)
                {
                    AppLogger.LogError(exp);
                }
            }
        }

        #region function logic in Form
        protected string GetLblHeader(string FormCondition)
        {
            string HeaderForm = string.Empty;
            IrregAltRepository repoIrregAlt = new IrregAltRepository();
            HeaderForm = repoIrregAlt.GetTitleHeaderForm(FormCondition);

            return HeaderForm;
        }
        protected void GetDDL()
        {
            try
            {
                ddlTypeIA.DataSource = IrregAltRepository.GetDDLIATypes("[dbo].[usp_GetDDLIAType]");
                ddlTypeIA.ValueField = "TypeIA";
                ddlTypeIA.ValueType = typeof(string);
                ddlTypeIA.TextField = "TypeIA";
                ddlTypeIA.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public string ValidForm()
        {
            string message = string.Empty;

            if (ddlTypeIA.SelectedIndex < 0)
                message = "Please choose type";
            else if (txtIntNumb.Text == string.Empty)
                message = "Please insert Internal EPC Number";
            else if (txtInfNumb.Text == string.Empty)
                message = "Please insert Info Number";
            else if (txtInfForm.Text == string.Empty)
                message = "Please insert Info form";
            else if (string.IsNullOrEmpty(dtPeriodStart.Date.Date.ToString()))
                message = "Please select date start";
            else if (string.IsNullOrEmpty(dtPeriodFins.Date.Date.ToString()))
                message = "Please select date finish";

            return message;
        }
        public void FormApproval(bool flgdisable)
        {
            if (flgdisable == false)
            {
                btnApproval.Visible = true;
                btnSave.Visible = flgdisable;
                btnSendApp.Visible = flgdisable;
            }
            else
            {
                btnApproval.Visible = false;
                btnSave.Visible = flgdisable;
                btnSendApp.Visible = flgdisable;
            }
            txtInfForm.Enabled = flgdisable;
            txtIntNumb.Enabled = flgdisable;
            txtInfNumb.Enabled = flgdisable;
            ddlTypeIA.Enabled = flgdisable;
            mmDesc.Enabled = flgdisable;
            dtPeriodFins.Enabled = flgdisable;
            dtPeriodStart.Enabled = flgdisable;
            gvAffectDepart.Enabled = flgdisable;
            gvAffectedModels.Enabled = flgdisable;
            gvAffectedPart.Enabled = flgdisable;
        }
        public void GetData(int idData)
        {
            IrregAltRepository repoData = new IrregAltRepository();
            List<IAHeaders> getHeader = new List<IAHeaders>();
            getHeader = repoData.GetDataIrregAlt(idData, "usp_GetDataIrregAlt");
            ddlTypeIA.SelectedIndex = repoData.GetDataDDLType(getHeader[0].IAType);
            txtIntNumb.Text = getHeader[0].InternalEpcNumber;
            txtInfNumb.Text = getHeader[0].InfoNumber;
            txtInfForm.Text = getHeader[0].InfoFrom;
            mmDesc.Text = getHeader[0].Description;
            dtPeriodStart.Value = getHeader[0].ValidPeriodFrom.Value.Date;
            dtPeriodFins.Value = getHeader[0].ValidPeriodTo.Value.Date;
            dtImplemenDate.Value = getHeader[0].ImplementationDate.Value.Date;

            chkDync.Checked = getHeader[0].DynamicCheck;

            getHeader[0].DtIaParts = repoData.GetDataTableItem(idData, "usp_GetDataIrregAltPart");
            getHeader[0].DtIaModels = repoData.GetDataTableItem(idData, "usp_GetDataIrregAltModel");
            gvAffectedModels.DataSource = getHeader[0].DtIaModels;
            gvAffectedModels.DataBind();

            gvAffectedPart.DataSource = getHeader[0].DtIaParts;
            gvAffectedPart.DataBind();
        }
        public IAHeaders setDataIA(string btnForm)
        {
            IAHeaders setIA = new IAHeaders();

            string StatusHeader = string.Empty;

            setIA.IAType = ddlTypeIA.SelectedItem.Text;
            setIA.InternalEpcNumber = txtIntNumb.Text;
            setIA.InfoNumber = txtInfNumb.Text;
            setIA.InfoFrom = txtInfForm.Text;
            setIA.Description = mmDesc.Text;
            setIA.ValidPeriodFrom = dtPeriodStart.Date.Date;
            setIA.ValidPeriodTo = dtPeriodFins.Date.Date;
            setIA.AuthorUserId = 1;//user login
            setIA.ApproverUserId = 2;//approver
            setIA.DynamicCheck = chkDync.Checked == true ? chkDync.Checked : false;
            if (btnForm == "Saved")
            {
                StatusHeader = "Draft";
            }
            else if (btnForm == "Send")
            {
                StatusHeader = "Open";
            }
            else
            {
                StatusHeader = "Close";
            }
            setIA.StatusID = StatusHeader;
            if (dtImplemenDate != null)
                setIA.ImplementationDate = dtImplemenDate.Date.Date;


            return setIA;
        }
        private int GetNewId()
        {
            ds = (DataSet)Session["DataSet"];
            DataTable table = ds.Tables[0];
            if (table.Rows.Count == 0) return 0;
            int max = Convert.ToInt32(table.Rows[0]["ID"]);
            for (int i = 1; i < table.Rows.Count; i++)
            {
                if (Convert.ToInt32(table.Rows[i]["ID"]) > max)
                    max = Convert.ToInt32(table.Rows[i]["ID"]);
            }
            return max + 1;
        }
        protected void SavedData(string btnForm, object sender)
        {
            string altMessage = ValidForm();
            IAHeaders setIA = new IAHeaders();
            IrregAltRepository repoIA = new IrregAltRepository();
            DataTable dtGVModel = new DataTable();
            DataTable dtGvPart = new DataTable();
            DataTable dtGVDepartment = new DataTable();
            DataTable dtGVDepartmentDetail = new DataTable();
            int flgStatus = 0;
            if (string.IsNullOrEmpty(altMessage))
            {
                try
                {
                    #region set form IA
                    setIA = setDataIA(btnForm);
                    #endregion

                    #region Insert Datatable
                    dtGVModel.Columns.Add("Id", typeof(string));
                    dtGVModel.Columns.Add("Model", typeof(string));

                    dtGvPart.Columns.Add("Id", typeof(string));
                    dtGvPart.Columns.Add("Part Number", typeof(string));
                    dtGvPart.Columns.Add("Description", typeof(string));

                    dtGVDepartment.Columns.Add("Id", typeof(string));
                    dtGVDepartment.Columns.Add("Department", typeof(string));
                    dtGVDepartment.Columns.Add("Manager", typeof(string));
                    dtGVDepartment.Columns.Add("Task", typeof(string));
                    dtGVDepartment.Columns.Add("Status", typeof(string));

                    dtGVDepartmentDetail.Columns.Add("Id", typeof(string));
                    dtGVDepartmentDetail.Columns.Add("Assignee", typeof(string));
                    dtGVDepartmentDetail.Columns.Add("Status", typeof(string));

                    for (int _loopGv = 0; _loopGv < gvAffectedModels.VisibleRowCount; _loopGv++)
                    {
                        DataRow row = dtGVModel.NewRow();
                        row = dtGVModel.NewRow();
                        var value = gvAffectedModels.GetRowValues(_loopGv, new string[] { gvAffectedModels.KeyFieldName });
                        var valueModel = gvAffectedModels.GetRowValues(_loopGv, "Model");
                        row["Id"] = value;
                        row["Model"] = valueModel.ToString();
                        dtGVModel.Rows.Add(row);
                    }

                    for (int _loopGvPart = 0; _loopGvPart < gvAffectedPart.VisibleRowCount; _loopGvPart++)
                    {
                        DataRow row = dtGvPart.NewRow();
                        row = dtGvPart.NewRow();
                        var value = gvAffectedPart.GetRowValues(_loopGvPart, new string[] { gvAffectedPart.KeyFieldName });
                        var valuePart = gvAffectedPart.GetRowValues(_loopGvPart, "Part Number");
                        var valueDescription = gvAffectedPart.GetRowValues(_loopGvPart, "Description");
                        row["Id"] = _loopGvPart;
                        row["Part Number"] = valuePart.ToString();
                        row["Description"] = valueDescription.ToString();
                        dtGvPart.Rows.Add(row);
                    }

                    for (int _loopGvDp = 0; _loopGvDp < gvAffectDepart.VisibleRowCount; _loopGvDp++)
                    {
                        DataRow row = dtGVDepartment.NewRow();
                        row = dtGVDepartment.NewRow();
                        var value = gvAffectDepart.GetRowValues(_loopGvDp, new string[] { gvAffectDepart.KeyFieldName });
                        row["Id"] = _loopGvDp;
                        row["Model"] = value.ToString();
                        dtGVDepartment.Rows.Add(row);
                    }
                    if (detailGvDepartment != null)
                    {
                        for (int _loopGvDp = 0; _loopGvDp < detailGvDepartment.VisibleRowCount; _loopGvDp++)
                        {
                            DataRow row = dtGVDepartmentDetail.NewRow();
                            row = dtGVDepartmentDetail.NewRow();
                            var value = detailGvDepartment.GetRowValues(_loopGvDp, new string[] { detailGvDepartment.KeyFieldName });
                            row["Id"] = _loopGvDp;
                            row["Model"] = value.ToString();
                            dtGVDepartmentDetail.Rows.Add(row);
                        }
                    }

                    #endregion

                    flgStatus = repoIA.SaveData(_ConStr, "usp_SaveHeaderIA", setIA, dtGVModel, dtGvPart, dtGVDepartment, dtGVDepartmentDetail);

                    if (flgStatus == (int)IrregAltRepository.SaveStatus.Success)
                    {
                        if (btnForm == "Send")
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "ALertMessage('Data has beed sent to assign','true')", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "ALertMessage('Data has beed saved','true')", true);
                        }
                    }
                    if (flgStatus == (int)IrregAltRepository.SaveStatus.Error)
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "ALertMessage('There is some an error, please check input','false')", true);
                }
                catch (Exception excp)
                {
                    AppLogger.LogError(excp);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "ALertMessage('" + altMessage + "','false')", true);
            }
        }
        protected void Approval(string strUserName, int IdIrregAlt)
        {
            IAHeaders setIA = new IAHeaders();
            IrregAltRepository repoIA = new IrregAltRepository();
            setIA.IAId = IdIrregAlt;
            repoIA.ApproveData(strUserName, setIA.IAId, "Approve");
        }
        public string UploadAttachment(UploadedFile ufAttachment)
        {
            DataTable dtAttachment = new DataTable();
            dtAttachment.Columns.Add("Id", typeof(string));
            dtAttachment.Columns.Add("Attachment", typeof(string));
            dtAttachment.Columns.Add("Location", typeof(string));
            dtAttachment.PrimaryKey = new DataColumn[] { dtAttachment.Columns["Id"] };
            DataRow row = dtAttachment.NewRow();
            row = dtAttachment.NewRow();
            List<IAAttachment> listAttachment = new List<IAAttachment>();
            string ret = string.Empty;
            if (!ufAttachment.IsValid)
            {
                ret = string.Empty;
            }
            else
            {

                string path = PathFileLoc + "IrregularAlteration";
                if (!Directory.Exists(Server.MapPath(path)))
                {
                    Directory.CreateDirectory(Server.MapPath(path));
                }

                String UploadDir = path + "/";

                FileInfo fileInfo = new FileInfo(ufAttachment.FileName);
                String fileNameOri = ufAttachment.FileName.ToString().Replace(" ", "_");
                String ext = System.IO.Path.GetExtension(ufAttachment.FileName);
                String fileType = ufAttachment.ContentType.ToString();
                if ((fileNameOri.Length - ext.Length) > 16)
                {
                    fileNameOri = fileNameOri.Substring(0, 16).ToLower() + DateTime.Now.Date.ToString("ddMMMyyyy") + ext;
                }

                //String fileName = String.Format("PL_{0:yyMMddHHmm}_{1}", DateTime.Now, fileNameOri.ToLower());

                String fileName = fileNameOri;

                String resFileName = "";
                if (!File.Exists(UploadDir + fileName))
                {
                    resFileName = Server.MapPath(UploadDir + fileName);
                    ufAttachment.SaveAs(resFileName);
                    row["Id"] = gvAttchmentReq.VisibleRowCount;
                    row["Attachment"] = ufAttachment.FileName;
                    row["Location"] = UploadDir + fileName;
                    row["FileType"] = ext;
                    dtAttachment.Rows.Add(row);
                    IrregAltRepository.SaveAttachmentTemp("usp_SaveTempAttachment", dtAttachment);  
                }

                String fileLabel = fileInfo.Name;

                double fileLength = Convert.ToDouble(ufAttachment.ContentLength / 1024); // kilobyte
            }
            return ret;
        }

        #endregion
        protected void btnSendApp_Click(object sender, EventArgs e)
        {
            SavedData("Send", sender);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SavedData("Saved", sender);
        }
        protected void btnApproval_Click(object sender, EventArgs e)
        {
            IAHeaders IaModel = new IAHeaders();
            IaModel.IAId = Convert.ToInt32(Request.QueryString["id"]);
            Approval("Test07", IaModel.IAId);
        }
        protected void gvAffectedModels_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }
        protected void gvAffectedModels_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("Id", typeof(string));
            dataTable.Columns.Add("Model", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectedModels.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectedModels.GetRowValues(_loopGv, new string[] { gvAffectedModels.KeyFieldName });
                var valueModel = gvAffectedModels.GetRowValues(_loopGv, "Model");
                row["Id"] = _loopGv;
                row["Model"] = valueModel.ToString();
                dataTable.Rows.Add(row);
            }

            if (dataTable.Rows.Count == 0)
            {
                e.NewValues["Id"] = cmbBcModel.SelectedIndex;
                e.NewValues["Model"] = cmbBcModel.SelectedItem.Text;
                row["Id"] = e.NewValues["Id"];
                row["Model"] = e.NewValues["Model"];
                dataTable.Rows.Add(row);
            }
            else
            {
                DataRow rowNew = dataTable.NewRow();
                rowNew["Id"] = (int)dataTable.Rows.Count;
                rowNew["Model"] = cmbBcModel.SelectedItem.Text;
                dataTable.Rows.InsertAt(rowNew, 0);
            }
            gvAffectedModels.CancelEdit();
            e.Cancel = true;
            gvAffectedModels.DataSource = dataTable;
            gvAffectedModels.DataBind();
        }
        protected void gvAffectedModels_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
        }
        protected void cmb_Init(object sender, EventArgs e)
        {
            cmbBcModel = (ASPxComboBox)sender;
            cmbBcModel.DataSource = IrregAltRepository.GetDDLIAModels("usp_GetModel");
            cmbBcModel.ValueField = "IDModel";
            cmbBcModel.ValueType = typeof(Int32);
            cmbBcModel.TextField = "ModelName";
            cmbBcModel.DataBind();
        }
        protected void mmDescrPartNum_Init(object sender, EventArgs e)
        {
            mmBcDescPartNumb = (ASPxMemo)sender;
        }
        protected void txtPartNumb_Init(object sender, EventArgs e)
        {
            txtBcPartNumber = (ASPxTextBox)sender;
        }
        protected void gvAffectedModels_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Model", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectedModels.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectedModels.GetRowValues(_loopGv, new string[] { gvAffectedModels.KeyFieldName });
                var valueModel = gvAffectedModels.GetRowValues(_loopGv, "Model");
                row["Id"] = value;
                row["Model"] = valueModel.ToString();
                dataTable.Rows.Add(row);
            }
            DataRow rowDelete = dataTable.Rows.Find(e.Keys[0]);
            dataTable.Rows.Remove(rowDelete);
            e.Cancel = true;
            gvAffectedModels.DataSource = dataTable;
            gvAffectedModels.DataBind();
        }
        protected void gvAffectedModels_DataBinding(object sender, EventArgs e)
        {
            (sender as ASPxGridView).ForceDataRowType(typeof(int));
        }
        protected void gvAffectedPart_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("Id", typeof(string));
            dataTable.Columns.Add("Part Number", typeof(string));
            dataTable.Columns.Add("Description", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectedPart.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectedPart.GetRowValues(_loopGv, new string[] { gvAffectedPart.KeyFieldName });
                var valuePart = gvAffectedModels.GetRowValues(_loopGv, "Part Number");
                var valueDescription = gvAffectedModels.GetRowValues(_loopGv, "Description");
                row["ID"] = _loopGv;
                row["Part Number"] = valuePart.ToString();
                row["Description"] = valuePart.ToString();
                dataTable.Rows.Add(row);
            }

            if (dataTable.Rows.Count == 0)
            {
                e.NewValues["Id"] = gvAffectedPart.VisibleRowCount;
                e.NewValues["Part Number"] = txtBcPartNumber.Text.ToString();
                e.NewValues["Description"] = mmBcDescPartNumb.Text.ToString();
                row["ID"] = gvAffectedPart.VisibleRowCount;
                row["Part Number"] = e.NewValues["Part Number"];
                row["Description"] = e.NewValues["Description"];
                dataTable.Rows.Add(row);
            }
            else
            {
                DataRow rowNew = dataTable.NewRow();
                rowNew["ID"] = gvAffectedPart.VisibleRowCount;
                rowNew["Part Number"] = txtBcPartNumber.Text.ToString();
                rowNew["Description"] = mmBcDescPartNumb.Text.ToString();
                dataTable.Rows.InsertAt(rowNew, 0);
            }
            gvAffectedPart.CancelEdit();
            e.Cancel = true;
            gvAffectedPart.DataSource = dataTable;
            gvAffectedPart.DataBind();
        }
        protected void gvAffectedPart_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("ID", typeof(string));
            dataTable.Columns.Add("Part Number", typeof(string));
            dataTable.Columns.Add("Description", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectedPart.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectedPart.GetRowValues(_loopGv, new string[] { gvAffectedPart.KeyFieldName });
                var valuePartNumber = gvAffectedPart.GetRowValues(_loopGv, "Part Number");
                var valueDescription = gvAffectDepart.GetRowValues(_loopGv, "Description");
                row["Id"] = value;
                row["Part Number"] = valuePartNumber.ToString();
                row["Description"] = valueDescription.ToString();
                dataTable.Rows.Add(row);
            }
            DataRow rowDelete = dataTable.Rows.Find(e.Keys[0]);
            dataTable.Rows.Remove(rowDelete);
            e.Cancel = true;
            gvAffectedPart.DataSource = dataTable;
            gvAffectedPart.DataBind();
        }
        protected void UcAtthmentReq_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                if (e.IsValid == true)
                    e.CallbackData = this.UploadAttachment(e.UploadedFile);

                string mFileType = "IA";

                //if (GetdataSave_mFileTypeName == "Irregular Alteration")
                //{

                //}

            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }
        protected void gvAffectDepart_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("Id", typeof(string));
            dataTable.Columns.Add("Department", typeof(string));
            dataTable.Columns.Add("Manager", typeof(string));
            dataTable.Columns.Add("Task", typeof(string));
            dataTable.Columns.Add("Status", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectDepart.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectDepart.GetRowValues(_loopGv, new string[] { gvAffectDepart.KeyFieldName });
                var valueDepartment = gvAffectDepart.GetRowValues(_loopGv, "Department");
                var valueManager = gvAffectDepart.GetRowValues(_loopGv, "Manager");
                var valueTask = gvAffectDepart.GetRowValues(_loopGv, "Task");
                var valueStatus = gvAffectDepart.GetRowValues(_loopGv, "Status");

                row["Id"] = _loopGv;
                row["Department"] = valueDepartment.ToString();
                row["Manager"] = valueManager.ToString();
                row["Task"] = valueTask.ToString();
                row["Status"] = valueStatus.ToString();
                dataTable.Rows.Add(row);
            }

            if (dataTable.Rows.Count == 0)
            {
                e.NewValues["Id"] = 0;
                e.NewValues["Department"] = ddlDepartment.SelectedItem.Text;
                e.NewValues["Manager"] = ddlManager.SelectedIndex;
                e.NewValues["Task"] = txtTask.Text;
                e.NewValues["Status"] = ddlStatus.SelectedItem.Text;

                row["Id"] = e.NewValues["Id"];
                row["Department"] = e.NewValues["Department"];
                row["Manager"] = e.NewValues["Manager"];
                row["Task"] = e.NewValues["Task"];
                row["Status"] = e.NewValues["Status"];
                dataTable.Rows.Add(row);
            }
            else
            {
                DataRow rowNew = dataTable.NewRow();
                rowNew["Id"] = (int)dataTable.Rows.Count;
                row["Department"] = ddlDepartment.SelectedItem.Text;
                row["Manager"] = ddlManager.SelectedIndex;
                row["Task"] = txtTask.Text;
                row["Status"] = ddlStatus.SelectedItem.Text;
                dataTable.Rows.InsertAt(rowNew, 0);
            }
            gvAffectDepart.CancelEdit();
            e.Cancel = true;
            gvAffectDepart.DataSource = dataTable;
            gvAffectDepart.DataBind();
        }
        protected void gvAffectDepart_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            dataTable = new DataTable();
            dataTable.Columns.Add("Id", typeof(string));
            dataTable.Columns.Add("Department", typeof(string));
            dataTable.Columns.Add("Manager", typeof(string));
            dataTable.Columns.Add("Task", typeof(string));
            dataTable.Columns.Add("Status", typeof(string));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns["Id"] };
            DataRow row = dataTable.NewRow();
            for (int _loopGv = 0; _loopGv < gvAffectDepart.VisibleRowCount; _loopGv++)
            {
                row = dataTable.NewRow();
                var value = gvAffectDepart.GetRowValues(_loopGv, new string[] { gvAffectDepart.KeyFieldName });
                var valueDepartment = gvAffectDepart.GetRowValues(_loopGv, "Department");
                var valueManager = gvAffectDepart.GetRowValues(_loopGv, "Manager");
                var valueTask = gvAffectDepart.GetRowValues(_loopGv, "Task");
                var valueStatus = gvAffectDepart.GetRowValues(_loopGv, "Status");

                row["Id"] = _loopGv;
                row["Department"] = valueDepartment.ToString();
                row["Manager"] = valueManager.ToString();
                row["Task"] = valueTask.ToString();
                row["Status"] = valueStatus.ToString();
                dataTable.Rows.Add(row);
            }
            DataRow rowDelete = dataTable.Rows.Find(e.Keys[0]);
            dataTable.Rows.Remove(rowDelete);
            e.Cancel = true;
            gvAffectDepart.DataSource = dataTable;
            gvAffectDepart.DataBind();
        }
        protected void gvAffectDepart_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }
        protected void ddlDepartment_Init(object sender, EventArgs e)
        {
            ddlDepartment = (ASPxComboBox)sender;
            ddlDepartment.DataSource = IrregAltRepository.GetDdlDepartment();
            ddlDepartment.ValueField = "IdTaskDepartment";
            ddlDepartment.ValueType = typeof(Int32);
            ddlDepartment.TextField = "NameTaskDepartment";
            ddlDepartment.DataBind();
        }
        protected void ddlManager_Init(object sender, EventArgs e)
        {
            ddlManager = (ASPxComboBox)sender;
            ddlDepartment.DataSource = IrregAltRepository.GetDdlUserApproval(ddlDepartment.SelectedItem.Text);
            ddlDepartment.ValueField = "IdTaskApproval";
            ddlDepartment.ValueType = typeof(Int32);
            ddlDepartment.TextField = "NameApprovalTask";
            ddlDepartment.DataBind();
        }
        protected void txtTask_Init(object sender, EventArgs e)
        {
            txtTask = (ASPxTextBox)sender;
        }
        protected void ddlStatus_Init(object sender, EventArgs e)
        {
            ddlStatus = (ASPxComboBox)sender;
            ddlStatus.DataSource = IrregAltRepository.GetDdlStatus();
            ddlStatus.ValueField = "IdStatusTask";
            ddlStatus.ValueType = typeof(Int32);
            ddlStatus.TextField = "StatusTask";
            ddlStatus.DataBind();

        }
        protected void ucAttachmentAssignee_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {

        }
        protected void ddlAssignee_Init(object sender, EventArgs e)
        {
            ddlAssignee = (ASPxComboBox)sender;
            ddlAssignee.DataSource = IrregAltRepository.GetDdlUserApproval("SectionManager");
            ddlAssignee.ValueField = "IdTaskApproval";
            ddlAssignee.ValueType = typeof(Int32);
            ddlAssignee.TextField = "NameApprovalTask";
            ddlAssignee.DataBind();
        }
        protected void ddlStatusAssignee_Init(object sender, EventArgs e)
        {
            ddlStatusAssignee = (ASPxComboBox)sender;
            ddlStatusAssignee.DataSource = IrregAltRepository.GetDdlStatus();
            ddlStatusAssignee.ValueField = "IdStatusTask";
            ddlStatusAssignee.ValueType = typeof(Int32);
            ddlStatusAssignee.TextField = "StatusTask";
            ddlStatusAssignee.DataBind();
        }
        protected void gvAttchmentReq_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            if (gvAttchmentReq != null)
            {
                IrregAltRepository repo = new IrregAltRepository();
                dataTable = new DataTable();
                dataTable = repo.GetDataTableItem(0, "usp_GetTempAttachment");
                gvAttchmentReq.CancelEdit();
                e.Cancel = true;
                gvAttchmentReq.DataSource = dataTable;
                gvAttchmentReq.DataBind();
            }

        }
        protected void gvAttchmentReq_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }
        protected void UcAtthmentReq_Init(object sender, EventArgs e)
        {
            ucAttachmentReq = (ASPxUploadControl)sender;
            ucAttachmentReq.AutoStartUpload = true;
            ucAttachmentReq.FileUploadComplete += new EventHandler<FileUploadCompleteEventArgs>(UcAtthmentReq_FileUploadComplete);
        }

        protected void detailgvAffectDepart_BeforePerformDataSelect(object sender, EventArgs e)
        {
            detailGvDepartment = (ASPxGridView)sender;
        }

        protected void detailgvAffectDepart_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void detailgvAffectDepart_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //GridViewToexcel.WriteXlsToResponse();
        }


    }
}