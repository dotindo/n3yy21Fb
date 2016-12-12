<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="DotMercy.Admin.Users" %>
<asp:Content ID="pageTitle" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
	<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridView" DataSourceID="usersDataSource"
		KeyFieldName="Id" CssClass="gridView">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="false" ShowEditButton="false" ShowNewButtonInHeader="true" VisibleIndex="0">
                <HeaderTemplate>
                    <dx:ASPxButton ID="btnNew" runat="server" Text="New" AutoPostBack="false" RenderMode="Link">
                        <ClientSideEvents Click="function (s, e) { window.location.href = '/Admin/AddUser.aspx'; }" />
                    </dx:ASPxButton>
                </HeaderTemplate>
			</dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="UserName" Caption="UserName" Visible="true">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" Caption="First Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" Caption="Last Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" Caption="Email">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="OrganizationId" Caption="Organization" ReadOnly="true">
                <PropertiesComboBox DataSourceID="organizationsDataSource" ValueField="Id" TextField="Name">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
		</Columns>
		<Settings ShowGroupPanel="false" />
		<SettingsPager PageSize="25" />
        <SettingsBehavior ConfirmDelete="true" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
	</dx:ASPxGridView>
    <ef:EntityDataSource ID="usersDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Users" />
    <ef:EntityDataSource ID="organizationsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Organizations" />
</asp:Content>
