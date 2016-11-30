using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DotWeb.Repositories;
using System.Linq;

namespace DotMercy.custom.ToolManagement
{
    public partial class ToolCalibration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                var iList = ToolCalibrationRepository.RetrieveDataToolCalibration("ToolCalibration_GetData", ValueId.ToString(), ValueInventory.ToString());
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
                var GetDataNmRange = x.FindControl("lblNmRange") as ASPxLabel;
                GetDataNmRange.Text = iList[0].Min.ToString() + '-' + iList[0].Max.ToString() + " Nm";
                var ButtonMarks = x.FindControl("Btn_mark") as ASPxButton;
                //HiddenValueRow.Text = rowIndex.ToString();
                //ButtonMarks.Enabled = false;
                //ASPxLabel lblCalibrationDate = (ASPxLabel)obj.FindControl("lblCalibrationDate");
                // = iList[1].LastVerificationDate;
            }
        }
        public IEnumerable<DateTime> GetDisabledDates()
        {
            List<DateTime> disabledDates = new List<DateTime>();

            disabledDates.Add(new DateTime(DateTime.Today.Year, DateTime.Today.Month, 7));
            disabledDates.Add(new DateTime(DateTime.Today.Year, DateTime.Today.Month, 11));
            disabledDates.Add(new DateTime(DateTime.Today.Year, DateTime.Today.Month, 13));
            disabledDates.Add(new DateTime(DateTime.Today.Year, DateTime.Today.Month, 17));
            disabledDates.Add(new DateTime(DateTime.Today.Year, DateTime.Today.Month, 19));

            return disabledDates;
        }
        #region edit
        //        protected void MarkSaveColaboration(object sender, EventArgs e)
        //        {
        //            //var te = hiddenvalue.Value;
        //            var SumRowData = GridviewToolVerification.VisibleRowCount;
        //            for (int i = 0; i < SumRowData; i++)
        //            {
        //                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
        //                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("ToolSetupId")[i];
        //                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[i];
        //                var iList = ToolCalibrationRepository.RetrieveDataToolCalibration(ValueId.ToString(), ValueInventory.ToString());
        //                var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
        //                if (varGetData != null)
        //                {
        //                    var GetVerDate = varGetData.FindControl("lblVerificationDate") as ASPxLabel;
        //                    var GetToolSetupId = varGetData.FindControl("lblInventoryNumber") as ASPxLabel;
        //                    var GetText_NM = varGetData.FindControl("Text_NM") as ASPxTextBox;
        //                    var GetText_Min = iList[0].Min;
        //                    var GetText_Max = iList[0].Max;
        //                    var GetCollaboration1 = varGetData.FindControl("Text_VerValue1") as ASPxTextBox;
        //                    var GetCollaboration2 = varGetData.FindControl("Text_VerValue2") as ASPxTextBox;
        //                    var GetCollaboration3 = varGetData.FindControl("Text_VerValue3") as ASPxTextBox;
        //                    var GetCollaboration4 = varGetData.FindControl("Text_VerValue4") as ASPxTextBox;
        //                    var GetCollaboration5 = varGetData.FindControl("Text_VerValue5") as ASPxTextBox;
        //                    var GetRemarks = varGetData.FindControl("RemarksDetail") as ASPxMemo;
        //                    var GetCallDate = DateTime.Now;
        //                    var GetDateNext = varGetData.FindControl("DateDetails") as ASPxDateEdit;
        //                    var ValText_VerDate = iList[0].LastVerificationDate.ToString();
        //                    var ValCalNumber = "1";
        //                    var ValTollSetupId = ValueToolSetupId.ToString();
        //                    var ValTollInv = ValueInventory.ToString();
        //                    var ValText_NM = GetText_NM.Text;
        //                    var ValText_Min = GetText_Min.ToString();
        //                    var ValText_Max = GetText_Max.ToString();
        //                    var ValText_Calibration1 = GetCollaboration1.Text;
        //                    var ValText_Calibration2 = GetCollaboration2.Text;
        //                    var ValText_Calibration3 = GetCollaboration3.Text;
        //                    var ValText_Calibration4 = GetCollaboration4.Text;
        //                    var ValText_Calibration5 = GetCollaboration5.Text;
        //                    var ValMemo_Remarks = GetRemarks.Text;
        //                    var NextVerDate = GetDateNext.Text;
        //                    ToolCalibrationRepository.SaveDataToolVerificationMark(ValText_VerDate, ValCalNumber, ValTollSetupId, ValTollInv, ValText_NM, ValText_Min, ValText_Max, ValText_Calibration1, ValText_Calibration2, ValText_Calibration3, ValText_Calibration4, ValText_Calibration5, NextVerDate, ValMemo_Remarks);
        //                }

        //            }




        //            //ASPxGridView grid = new ASPxGridView();
        //            //var rowIndex = grid.DetailRows.VisibleCount;

        //            Response.Redirect(Request.RawUrl);
        //        }


        #endregion
        protected void DateDetails(object sender, CalendarDayCellPreparedEventArgs e)
        {

            if (e.Date.DayOfWeek == DayOfWeek.Sunday || e.Date.DayOfWeek == DayOfWeek.Saturday)
            {
                e.Cell.Attributes["style"] = "pointer-events: none; background-color: gray";
            }
            //var SumRowData = GridviewToolVerification.VisibleRowCount;
            //for (int i = 0; i < SumRowData; i++)
            //{
            //    var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
            //    var GetDate = varGetData.FindControl("Text_VerValue1") as ASPxDateEdit;
            //    GetDate.DisabledDates.AddRange(GetDisabledDates());
            //}
        }
        protected void MarkAsCrapSave(object sender, EventArgs e)
        {
            //var te = hiddenvalue.Value;
            var SumRowData = GridviewToolVerification.VisibleRowCount;
            for (int i = 0; i < SumRowData; i++)
            {
                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[i];
                var iList = ToolCalibrationRepository.RetrieveDataToolCalibration("ToolCalibration_GetData", ValueId.ToString(), ValueInventory.ToString());
                var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
                if (varGetData != null)
                {
                    var GetVerDate = varGetData.FindControl("lblVerificationDate") as ASPxLabel;
                    var GetToolSetupId = varGetData.FindControl("lblInventoryNumber") as ASPxLabel;
                    var GetText_NM = iList[0].SetNM;
                    var GetText_Min = iList[0].Min;
                    var GetText_Max = iList[0].Max;
                    var GetCollaboration1 = varGetData.FindControl("Text_VerValue1") as ASPxTextBox;
                    var GetCollaboration2 = varGetData.FindControl("Text_VerValue2") as ASPxTextBox;
                    var GetCollaboration3 = varGetData.FindControl("Text_VerValue3") as ASPxTextBox;
                    var GetCollaboration4 = varGetData.FindControl("Text_VerValue4") as ASPxTextBox;
                    var GetCollaboration5 = varGetData.FindControl("Text_VerValue5") as ASPxTextBox;
                    var GetRemarks = varGetData.FindControl("RemarksDetail") as ASPxMemo;
                    var GetCallDate = DateTime.Now;
                    var GetDateNext = varGetData.FindControl("DateDetails") as ASPxDateEdit;
                    var ValText_VerDate = iList[0].LastVerificationDate.ToString();
                    var ValCalNumber = "1";
                    var ValTollSetupId = ValueToolSetupId.ToString();
                    var ValTollInv = ValueInventory.ToString();
                    var ValText_NM = GetText_NM.ToString();
                    var ValText_Min = GetText_Min.ToString();
                    var ValText_Max = GetText_Max.ToString();
                    var ValText_Calibration1 = GetCollaboration1.Text;
                    var ValText_Calibration2 = GetCollaboration2.Text;
                    var ValText_Calibration3 = GetCollaboration3.Text;
                    var ValText_Calibration4 = GetCollaboration4.Text;
                    var ValText_Calibration5 = GetCollaboration5.Text;
                    var ValMemo_Remarks = GetRemarks.Text;
                    var NextVerDate = GetDateNext.Text;
                    ToolCalibrationRepository.SaveDataToolVerificationMark(ValText_VerDate, ValCalNumber, ValTollSetupId, ValTollInv, ValText_NM, ValText_Min, ValText_Max, ValText_Calibration1, ValText_Calibration2, ValText_Calibration3, ValText_Calibration4, ValText_Calibration5, NextVerDate, ValMemo_Remarks);
                }

            }
        }

        protected void SaveCalibration(object sender, EventArgs e)
        {
            //var te = hiddenvalue.Value;
            var SumRowData = GridviewToolVerification.VisibleRowCount;
            for (int i = 0; i < SumRowData; i++)
            {
                var ValueId = GridviewToolVerification.GetCurrentPageRowValues("Id")[i];
                var ValueToolSetupId = GridviewToolVerification.GetCurrentPageRowValues("ToolSetupId")[i];
                var ValueInventory = GridviewToolVerification.GetCurrentPageRowValues("InventoryNumber")[i];
                var iList = ToolCalibrationRepository.RetrieveDataToolCalibration("ToolCalibration_GetData", ValueId.ToString(), ValueInventory.ToString());
                var varGetData = GridviewToolVerification.FindDetailRowTemplateControl(i, "LayoutDetails") as ASPxFormLayout;
                if (varGetData != null)
                {
                    var GetVerDate = varGetData.FindControl("lblVerificationDate") as ASPxLabel;
                    var GetToolSetupId = varGetData.FindControl("lblInventoryNumber") as ASPxLabel;
                    var GetText_NM = iList[0].SetNM;
                    var GetText_Min = iList[0].Min;
                    var GetText_Max = iList[0].Max;
                    var GetCollaboration1 = varGetData.FindControl("Text_VerValue1") as ASPxTextBox;
                    var GetCollaboration2 = varGetData.FindControl("Text_VerValue2") as ASPxTextBox;
                    var GetCollaboration3 = varGetData.FindControl("Text_VerValue3") as ASPxTextBox;
                    var GetCollaboration4 = varGetData.FindControl("Text_VerValue4") as ASPxTextBox;
                    var GetCollaboration5 = varGetData.FindControl("Text_VerValue5") as ASPxTextBox;
                    var GetRemarks = varGetData.FindControl("RemarksDetail") as ASPxMemo;
                    var GetCallDate = DateTime.Now;
                    var GetDateNext = varGetData.FindControl("DateDetails") as ASPxDateEdit;
                    var ValText_VerDate = iList[0].LastVerificationDate.ToString();
                    var ValCalNumber = "1";
                    var ValTollSetupId = ValueToolSetupId.ToString();
                    var ValTollInv = ValueInventory.ToString();
                    var ValText_NM = GetText_NM.ToString();
                    var ValText_Min = GetText_Min.ToString();
                    var ValText_Max = GetText_Max.ToString();
                    var ValText_Calibration1 = GetCollaboration1.Text;
                    var ValText_Calibration2 = GetCollaboration2.Text;
                    var ValText_Calibration3 = GetCollaboration3.Text;
                    var ValText_Calibration4 = GetCollaboration4.Text;
                    var ValText_Calibration5 = GetCollaboration5.Text;
                    var ValMemo_Remarks = GetRemarks.Text;
                    var NextVerDate = GetDateNext.Text;
                    ToolCalibrationRepository.SaveDataToolVerification(ValText_VerDate, ValCalNumber, ValTollSetupId, ValTollInv, ValText_NM, ValText_Min, ValText_Max, ValText_Calibration1, ValText_Calibration2, ValText_Calibration3, ValText_Calibration4, ValText_Calibration5, NextVerDate, ValMemo_Remarks);
                }

            }
        }
    }
}