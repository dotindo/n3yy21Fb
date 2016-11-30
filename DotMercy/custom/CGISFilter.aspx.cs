using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DevExpress.Web;
using DotWeb.Models;
using DotWeb.Repositories;

namespace DotMercy.custom
{
    public partial class CGISFilter : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //do nothing
        }

        private void cmbStationId_OnCallback(object sender, CallbackEventArgsBase e)
        {
            FillStationByAssemblySection(sender as ASPxComboBox, e.Parameter);
        }

        private void FillStationByAssemblySection(ASPxComboBox cmb, string sectionId)
        {
            if (string.IsNullOrEmpty(sectionId)) return;

            List<Stations> stationList = StationRepository.RetrieveStationByAssemblySectionId(Convert.ToInt32(sectionId));
            cmb.Items.Clear();
            cmb.DataSource = stationList;
            cmb.TextField = "StationName";
            cmb.ValueField = "Id";
            cmb.DataBind();
        }

        protected void grvCgisFilter_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ViewModelId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grvCgisFilter_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            //ASPxGridView gridDetail = sender as ASPxGridView;
            //if (gridDetail.IsEditing)
            //{
            if (e.Column.FieldName == "StationId")
            {
                ASPxComboBox combo = e.Editor as ASPxComboBox;
                combo.Callback += new CallbackEventHandlerBase(cmbStationId_OnCallback);

                var grid = e.Column.Grid;
                if (!combo.IsCallback)
                {
                    var sectionId = -1;
                    if (!grid.IsNewRowEditing)
                    {
                        sectionId = (int) grid.GetRowValues(e.VisibleIndex, "AssemblySectionId");
                        FillStationByAssemblySection(combo, sectionId.ToString());
                    }
                }
            }
            //}
        }

        protected void grvCgisFilter_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["ModelId"] = Session["ViewModelId"];
            e.NewValues["CreatedDate"] = DateTime.Now;
        }

        protected void grvCgisFilter_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["ModelId"] = Session["ViewModelId"];
            e.NewValues["ModifiedDate"] = DateTime.Now;
        }

        protected void grvCgisFilter_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "StationId")
            {
                e.DisplayText = StationRepository.RetrieveStationByStationId(Convert.ToInt32(e.Value));
            }
        }

        protected void grvViewModel_OnCustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            try
            {
                DataRowView currRow = (DataRowView)grvViewModel.GetRow(e.VisibleIndex);
                int modelId = (int) grvViewModel.GetRowValues(e.VisibleIndex, "Id");
                string name = (string) grvViewModel.GetRowValues(e.VisibleIndex, "Name");
                string typeName = (string)grvViewModel.GetRowValues(e.VisibleIndex, "Type");
                string baumuster = (string)grvViewModel.GetRowValues(e.VisibleIndex, "Baumuster");
                string modelName = (string)grvViewModel.GetRowValues(e.VisibleIndex, "ModelName");
                string cgisModel = (string)grvViewModel.GetRowValues(e.VisibleIndex, "CGISModel");

                if (e.ButtonID == "btnGetCgisData")
                {
                    
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        protected void grvViewModel_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "LastSynchronizedDate")
            {
                int id = (int) grvViewModel.GetRowValues(e.VisibleRowIndex, "Id");
                DotWeb.Models.CGISFilter cgisFilter = CgisFilterRepository.RetrieveCgisFilterById(id);
                if (cgisFilter != null)
                {
                    if (cgisFilter.LastSynchronizedDate != null)
                    {
                        e.DisplayText = cgisFilter.LastSynchronizedDate.GetValueOrDefault().ToString("yyyy-MM-dd");
                    }
                }
            }
        }

    }
}