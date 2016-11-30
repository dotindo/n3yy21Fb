using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DevExpress.Utils;
using DevExpress.Web;
using DotWeb.Models;
using DotWeb.Repositories;
using NLog;

namespace DotMercy.custom.CheckList
{
    public partial class CheckListInstanceInfo : Page
    {
        private static Logger logger = LogManager.GetCurrentClassLogger();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvInstanceInfo.SettingsDetail.AllowOnlyOneMasterRowExpanded = true;

                if (Request.QueryString.Count > 0)
                {
                    int checkListGroupId = Convert.ToInt32(Request.QueryString["checkListGroupId"]);
                    lblHeader.Text = CheckListInstanceRepository.RetrieveCheckListGroupNameById(checkListGroupId);
                    Session["CheckListGroupId"] = checkListGroupId;

                    HideColumn(checkListGroupId);
                }
                else
                {
                    lblHeader.Text = "All Check List Document";
                }

                cboCheckListTpl.SelectedIndex = 0;
            }
        }

        private void HideColumn(int checkListGroupId)
        {
            switch (checkListGroupId)
            {
                case 1: //STA
                    grvInstanceInfo.Columns["CP View"].Visible = false;
                    grvInstanceInfo.Columns["JobCard Document"].Visible = false;
                    break;
                case 2: //CP
                    grvInstanceInfo.Columns["STA View"].Visible = false;
                    grvInstanceInfo.Columns["RIC Document"].Visible = false;
                    break;
                default:
                    grvInstanceInfo.Columns["CP View"].Visible = false;
                    grvInstanceInfo.Columns["JobCard Document"].Visible = false;
                    grvInstanceInfo.Columns["STA View"].Visible = false;
                    grvInstanceInfo.Columns["RIC Document"].Visible = false;
                    break;
            }
        }

        protected void grvInstanceInfo_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            DataRowView currRow = (DataRowView)grvInstanceInfo.GetRow(e.VisibleIndex);
            string model = (string)grvInstanceInfo.GetRowValues(e.VisibleIndex, "Model");
            string vpm = (string)grvInstanceInfo.GetRowValues(e.VisibleIndex, "PackingMonth");
            string variant = (string)grvInstanceInfo.GetRowValues(e.VisibleIndex, "Variant");
            //string queryStringStd = "?vpm=" + vpm + "&model=" + model + "&variant=" + variant;

            int modelId = ModelRepository.RetrieveModelIdByName(model);
            string vpmId = vpm;
            int variantId = ModelRepository.RetrieveVariantIdByModelIdAndVariantName(modelId, variant);
            string queryStringStd = "?vpm=" + vpmId + "&model=" + modelId + "&variant=" + variantId;
            string queryStringStdAdd = "&vpm=" + vpmId + "&model=" + modelId + "&variant=" + variantId;

            if (e.ButtonID == "btnDelete")
            {
                //int rowIndex = ((ASPxGridView)sender).VisibleStartIndex;
                CheckListInstanceRepository.UpdateInstanceInfoToDeleted(currRow.Row);
                grvInstanceInfo.DataBind();
            }
            else if (e.ButtonID == "OpenSTA")
            {
                ASPxGridView.RedirectOnCallback("~/custom/STAView.aspx" + queryStringStd);
            }
            else if (e.ButtonID == "OpenRIC")
            {
                ASPxGridView.RedirectOnCallback("~/custom/Report/RIC.aspx" + queryStringStd);
            }
            else if (e.ButtonID == "OpenCP")
            {
                ASPxGridView.RedirectOnCallback("~/custom/CPlanMulti.aspx" + queryStringStd);
            }
            else if (e.ButtonID == "OpenJC")
            {
                //ASPxGridView.RedirectOnCallback("~/custom/DownloadFile.aspx?type=jc");
                ASPxGridView.RedirectOnCallback("~/custom/Report/ReportJC.aspx" + queryStringStd);
            }
        }

        protected void grvInstanceInfo_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            ASPxGridView grid = (sender as ASPxGridView);
            int id = (int)grid.GetRowValues(e.VisibleIndex, "Id");
            DotWeb.Models.CheckListInstanceInfo oInfo = CheckListInstanceRepository.RetrieveCurrentInstanceInfoById(id);

            if (e.ButtonID == "OpenSTA")
            {

            }
        }

        protected void grvCheckListStep_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["CheckListMasterId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grvCheckListStep_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            ASPxGridView detailGrid = ((ASPxGridView)sender);
            int id = Convert.ToInt32(detailGrid.GetRowValues(e.VisibleIndex, "Id"));
            CheckListInstanceStep oStep = CheckListInstanceRepository.RetrieveCurrentInstanceStep(id);

            DotWeb.Models.CheckListInstanceInfo oInfo =
                CheckListInstanceRepository.RetrieveCurrentInstanceInfoById(Convert.ToInt32(Session["CheckListMasterId"]));
            ASPxGridView parentGrid = detailGrid.Parent.NamingContainer as ASPxGridView;
            int modelId = ModelRepository.RetrieveModelIdByName(oInfo.Model);
            string vpm = oInfo.PackingMonth;
            int variantId = ModelRepository.RetrieveVariantIdByModelIdAndVariantName(modelId, oInfo.Variant);
            string queryStringStd = "?vpm=" + vpm + "&model=" + modelId + "&variant=" + variantId + "&checkListId=" + id;
            string queryStringStdAdd = "&vpm=" + vpm + "&model=" + modelId + "&variant=" + variantId + "&checkListId=" + id;

            if (e.ButtonID == "btnSetToComplete")
            {
                CheckListInstanceRepository.SetStatusCheckListStep(id, CheckListStatus.Complete);

                detailGrid.DataBind();
                grvInstanceInfo.DataBind();
            }
            else if (e.ButtonID == "btnOpenLink")
            {
                if (oStep != null && oStep.UrlLink != null)
                {
                    if (oStep.UrlLink.Substring(0, 1).Equals("~"))
                    {
                        if (oStep.UrlLink.Contains("?"))
                        {
                            ASPxGridView.RedirectOnCallback(oStep.UrlLink + queryStringStdAdd);
                        }
                        else
                        {
                            ASPxGridView.RedirectOnCallback(oStep.UrlLink + queryStringStd);
                        }
                    }
                    else
                    {
                        detailGrid.JSProperties["cp_redirect"] = oStep.UrlLink;
                    }
                }
            }
            else if (e.ButtonID == "btnExecuteProcess")
            {
                if (oStep.StoreProcedureName != null)
                {
                    ASPxGridView.RedirectOnCallback("CheckListExecuteProcess.aspx?spName=" + oStep.StoreProcedureName + "&id=" + oStep.Id + queryStringStdAdd);
                }
            }
        }

        protected void grvCheckListStep_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "Status")
            {
                if (Convert.ToInt32(e.Value.ToString() == "" ? "1" : e.Value.ToString()) == 1)
                {
                    e.DisplayText = "InComplete";
                }
                else if (Convert.ToInt32(e.Value) == 2)
                {
                    e.DisplayText = "Complete";
                }
            }
            else if (e.Column.FieldName == "UserGroupId")
            {
                e.DisplayText = UserRepository.RetrieveUserGroupNameById(Convert.ToInt32(e.Value));
            }
            else if (e.Column.FieldName == "UserId")
            {
                if (e.Value.ToString() != string.Empty)
                {
                    e.DisplayText = UserRepository.RetrieveUserNameById(Convert.ToInt32(e.Value));
                }
            }
            else if (e.Column.FieldName == "EmailNotification")
            {
                if (e.DisplayText != null && e.DisplayText.Length > 80)
                {
                    e.DisplayText = e.DisplayText.Substring(0, 80);
                }
            }
        }

        protected void grvCheckListStep_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            ASPxGridView grid = (sender as ASPxGridView);
            int id = (int)grid.GetRowValues(e.VisibleIndex, "Id");
            CheckListInstanceStep oStep = CheckListInstanceRepository.RetrieveCurrentInstanceStep(id);

            if (e.ButtonID == "btnSetToComplete")
            {
                if (oStep.Status == (byte)CheckListStatus.Complete)
                {
                    e.Visible = DefaultBoolean.False;
                }
            }
            if (e.ButtonID == "btnOpenLink")
            {
                if (oStep.Status == (byte)CheckListStatus.Complete)
                {
                    e.Visible = DefaultBoolean.False;
                }
                else
                {
                    if (oStep.UrlLink == null)
                    {
                        e.Visible = DefaultBoolean.False;
                    }
                    else
                    {
                        e.Visible = DefaultBoolean.True;
                    }
                }
            }
            if (e.ButtonID == "btnExecuteProcess")
            {
                if (oStep.Status == (byte)CheckListStatus.Complete)
                {
                    e.Visible = DefaultBoolean.False;
                }
                else
                {
                    if (oStep.StoreProcedureName == null)
                    {
                        e.Visible = DefaultBoolean.False;
                    }
                    else
                    {
                        e.Visible = DefaultBoolean.True;
                    }
                }
            }

            //set predecessor
            if (!string.IsNullOrEmpty(oStep.Predecessor))
            {
                if (oStep.Predecessor.Contains(","))
                {
                    int countNotComplete = 0;
                    string[] predSeqNos = oStep.Predecessor.Split(Convert.ToChar(","));
                    foreach (string seqNo in predSeqNos)
                    {
                        bool isCompletePrevPred = CheckListInstanceRepository.CheckIsCompleteStep(
                           oStep.CheckListInstanceInfoId, Convert.ToInt32(seqNo));
                        if (!isCompletePrevPred)
                        {
                            countNotComplete += 1;
                        }
                    }

                    if (countNotComplete > 0)
                    {
                        e.Enabled = false;
                    }
                }
                else
                {
                    int predSeqNo = Convert.ToInt32(oStep.Predecessor);
                    //get prev predecessor based on predSeqNo
                    bool isCompletePrevPred = CheckListInstanceRepository.CheckIsCompleteStep(
                        oStep.CheckListInstanceInfoId, predSeqNo);
                    if (!isCompletePrevPred)
                    {
                        e.Enabled = false;
                    }
                }
            }

            if (e.ButtonID == "btnShowEmail")
            {
                if (!string.IsNullOrEmpty(oStep.EmailNotification))
                {
                    e.Visible = DefaultBoolean.True;
                    e.Enabled = true;
                }
                else
                {
                    e.Visible = DefaultBoolean.False;
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                int chkListInfoTplId = Convert.ToInt32(cboCheckListTpl.SelectedItem.Value);
                string packingMonth = dtPackingMonth.Date.Date.ToString("yyyyMM");
                int modelId = Convert.ToInt32(cboModel.SelectedItem.Value);
                int variantId = Convert.ToInt32(cboModelVariant.SelectedItem.Value);

                if (CheckListInstanceRepository.CreateNewCheckListInstance(chkListInfoTplId, packingMonth, modelId,
                    variantId))
                {
                    Response.Redirect("CheckListInstanceInfo.aspx?checkListGroupId=" +
                                      CheckListInstanceRepository.RetrieveCheckListTemplateInfoById(chkListInfoTplId)
                                          .CheckListGroupId);
                }
                else
                {
                    popupMsg.PopupHorizontalAlign = PopupHorizontalAlign.Center;
                    popupMsg.PopupVerticalAlign = PopupVerticalAlign.Middle;
                    popupMsg.HeaderText = "Error";
                    popupMsg.Text = "Failed create new Check List";
                    popupMsg.ShowOnPageLoad = true;
                }
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                logger.Error(ex.InnerException);
                logger.Error(ex.StackTrace);

                popupMsg.PopupHorizontalAlign = PopupHorizontalAlign.Center;
                popupMsg.PopupVerticalAlign = PopupVerticalAlign.Middle;
                popupMsg.HeaderText = "Error";
                popupMsg.Text = ex.Message; popupMsg.ShowOnPageLoad = true;
            }
        }

        protected void cboModelVariant_Callback(object sender, CallbackEventArgsBase e)
        {
            FillVariantCombo(e.Parameter);
        }

        private void FillVariantCombo(string modelId)
        {
            if (string.IsNullOrEmpty(modelId)) return;

            cboModelVariant.DataSource = ModelRepository.RetrieveVariantByModelId(Convert.ToInt32(modelId));
            cboModelVariant.TextField = "Variant1";
            cboModelVariant.ValueField = "Id";
            cboModelVariant.DataBind();
        }

        protected void popupEmail_OnWindowCallback(object source, PopupWindowCallbackArgs e)
        {
            string[] parameters = e.Parameter.Split(';');
            Session["CheckListStepEmailId"] = parameters[0];
            CheckListInstanceStep oStep =
                CheckListInstanceRepository.RetrieveCurrentInstanceStep(Convert.ToInt32(parameters[0]));
            BindEmailAddressPopup(oStep);
        }

        private void BindEmailAddressPopup(CheckListInstanceStep oStep)
        {
            if (!string.IsNullOrEmpty(oStep.EmailNotification))
            {
                List<EmailNotification> iList = new List<EmailNotification>();

                if (oStep.EmailNotification != null)
                {
                    if (oStep.EmailNotification.Contains(","))
                    {
                        string[] emails = oStep.EmailNotification.Split(',');
                        foreach (string email in emails)
                        {
                            EmailNotification en = new EmailNotification();
                            en.EmailAddress = email;

                            iList.Add(en);
                        }
                    }
                    else
                    {
                        EmailNotification enSingle = new EmailNotification();
                        enSingle.EmailAddress = oStep.EmailNotification;

                        iList.Add(enSingle);
                    }
                }

                grvEmailAddress.DataSource = iList;
                grvEmailAddress.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            CheckListInstanceStep oStep =
                CheckListInstanceRepository.RetrieveCurrentInstanceStep(Convert.ToInt32(Session["CheckListStepEmailId"]));
            if(oStep != null && !string.IsNullOrEmpty(oStep.EmailNotification))
            {
                CheckListInstanceRepository.UpdateCheckListInstanceEmailAddress(txtNewEmail.Text, oStep.Id);
            }

            //refresh get
            oStep = CheckListInstanceRepository.RetrieveCurrentInstanceStep(Convert.ToInt32(Session["CheckListStepEmailId"]));
            BindEmailAddressPopup(oStep);
        }
    }
}