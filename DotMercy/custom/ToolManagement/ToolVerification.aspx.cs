using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI;
using DevExpress.Web;
using DotWeb.Repositories;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


namespace DotMercy.custom.ToolManagement
{
    public partial class ToolVerification : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           // var x = GridviewToolVerification.FindDetailRowTemplateControl(rowIndex, "LayoutDetails") as ASPxFormLayout;
           
           
        }
        protected void detailGrid_DataSelect(object sender, EventArgs e)
        {
            //Session["Id"] = ASPxGridView1.GetCurrentPageRowValues("Id");
            //Session["InventoryNumber"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            //ToolVerificationRepository.RetrieveDataToolVerification(1, 1);

        }

        protected void DetailChangedTes(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            ASPxGridView some = (ASPxGridView)sender;
            var colapse = some.DetailRows.VisibleCount;
            if (colapse == 1)
            {
                IList<ToolVerification> result = new List<ToolVerification>();
                var rowIndex = e.VisibleIndex;
                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[rowIndex];
                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[rowIndex];
                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("Id")[rowIndex];
                var iList = ToolVerificationRepository.RetrieveDataToolVerification("ToolVerification_GetData", ValueId.ToString(), ValueInventory.ToString());
                // foreach(gridv)

                //ASPxFormLayout obj = sender as ASPxFormLayout;
                var x = GridviewToolVerification.FindDetailRowTemplateControl(rowIndex, "LayoutDetails") as ASPxFormLayout;
                //var y = x.TemplateControl.FindControl("lblCalibrationDate");
                var GetDataCalibrationDate = x.FindControl("lblCalibrationDate") as ASPxLabel;
                GetDataCalibrationDate.Text = iList[0].LastCalibrationDate.ToString();
                var GetDataLastVerificationDate = x.FindControl("lblVerificationDate") as ASPxLabel;
                GetDataLastVerificationDate.Text = iList[0].LastVerificationDate.ToString();
                var GetDataToolNumber = x.FindControl("lblToolNumber") as ASPxLabel;
                GetDataToolNumber.Text = iList[0].ToolNumber.ToString();
                var GetDataInventoryNumber = x.FindControl("lblInventoryNumber") as ASPxLabel;
                GetDataInventoryNumber.Text = iList[0].ToolNumber.ToString() + '/' + ValueToolSetupId;
                var ButtonMarks = x.FindControl("Btn_mark") as ASPxButton;
                hiddenvalue.Value = (0).ToString();
                //HiddenValueRow.Text = rowIndex.ToString();
                //ButtonMarks.Enabled = false;
                //ASPxLabel lblCalibrationDate = (ASPxLabel)obj.FindControl("lblCalibrationDate");
                // = iList[1].LastVerificationDate;
            }
        }

        protected void Btn_mark_Click(object sender, EventArgs e)
        {

            
            //var te = hiddenvalue.Value;
            var SumRowData = GridviewToolVerification.VisibleRowCount;
            for (int i = 0; i < SumRowData; i++)
            {  
                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[i];
                var iList = ToolVerificationRepository.RetrieveDataToolVerification("ToolVerification_GetData", ValueId.ToString(), ValueInventory.ToString());
                var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
                if (varGetData != null)
                {
                    var GetVerDate = varGetData.FindControl("lblVerificationDate") as ASPxLabel;
                    var GetToolSetupId = varGetData.FindControl("lblInventoryNumber") as ASPxLabel;
                    var GetText_NM = varGetData.FindControl("Text_NM") as ASPxTextBox;
                    var GetText_Min = varGetData.FindControl("Text_Min") as ASPxTextBox;
                    var GetText_Max = varGetData.FindControl("Text_Max") as ASPxTextBox;
                    var GetVerification1 = varGetData.FindControl("Text_VerValue1") as ASPxTextBox;
                    var GetVerification2 = varGetData.FindControl("Text_VerValue2") as ASPxTextBox;
                    var GetVerification3 = varGetData.FindControl("Text_VerValue3") as ASPxTextBox;
                    var ValText_VerDate = iList[0].LastVerificationDate.ToString();
                    var ValCalNumber = "1";
                    var ValTollSetupId = ValueToolSetupId.ToString();
                    var ValTollInv = ValueInventory.ToString();
                    var ValText_NM = GetText_NM.Text;
                    var ValText_Min = GetText_Min.Text;
                    var ValText_Max = GetText_Max.Text;
                    var ValText_Verification1 = GetVerification1.Text;
                    var ValText_Verification2 = GetVerification2.Text;
                    var ValText_Verification3 = GetVerification3.Text;
                    ToolVerificationRepository.SaveDataToolVerificationMark("ToolVerificationInsert", ValText_VerDate, ValCalNumber, ValTollSetupId, ValTollInv, ValText_NM, ValText_Min, ValText_Max, ValText_Verification1, ValText_Verification2, ValText_Verification3, "0", "", ValTollInv, "0");
                }
               
            }
         

           
            
            //ASPxGridView grid = new ASPxGridView();
            //var rowIndex = grid.DetailRows.VisibleCount;

            Response.Redirect(Request.RawUrl);
        }

        protected void Btn_Save(object sender, EventArgs e)
        {
  //var te = hiddenvalue.Value;
            var SumRowData = GridviewToolVerification.VisibleRowCount;
            for (int i = 0; i < SumRowData; i++)
            {
                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[i];
                var iList = ToolVerificationRepository.RetrieveDataToolVerification("ToolVerification_GetData",ValueId.ToString(), ValueInventory.ToString());
                var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
                if (varGetData != null)
                {
                    var GetVerDate = varGetData.FindControl("lblVerificationDate") as ASPxLabel;
                    var GetToolSetupId = varGetData.FindControl("lblInventoryNumber") as ASPxLabel;
                    var GetText_NM = varGetData.FindControl("Text_NM") as ASPxTextBox;
                    var GetText_Min = varGetData.FindControl("Text_Min") as ASPxTextBox;
                    var GetText_Max = varGetData.FindControl("Text_Max") as ASPxTextBox;
                    var GetVerification1 = varGetData.FindControl("Text_VerValue1") as ASPxTextBox;
                    var GetVerification2 = varGetData.FindControl("Text_VerValue2") as ASPxTextBox;
                    var GetVerification3 = varGetData.FindControl("Text_VerValue3") as ASPxTextBox;
                    var ValText_VerDate = iList[0].LastVerificationDate.ToString();
                    var ValCalNumber = "1";
                    var ValTollSetupId = ValueToolSetupId.ToString();
                    var ValTollInv = ValueInventory.ToString();
                    var ValText_NM = GetText_NM.Text;
                    var ValText_Min = GetText_Min.Text;
                    var ValText_Max = GetText_Max.Text;
                    var ValText_Verification1 = GetVerification1.Text;
                    var ValText_Verification2 = GetVerification2.Text;
                    var ValText_Verification3 = GetVerification3.Text;
                    ToolVerificationRepository.SaveDataToolVerification(ValText_VerDate, ValCalNumber, ValTollSetupId, ValTollInv, ValText_NM, ValText_Min, ValText_Max, ValText_Verification1, ValText_Verification2, ValText_Verification3, "0", "", ValTollInv, "0");
                }
            }
            Response.Redirect(Request.RawUrl);
        }

        
       


      

       

      

       
       
    }
}