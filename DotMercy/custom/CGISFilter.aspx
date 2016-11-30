<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CGISFilter.aspx.cs" Inherits="DotMercy.custom.CGISFilter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var lastAssySection = null;
        function OnAssySectionChanged(cboAssySection) {
            if (grvCgisFilter.GetEditor('StationId').InCallback()) {
                lastAssySection = cboAssySection.GetValue().toString();
            } else {
                grvCgisFilter.GetEditor('StationId').PerformCallback(cboAssySection.GetValue().toString());
            }
        }

        function OnEndCallback(s, e) {
            if (lastAssySection) {
                grvCgisFilter.GetEditor('StationId').PerformCallback(lastAssySection);
                lastAssySection = null;
            }
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID == "btnGetCgisData") {
                e.processOnServer = true;
            }
        }
    </script>
    <div>
        <br />
        &nbsp;
        <label style="font-weight: bold; font-size: medium">
            CGIS Filter<br />
        </label>
        &nbsp;<dx:ASPxGridView ID="grvViewModel" runat="server" AutoGenerateColumns="False" DataSourceID="sdsModels" KeyFieldName="Id"
            OnCustomButtonCallback="grvViewModel_OnCustomButtonCallback" ClientInstanceName="grvViewModel" OnCustomColumnDisplayText="grvViewModel_CustomColumnDisplayText">
            <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Baumuster" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ModelName" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CGISModel" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="7" Caption="Action">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton Text="Get CGIS Data" ID="btnGetCgisData">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Last Synch. Date" FieldName="LastSynchronizedDate" VisibleIndex="6" UnboundType="String">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupPanel="True" />
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="grvCgisFilter" runat="server" AutoGenerateColumns="False" ClientInstanceName="grvCgisFilter" DataSourceID="sdsCgisFilter" KeyFieldName="Id"
                        OnBeforePerformDataSelect="grvCgisFilter_BeforePerformDataSelect" OnCellEditorInitialize="grvCgisFilter_CellEditorInitialize"
                        PreviewFieldName="Id" OnRowInserting="grvCgisFilter_RowInserting" OnRowUpdating="grvCgisFilter_RowUpdating"
                        OnCustomColumnDisplayText="grvCgisFilter_CustomColumnDisplayText">
                        <Columns>
                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ModelId" Visible="False" VisibleIndex="2" Caption="Model" ShowInCustomizationForm="True">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProcessNoRangeStart" VisibleIndex="5" Caption="Process From">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProcessNoRangeEnd" VisibleIndex="6" Caption="Process To">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProcessException" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="CreatedDate" Visible="False" VisibleIndex="8" ShowInCustomizationForm="True">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="CreatedBy" Visible="False" VisibleIndex="9" ShowInCustomizationForm="True">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="ModifiedDate" Visible="False" VisibleIndex="10" ShowInCustomizationForm="True">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="ModifiedBy" Visible="False" VisibleIndex="11" ShowInCustomizationForm="True">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="AssemblySectionId" VisibleIndex="3" Caption="Assembly Section">
                                <PropertiesComboBox ClientInstanceName="cboAssySection" DataSourceID="sdsAssemblySection" TextField="AssemblySectionName" ValueField="Id" EnableSynchronization="False">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnAssySectionChanged(s);
}" />
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="StationId" VisibleIndex="4" Caption="Station">
                                <PropertiesComboBox ClientInstanceName="cboStation" EnableSynchronization="False">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                        <Settings ShowGroupPanel="True" />
                        <SettingsSearchPanel Visible="True" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="sdsCgisFilter" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CGISFilter] WHERE ([ModelId] = @ModelId)" DeleteCommand="DELETE FROM [CGISFilter] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CGISFilter] ([ModelId], [AssemblySectionId], [StationId], [ProcessNoRangeStart], [ProcessNoRangeEnd], [ProcessException], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (@ModelId, @AssemblySectionId, @StationId, @ProcessNoRangeStart, @ProcessNoRangeEnd, @ProcessException, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy)" UpdateCommand="UPDATE [CGISFilter] SET [ModelId] = @ModelId, [AssemblySectionId] = @AssemblySectionId, [StationId] = @StationId, [ProcessNoRangeStart] = @ProcessNoRangeStart, [ProcessNoRangeEnd] = @ProcessNoRangeEnd, [ProcessException] = @ProcessException, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ModelId" Type="Int32" />
                            <asp:Parameter Name="AssemblySectionId" Type="Int32" />
                            <asp:Parameter Name="StationId" Type="Int32" />
                            <asp:Parameter Name="ProcessNoRangeStart" Type="String" />
                            <asp:Parameter Name="ProcessNoRangeEnd" Type="String" />
                            <asp:Parameter Name="ProcessException" Type="String" />
                            <asp:Parameter Name="CreatedDate" Type="DateTime" />
                            <asp:Parameter Name="CreatedBy" Type="String" />
                            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
                            <asp:Parameter Name="ModifiedBy" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="ModelId" SessionField="ViewModelId" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ModelId" Type="Int32" />
                            <asp:Parameter Name="AssemblySectionId" Type="Int32" />
                            <asp:Parameter Name="StationId" Type="Int32" />
                            <asp:Parameter Name="ProcessNoRangeStart" Type="String" />
                            <asp:Parameter Name="ProcessNoRangeEnd" Type="String" />
                            <asp:Parameter Name="ProcessException" Type="String" />
                            <asp:Parameter Name="CreatedDate" Type="DateTime" />
                            <asp:Parameter Name="CreatedBy" Type="String" />
                            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
                            <asp:Parameter Name="ModifiedBy" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sdsModels" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT Models.Id, AssemblyTypes.Name, Types.Type, Models.Baumuster, Models.ModelName, Models.CGISModel FROM Models INNER JOIN Types ON Models.TypeId = Types.Id INNER JOIN AssemblyTypes ON Types.AssemblyTypeId = AssemblyTypes.Id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsAssemblySection" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [AssemblySection]"></asp:SqlDataSource>
    </div>

</asp:Content>
