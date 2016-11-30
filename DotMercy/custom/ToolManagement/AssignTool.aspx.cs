using DotWeb.Repositories;
using System;
using System.Data;
using System.Web.UI;

namespace DotMercy.custom.ToolManagement
{
    public partial class AssignTool : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //GV_AssignToolProcess.KeyFieldName = "IdControlPlan";
            if (!IsPostBack)
            {
                GetDDLToolNumber();
                GetDDLProductionLine();
                GetDDLStation();
                GetModel();
              
              //  
                //GV_AssignToolProcess.StartEdit(1);
            }
            //if (GV_AssignToolProcess.IsEditing == true)
            //{
            //    GV_AssignToolProcess.StartEdit(2);
            //}
        }

        #region GetComboBox
        protected void GetDDLToolNumber()
        {
            try
            {
                ComboBox_ToolNumber.DataSource = AssignToolRepository.RetrieveDDLToolNumber();
                ComboBox_ToolNumber.TextField = "ToolNumber";
                ComboBox_ToolNumber.ValueField = "ToolSetupId";
                ComboBox_ToolNumber.Value = "-Select-";
                //ComboBox_ToolNumber.Value = "ToolSetupId";
                //ComboBox_ToolNumber.ID = "ToolSetupId";
                ComboBox_ToolNumber.DataBind();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        protected void GetDDLProductionLine()
        {
            try
            {
                ComboBox_ProductionLine.DataSource = AssignToolRepository.RetrieveProdLine();
                ComboBox_ProductionLine.TextField = "ProductionLine";
                ComboBox_ProductionLine.Value = "-Select-";
                ComboBox_ProductionLine.DataBind();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        protected void GetDDLStation()
        {
            try
            {
                ComboBox_Station.DataSource = AssignToolRepository.RetrieveStation();
                ComboBox_Station.TextField = "StationName";
                ComboBox_Station.Value = "-Select-";
                ComboBox_Station.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
       
        protected void GetModel()
        {
            ComboBox_Model.DataSource = AssignToolRepository.RetrieveModel();
            ComboBox_Model.TextField = "ModelName";
            ComboBox_Model.ValueField = "ModelId";
            ComboBox_Model.Value = "-Select-";
            ComboBox_Model.DataBind();
        }
        #endregion

        protected void SelectedChangedToolNumber(object sender, EventArgs e)
        {
            ComboBox_InventoryNumber.DataSource = AssignToolRepository.RetrieveDDLInventoryNumber((ComboBox_ToolNumber.SelectedItem.Text).ToString());
            ComboBox_InventoryNumber.TextField = "InventoryNumber";
            ComboBox_InventoryNumber.Value = "-Select-";
            ComboBox_InventoryNumber.DataBind();
        }

        protected void SelectedChangedModelVariant(object sender, EventArgs e)
        {
            ComboBox_ModelVariant.DataSource = AssignToolRepository.RetrieveModelVariant((ComboBox_Model.SelectedItem.Value).ToString());
            ComboBox_ModelVariant.TextField = "VariantName";
            ComboBox_ModelVariant.Value = "-Select-";
            ComboBox_ModelVariant.ValueField = "Id";
            ComboBox_ModelVariant.DataBind();
        }

        protected void ShowGv(object sender, EventArgs e)
        {
            DataTable dtIrregAlt = new DataTable();
            
            AssignToolRepository repoIrregAlt = new AssignToolRepository();
            dtIrregAlt = repoIrregAlt.RetrieveGridData("AssignTool_Gv_GetData",
                (ComboBox_Model.SelectedItem.Value).ToString(), (ComboBox_ModelVariant.SelectedItem.Value).ToString(),
                Convert.ToDateTime(dtPackingMonth.Value).ToString("yyyyMM"),
                (ComboBox_Station.SelectedItem.Value).ToString(), ComboBox_InventoryNumber.SelectedItem.Value.ToString(),
                ComboBox_ToolNumber.SelectedItem.Value.ToString(), ComboBox_ProductionLine.SelectedItem.Text);
            //GV_AssignToolProcess.DataSource = AssignToolRepository.RetrieveGridData(ComboBox_Model.SelectedItem.Value,ComboBox_ModelVariant.SelectedItem.Value,ComboBox_PackingMonth.SelectedItem.Value,ComboBox_Station.SelectedItem.Value,ComboBox_InventoryNumber.SelectedItem.Value,ComboBox_ToolNumber.SelectedItem.Value,ComboBox_ProductionLine.SelectedItem.Text)
            //GV_AssignToolProcess.DataSource = AssignToolRepository.RetrieveGridData((ComboBox_Model.SelectedItem.Value).ToString(), (ComboBox_ModelVariant.SelectedItem.Value).ToString(), (ComboBox_PackingMonth.SelectedItem.Value).ToString(), (ComboBox_Station.SelectedItem.Value).ToString(), ComboBox_InventoryNumber.SelectedItem.Value.ToString(), ComboBox_ToolNumber.SelectedItem.Value.ToString(), ComboBox_ProductionLine.SelectedItem.Text);
            //GV_AssignToolProcess.KeyFieldName = "IdControlPlan3";
            dtIrregAlt.PrimaryKey = new DataColumn[] { dtIrregAlt.Columns["Id"] };
            GV_AssignToolProcess.DataSource = dtIrregAlt;
            GV_AssignToolProcess.KeyFieldName = "Id";
            GV_AssignToolProcess.DataBind();
        }

        protected void SaveGv(object sender, EventArgs e)
        {
          
            var SumRowData = GV_AssignToolProcess.VisibleRowCount;
            for (int i = 0; i < SumRowData; i++)
            {
              var GetData = GV_AssignToolProcess;
              var DataToolId = GV_AssignToolProcess.GetCurrentPageRowValues("Id")[i];
              var ValueCheck = GV_AssignToolProcess.GetCurrentPageRowValues("IsAssign")[i];
              var IdTool = GV_AssignToolProcess.GetCurrentPageRowValues("ToolInventoryId")[i];
              var IdControlPlanTool = GV_AssignToolProcess.GetCurrentPageRowValues("ControlPlanTool")[i];
              AssignToolRepository.SaveGrid(DataToolId.ToString(), IdTool.ToString(), IdControlPlanTool.ToString());
            }
        }

        protected void GV_AssignToolProcess_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            
          //  DataTable dtIrregAlt = new DataTable();
          //  dtIrregAlt.
            DataTable Data = new DataTable();
            var SumRowData = GV_AssignToolProcess.VisibleRowCount;
            Data.Columns.Add("IsAssign", typeof(string));
            Data.Columns.Add("Id", typeof(string));
            Data.Columns.Add("AssemblyProcessName", typeof(string));
            Data.Columns.Add("AssemblyProcessNo", typeof(string));
            Data.Columns.Add("ControlPlanTool", typeof(string));
            Data.Columns.Add("ToolInventoryId", typeof(string));
            for (int i = 0; i < SumRowData; i++)
            {
                var dataIsAssign = GV_AssignToolProcess.GetCurrentPageRowValues("IsAssign")[i];
                var dataId = GV_AssignToolProcess.GetCurrentPageRowValues("Id")[i];
                var dataDescription = GV_AssignToolProcess.GetCurrentPageRowValues("AssemblyProcessName")[i];
                var dataNo = GV_AssignToolProcess.GetCurrentPageRowValues("AssemblyProcessNo")[i];
                var dataIdControlPlan = GV_AssignToolProcess.GetCurrentPageRowValues("ControlPlanTool")[i];
                var dataIdToolInventory = GV_AssignToolProcess.GetCurrentPageRowValues("ToolInventoryId")[i];
                Data.Rows.Add(dataIsAssign, dataId, dataDescription, dataNo, dataIdControlPlan, dataIdToolInventory);
            }
            for (int i = 0; i < SumRowData; i++)
            {
                var IndexDatatable = e.NewValues[3].ToString();
                var IndexGrid = GV_AssignToolProcess.GetCurrentPageRowValues("Id")[i].ToString();
                if (IndexDatatable == IndexGrid)
                {
                    Data.Rows[i].SetField("IsAssign", e.NewValues[0]);
                }
            }
            var datax = Data;
            Data.PrimaryKey = new DataColumn[] { Data.Columns["Id"] };
            GV_AssignToolProcess.CancelEdit();
            e.Cancel = true;
            GV_AssignToolProcess.DataSource = Data;
            GV_AssignToolProcess.KeyFieldName = "Id";
            GV_AssignToolProcess.DataBind();
         
         
               
        }

        protected void GV_AssignToolProcess_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            DataTable Data = new DataTable();
            var SumRowData = GV_AssignToolProcess.VisibleRowCount;
            Data.Columns.Add("IsAssign", typeof(string));
            Data.Columns.Add("Id", typeof(string));
            Data.Columns.Add("AssemblyProcessName", typeof(string));
            Data.Columns.Add("AssemblyProcessNo", typeof(string));
            Data.Columns.Add("ControlPlanTool", typeof(string));
            Data.Columns.Add("ToolInventoryId", typeof(string));
            for (int i = 0; i < SumRowData; i++)
            {
                var dataIsAssign = GV_AssignToolProcess.GetCurrentPageRowValues("IsAssign")[i];
                var dataId = GV_AssignToolProcess.GetCurrentPageRowValues("Id")[i];
                var dataDescription = GV_AssignToolProcess.GetCurrentPageRowValues("AssemblyProcessName")[i];
                var dataNo = GV_AssignToolProcess.GetCurrentPageRowValues("AssemblyProcessNo")[i];
                var dataIdControlPlan = GV_AssignToolProcess.GetCurrentPageRowValues("ControlPlanTool")[i];
                var dataIdToolInventory = GV_AssignToolProcess.GetCurrentPageRowValues("ToolInventoryId")[i];
                Data.Rows.Add(dataIsAssign, dataId, dataDescription, dataNo, dataIdControlPlan, dataIdToolInventory);
            }
            Data.PrimaryKey = new DataColumn[] { Data.Columns["Id"] };
            //GV_AssignToolProcess.CancelEdit();
            e.Cancel = true;
            GV_AssignToolProcess.DataSource = Data;
            GV_AssignToolProcess.KeyFieldName = "Id";
            GV_AssignToolProcess.DataBind();
        }

     
    }
}