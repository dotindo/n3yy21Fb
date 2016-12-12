<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="UserGroups.aspx.cs" Inherits="DotMercy.Admin.UserGroups" %>
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

	<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="false" DataSourceID="userGroupsDataSource" ClientInstanceName="gridView"
		KeyFieldName="Id" CssClass="gridView" OnInit="gridView_Init" OnCustomCallback="gridView_CustomCallback"
        OnRowInserting="gridView_RowInserting" OnRowUpdating="gridView_RowUpdating" OnCellEditorInitialize="gridView_CellEditorInitialize" OnCustomErrorText="gridView_CustomErrorText">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GroupName" Caption="Name">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" Caption="Description">
            </dx:GridViewDataTextColumn>
		</Columns>
        <Templates>
            <DetailRow>
                <div style="padding: 3px">
                    <dx:ASPxPageControl ID="pageControl" runat="server" Width="100%" EnableCallBacks="true">
                        <TabPages>
                            <dx:TabPage Text="Members" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="membersGridView" runat="server" AutoGenerateColumns="false" DataSourceID="membersDataSource" 
                                            ClientInstanceName="membersGridView" KeyFieldName="UserId;GroupId" CssClass="gridView" 
                                            OnInit="membersGridView_Init" OnCellEditorInitialize="membersGridView_CellEditorInitialize"
                                            OnBeforePerformDataSelect="membersGridView_BeforePerformDataSelect" OnRowInserting="membersGridView_RowInserting" OnRowUpdating="membersGridView_RowUpdating">
                                            <Columns>
			                                    <dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="false" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="UserId" Caption="User Id">
                                                    <PropertiesComboBox DataSourceID="usersDataSource" ValueField="Id" TextField="UserName">
                                                    </PropertiesComboBox>
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
		<Settings ShowGroupPanel="false" />
        <SettingsDetail ShowDetailRow ="true" />
		<SettingsPager PageSize="25" />
        <SettingsBehavior ConfirmDelete="true" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
	</dx:ASPxGridView>

    <ef:EntityDataSource ID="userGroupsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="UserGroups"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" AutoGenerateWhereClause="true" OrderBy="it.GroupName">
        <WhereParameters>
            <asp:SessionParameter Name="AppId" SessionField="AppId" DefaultValue="0" DbType="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>
    <ef:EntityDataSource ID="membersDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="UserGroupMembers"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" Where="it.GroupId = @GroupId" OrderBy="it.UserId">
        <WhereParameters>
            <asp:SessionParameter Name="GroupId" SessionField="GroupId" Type="String" />
        </WhereParameters>
    </ef:EntityDataSource>

    <ef:EntityDataSource ID="appsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Apps" />
    <ef:EntityDataSource ID="usersDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Users" />

</asp:Content>
