using System;
using System.Web.UI;
using DevExpress.Web;
using DotWeb.Repositories;

namespace DotMercy.custom.CheckList
{
    public partial class CreateCheckListInstance : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cboModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboModelVariant.DataSource = SqlDsModelVariant;
            cboModelVariant.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                int chkListInfoTplId = Convert.ToInt32(cboCheckListTpl.SelectedItem.Value);
                string packingMonth = Convert.ToDateTime(dtPackingMonth.Value).ToString("yyyyMM");
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
                popupMsg.PopupHorizontalAlign = PopupHorizontalAlign.Center;
                popupMsg.PopupVerticalAlign = PopupVerticalAlign.Middle;
                popupMsg.HeaderText = "Error";
                popupMsg.Text = ex.Message; popupMsg.ShowOnPageLoad = true;
            }
        }
    }
}