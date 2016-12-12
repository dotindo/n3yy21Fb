<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="DotMercy.Admin.Organizations" %>
<asp:Content ID="pageTitle" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
	<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="false" ClientInstanceName="gridView" DataSourceID="organizationsDataSource"
		KeyFieldName="Code" CssClass="gridView" OnInit="gridView_Init">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0">
			</dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="true">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" Caption="Name">
            </dx:GridViewDataTextColumn>
		</Columns>
		<Settings ShowGroupPanel="false" />
		<SettingsPager PageSize="25" />
        <SettingsBehavior ConfirmDelete="true" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
	</dx:ASPxGridView>
    <ef:EntityDataSource ID="organizationsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Organizations" EnableInsert="true" EnableUpdate="true" EnableDelete="true" />
</asp:Content>
