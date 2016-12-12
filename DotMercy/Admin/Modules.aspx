<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="DotMercy.Admin.Modules" %>
<asp:Content ID="pageTitle" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxFormLayout ID="filterLayout" runat="server" CssClass="filterFormLayout">
        <Items>
            <dx:LayoutItem Caption="Application:">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="appFilterComboBox" runat="server"
                            DataSourceID="appsDataSource"
                            ValueField="Id"
                            ValueType="System.Int32"
                            TextField="Name"
                            DropDownStyle="DropDown"
                            OnDataBound="appFilterComboBox_DataBound">
                            <ClientSideEvents SelectedIndexChanged="function(s,e) { gridView.PerformCallback(s.GetValue()); }" />
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>

	<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="false" DataSourceID="groupsDataSource" ClientInstanceName="gridView"
		KeyFieldName="Id" CssClass="gridView" OnCustomCallback="gridView_CustomCallback" OnInit="gridView_Init"
        OnRowInserting="gridView_RowInserting" OnRowUpdating="gridView_RowUpdating" OnCellEditorInitialize="gridView_CellEditorInitialize">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" Caption="Name">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" Caption="Title">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataSpinEditColumn FieldName="OrderNo" Caption="Order No">
                <PropertiesSpinEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataCheckColumn FieldName="ShowInLeftMenu" Caption="Show In Left Menu">
            </dx:GridViewDataCheckColumn>
		</Columns>
        <Templates>
            <DetailRow>
                <div style="padding: 3px">
                    <dx:ASPxPageControl ID="pageControl" runat="server" Width="100%" EnableCallBacks="true">
                        <TabPages>
                            <dx:TabPage Text="Modules" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="modulesGridView" runat="server" AutoGenerateColumns="false" DataSourceID="modulesDataSource" 
                                            ClientInstanceName="modulesGridView" KeyFieldName="Id" CssClass="gridView" OnInit="modulesGridView_Init"
                                            OnBeforePerformDataSelect="modulesGridView_BeforePerformDataSelect" OnRowInserting="modulesGridView_RowInserting" 
                                            OnRowUpdating="modulesGridView_RowUpdating" OnCellEditorInitialize="modulesGridView_CellEditorInitialize">
                                            <Columns>
			                                    <dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings RequiredField-IsRequired="true" />
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title" Caption="Title">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings RequiredField-IsRequired="true" />
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="ModuleType" Caption="Module Type">
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="TableName" Caption="Table Name" ReadOnly="true">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataSpinEditColumn FieldName="OrderNo" Caption="Order No">
                                                    <PropertiesSpinEdit>
                                                        <ValidationSettings RequiredField-IsRequired="true" />
                                                    </PropertiesSpinEdit>
                                                </dx:GridViewDataSpinEditColumn>
                                                <dx:GridViewDataTextColumn FieldName="Url" Caption="URL">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn FieldName="ShowInLeftMenu" Caption="Show In Left Menu">
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="GroupId" Caption="Group">
                                                    <PropertiesComboBox DataSourceID="groupsDataSource" ValueField="Id" TextField="Title">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
		                                    <Settings ShowGroupPanel="false" />
                                            <SettingsDetail ShowDetailRow ="true" />
		                                    <SettingsPager PageSize="25" />
                                            <SettingsBehavior ConfirmDelete="true" />
		                                    <Paddings Padding="0px" />
		                                    <Border BorderWidth="0px" />
                                            <Templates>
                                                <DetailRow>
                                                    <div style="padding: 3px">
                                                        <dx:ASPxPageControl ID="pageControl" runat="server" Width="100%" EnableCallBacks="true">
                                                            <TabPages>
                                                                <dx:TabPage Text="Access Rights" Visible="true">
                                                                    <ContentCollection>
                                                                        <dx:ContentControl runat="server">
                                                                            <dx:ASPxGridView ID="moduleRightsGridView" runat="server" AutoGenerateColumns="false" DataSourceID="moduleRightsDataSource" 
                                                                                ClientInstanceName="moduleRightsGridView" KeyFieldName="Id" CssClass="gridView" 
                                                                                OnInit="moduleRightsGridView_Init" OnCellEditorInitialize="moduleRightsGridView_CellEditorInitialize"
                                                                                OnBeforePerformDataSelect="moduleRightsGridView_BeforePerformDataSelect" OnRowInserting="moduleRightsGridView_RowInserting"
                                                                                OnRowUpdating="moduleRightsGridView_RowUpdating">
                                                                                <Columns>
			                                                                        <dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                                                    <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                                                                                        <PropertiesTextEdit>
                                                                                            <ValidationSettings RequiredField-IsRequired="true" />
                                                                                        </PropertiesTextEdit>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataComboBoxColumn FieldName="PrincipalType" Caption="Principal Type">
                                                                                        <PropertiesComboBox EnableSynchronization="False">
                                                                                            <ClientSideEvents SelectedIndexChanged="function(s,e) { OnModulePrincipalTypeChanged(s); }" />
                                                                                        </PropertiesComboBox>
                                                                                    </dx:GridViewDataComboBoxColumn>
                                                                                    <dx:GridViewDataComboBoxColumn FieldName="PrincipalId" Caption="Principal">
                                                                                        <PropertiesComboBox EnableSynchronization="False">
                                                                                            <ClientSideEvents EndCallback="OnModuleEndCallback" />
                                                                                        </PropertiesComboBox>
                                                                                    </dx:GridViewDataComboBoxColumn>
                                                                                    <dx:GridViewDataComboBoxColumn FieldName="RoleId" Caption="Role">
                                                                                        <PropertiesComboBox DataSourceID="roleDataSource" ValueField="Id" TextField="Name" />
                                                                                    </dx:GridViewDataComboBoxColumn>
                                                                                </Columns>
		                                                                        <Settings ShowGroupPanel="false" />
		                                                                        <SettingsPager PageSize="25" />
                                                                                <SettingsBehavior ConfirmDelete="true" />
		                                                                        <Paddings Padding="0px" />
		                                                                        <Border BorderWidth="0px" />
                                                                            </dx:ASPxGridView>
                                                                        </dx:ContentControl>
                                                                    </ContentCollection>
                                                                </dx:TabPage>
                                                            </TabPages>
                                                        </dx:ASPxPageControl>
                                                    </div>
                                                </DetailRow>
                                            </Templates>
                                        </dx:ASPxGridView>
                                   </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Access Rights" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="groupRightsGridView" runat="server" AutoGenerateColumns="false" DataSourceID="groupRightsDataSource" 
                                            ClientInstanceName="groupRightsGridView" KeyFieldName="Id" CssClass="gridView" 
                                            OnInit="groupRightsGridView_Init" OnCellEditorInitialize="groupRightsGridView_CellEditorInitialize"
                                            OnBeforePerformDataSelect="groupRightsGridView_BeforePerformDataSelect" OnRowInserting="groupRightsGridView_RowInserting"
                                            OnRowUpdating="groupRightsGridView_RowUpdating">
                                            <Columns>
			                                    <dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings RequiredField-IsRequired="true" />
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="PrincipalType" Caption="Principal Type">
                                                    <PropertiesComboBox EnableSynchronization="False">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e) { OnGroupPrincipalTypeChanged(s); }" />
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="PrincipalId" Caption="Principal">
                                                    <PropertiesComboBox EnableSynchronization="False">
                                                        <ClientSideEvents EndCallback="OnGroupEndCallback" />
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="RoleId" Caption="Role">
                                                    <PropertiesComboBox DataSourceID="roleDataSource" ValueField="Id" TextField="Name" />
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
		                                    <Settings ShowGroupPanel="false" />
		                                    <SettingsPager PageSize="25" />
                                            <SettingsBehavior ConfirmDelete="true" />
		                                    <Paddings Padding="0px" />
		                                    <Border BorderWidth="0px" />
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
            </DetailRow>
        </Templates>
		<Settings ShowGroupPanel="false" />
        <SettingsDetail ShowDetailRow ="true" />
		<SettingsPager PageSize="25" />
        <SettingsBehavior ConfirmDelete="true" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
    </dx:ASPxGridView>

    <ef:EntityDataSource ID="groupsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="ModuleGroups"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" AutoGenerateWhereClause="true" OrderBy="it.Name">
        <WhereParameters>
            <asp:SessionParameter Name="AppId" SessionField="AppId" DefaultValue="0" DbType="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <ef:EntityDataSource ID="modulesDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Modules"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" AutoGenerateWhereClause="true" OrderBy="it.Title">
        <WhereParameters>
            <asp:SessionParameter Name="GroupId" SessionField="GroupId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <ef:EntityDataSource ID="appsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Apps" />

    <ef:EntityDataSource ID="groupRightsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="AccessRights"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" Where="it.SecuredObjectId == @GroupId">
        <WhereParameters>
            <asp:SessionParameter Name="GroupId" SessionField="GroupId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <ef:EntityDataSource ID="moduleRightsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="AccessRights"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" Where="it.SecuredObjectId == @ModuleId">
        <WhereParameters>
            <asp:SessionParameter Name="ModuleId" SessionField="ModuleId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <ef:EntityDataSource ID="roleDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Roles" AutoGenerateWhereClause="true"
        OrderBy="it.Name">
        <WhereParameters>
            <asp:SessionParameter Name="AppId" SessionField="AppId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <script type="text/javascript">
        var groupPrincipalType = null;
        
        function OnGroupPrincipalTypeChanged(s) {
            if (groupRightsGridView.GetEditor("PrincipalId").InCallback()) {
                groupPrincipalType = s.GetValue().ToString();
            }
            else {
                groupRightsGridView.GetEditor("PrincipalId").PerformCallback(s.GetValue().toString());
            }
        }

        function OnGroupEndCallback(s, e) {
            if (groupPrincipalType) {
                groupRightsGridView.GetEditor("PrincipalId").PerformCallback(groupPrincipalType);
                groupPrincipalType = null;
            }
        }

        var modulePrincipalType = null;

        function OnModulePrincipalTypeChanged(s) {
            if (moduleRightsGridView.GetEditor("PrincipalId").InCallback()) {
                modulePrincipalType = s.GetValue().ToString();
            }
            else {
                moduleRightsGridView.GetEditor("PrincipalId").PerformCallback(s.GetValue().toString());
            }
        }

        function OnModuleEndCallback(s, e) {
            if (modulePrincipalType) {
                moduleRightsGridView.GetEditor("PrincipalId").PerformCallback(modulePrincipalType);
                modulePrincipalType = null;
            }
        }

    </script>
</asp:Content>
