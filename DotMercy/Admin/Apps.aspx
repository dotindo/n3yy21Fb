<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Apps.aspx.cs" Inherits="DotMercy.Admin.Apps" %>
<asp:Content ID="pageTitle" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
	<dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="true" DataSourceID="entityDataSource" ClientInstanceName="gridView"
		KeyFieldName="Id" OnInit="gridView_Init" OnCustomColumnDisplayText="gridView_CustomColumnDisplayText" CssClass="gridView">
		<Columns>
			<dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" Caption="Id">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" Caption="Name">
                <PropertiesTextEdit>
                    <ValidationSettings RequiredField-IsRequired="true" />
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" Caption="Description">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GridTextColumnMaxLength" Caption="Grid Text Column Max Length">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PageSize" Caption="Page Size">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DefaultGroupName" Caption="Default Group Name">
            </dx:GridViewDataTextColumn>
		</Columns>
        <Templates>
            <DetailRow>
                <div style="padding: 3px">
                    <dx:ASPxPageControl ID="pageControl" runat="server" Width="100%" EnableCallBacks="true">
                        <TabPages>
                            <dx:TabPage Text="Access Rights" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="accessRightsGridView" runat="server" AutoGenerateColumns="false" DataSourceID="accessRightsDataSource" 
                                            ClientInstanceName="accessRightsGridView" KeyFieldName="Id" CssClass="gridView" 
                                            OnInit="accessRightsGridView_Init" OnCellEditorInitialize="accessRightsGridView_CellEditorInitialize"
                                            OnBeforePerformDataSelect="accessRightsGridView_BeforePerformDataSelect" OnRowInserting="accessRightsGridView_RowInserting"
                                            OnRowUpdating="accessRightsGridView_RowUpdating">
                                            <Columns>
			                                    <dx:GridViewCommandColumn ShowDeleteButton="true" ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" Caption="Id" Visible="false">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings RequiredField-IsRequired="true" />
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="PrincipalType" Caption="Principal Type">
                                                    <PropertiesComboBox EnableSynchronization="False">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e) { OnPrincipalTypeChanged(s); }" />
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="PrincipalId" Caption="Principal">
                                                    <PropertiesComboBox EnableSynchronization="False">
                                                        <ClientSideEvents EndCallback="OnEndCallback" />
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
		<SettingsPager PageSize="32" />
		<Settings ShowGroupPanel="false" />
        <SettingsDetail ShowDetailRow ="true" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
	</dx:ASPxGridView>

    <ef:EntityDataSource ID="entityDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Apps"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" />
    <ef:EntityDataSource ID="accessRightsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="AccessRights"
        EnableInsert="true" EnableUpdate="true" EnableDelete="true" Where="it.SecuredObjectId == @AppId">
        <WhereParameters>
            <asp:SessionParameter Name="AppId" SessionField="AppId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>
    <ef:EntityDataSource ID="roleDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Roles" AutoGenerateWhereClause="true"
        OrderBy="it.Name">
        <WhereParameters>
            <asp:SessionParameter Name="AppId" SessionField="AppId" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>

    <script type="text/javascript">
        var principalType = null;
        
        function OnPrincipalTypeChanged(s) {
            if (accessRightsGridView.GetEditor("PrincipalId").InCallback()) {
                principalType = s.GetValue().ToString();
            }
            else {
                accessRightsGridView.GetEditor("PrincipalId").PerformCallback(s.GetValue().toString());
            }
        }

        function OnEndCallback(s, e) {
            if (principalType) {
                accessRightsGridView.GetEditor("PrincipalId").PerformCallback(principalType);
                principalType = null;
            }
        }
    </script>
</asp:Content>
