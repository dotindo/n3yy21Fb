<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CheckListTemplateInfo.aspx.cs" Inherits="DotMercy.custom.CheckList.CheckListTemplateInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var lastGroupId = null;
        function OnGroupIdChanged(cmbGroupId) {
            if (grvCLTemplateStep.GetEditor('UserId').InCallback()) {
                lastGroupId = cmbGroupId.GetValue().toString();
            } else {
                grvCLTemplateStep.GetEditor('UserId').PerformCallback(cmbGroupId.GetValue().toString());
            }
        }

        function OnEndCallback(s, e) {
            if (lastGroupId) {
                grvCLTemplateStep.GetEditor("UserId").PerformCallback(lastGroupId);
                lastGroupId = null;
            }
        }
    </script>
    <div>
        <br />
        &nbsp;
        <h2>Create Check List Template</h2>
    </div>
    <dx:ASPxGridView ID="grvCheckListTemplateInfo" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSCheckListTemplate" KeyFieldName="Id" OnRowDeleting="grvCheckListTemplateInfo_RowDeleting" OnRowInserting="grvCheckListTemplateInfo_RowInserting">
        <%--  <SettingsCommandButton>
            <NewButton ButtonType="Button">
            </NewButton>
            <EditButton ButtonType="Button">
            </EditButton>
            <DeleteButton ButtonType="Button" Text="Delete">
            </DeleteButton>
        </SettingsCommandButton>--%>
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TemplateName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TemplateDocNumber" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <%-- <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>--%>
            <dx:GridViewDataComboBoxColumn Caption="CheckList Group" FieldName="CheckListGroupId" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sdsCheckListGroup" TextField="CheckListGroupName" ValueField="Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <Settings ShowGroupPanel="True" />
        <SettingsText ConfirmDelete="Are you sure want to delete this item?" />
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="grvCLTemplateStep" ClientInstanceName="grvCLTemplateStep" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDetailTemplate" 
                    KeyFieldName="Id" OnBeforePerformDataSelect="grvCLTemplateStep_BeforePerformDataSelect" 
                    OnRowInserting="grvCLTemplateStep_RowInserting" OnCellEditorInitialize="grvCLTemplateStep_CellEditorInitialize" OnCustomColumnDisplayText="grvCLTemplateStep_CustomColumnDisplayText">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CheckListTemplateInfoId" VisibleIndex="2" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="StepName" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrlLink" VisibleIndex="7">
                            <PropertiesTextEdit ClientInstanceName="txtUrlLink">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="StoreProcedureName" VisibleIndex="8">
                            <PropertiesTextEdit ClientInstanceName="txtSPName">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="IsSendEmailNotification" VisibleIndex="9" Caption="Send Email Notification">
                            <PropertiesCheckEdit ClientInstanceName="chkIsEmail">
                                <ClientSideEvents CheckedChanged="function(s, e) {
                                    var check = s.GetChecked();
                                    if (check)
                                    {
                                        txtEmailNotification.readOnly = false;
                                        txtEmailNotification.enabled = true;
                                    } else {
                                        txtEmailNotification.readOnly = true;
                                        txtEmailNotification.enabled = false;
                                    }
                                    
                                }" Init="function(s, e) {
	var check = s.GetChecked();
                                    if (check)
                                    {
                                        txtEmailNotification.readOnly = false;
                                        txtEmailNotification.enabled = true;
                                    } else {
                                        txtEmailNotification.readOnly = true;
                                        txtEmailNotification.enabled = false;
                                    }

}" />
                            </PropertiesCheckEdit>
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="EmailNotification" VisibleIndex="10">
                            <PropertiesTextEdit ClientInstanceName="txtEmailNotification">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SeqNo" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Predecessor" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RowStatus" VisibleIndex="13" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="14" Visible="False">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="15" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="ModifiedDate" VisibleIndex="16" Visible="False">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="ModifiedBy" VisibleIndex="17" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="UserGroupId" VisibleIndex="4" Caption="Role">
                            <PropertiesComboBox DataSourceID="sqlUserGroups" TextField="GroupName" ValueField="Id">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnGroupIdChanged(s);}"></ClientSideEvents>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="ChecklistTypeId" VisibleIndex="6" Caption="Checklist Type">
                            <PropertiesComboBox DataSourceID="sqlCheckListTypes" TextField="Name" ValueField="Id" ClientInstanceName="cmbCheckListType">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { 
	var cboValue = cmbCheckListType.GetValue();
if(cboValue == 1)	//Complete/InComplete
{
		txtSPName.readOnly = true;
txtSPName.enabled = false;
}else if(cboValue == 2)	//Internal Link URL
{
txtSPName.readOnly = true;
                              txtSPName.enabled = false;
}else if(cboValue == 3)	//External Link URL
{
 		txtSPName.readOnly = true;
txtSPName.enabled = false;
txtUrlLink.readOnly = false;	
                      	txtUrlLink.SetValue(&quot;&quot;);
}
else if(cboValue == 4)	//Execute Process Step
{
txtUrlLink.readOnly = false;
                              txtUrlLink.enabled = false;
                              txtUrlLink.SetValue(&quot;&quot;);
}
}" Init="function(s, e) {
	var cboValue = cmbCheckListType.GetValue();
if(cboValue == 1)	//Complete/InComplete
{
		txtSPName.readOnly = true;
txtSPName.enabled = false;
}else if(cboValue == 2)	//Internal Link URL
{
txtSPName.readOnly = true;
                              txtSPName.enabled = false;
}else if(cboValue == 3)	//External Link URL
{
 		txtSPName.readOnly = true;
txtSPName.enabled = false;
txtUrlLink.readOnly = false;	
                      	txtUrlLink.SetValue(&quot;&quot;);
}
else if(cboValue == 4)	//Execute Process Step
{
txtUrlLink.readOnly = false;
                              txtUrlLink.enabled = false;
                              txtUrlLink.SetValue(&quot;&quot;);
}
}" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="PIC" FieldName="UserId" VisibleIndex="5">
                            <PropertiesComboBox ClientInstanceName="cboPIC">
                                <ClientSideEvents EndCallback="OnEndCallback" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" />
                    <SettingsSearchPanel Visible="True" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sqlDetailTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CheckListTemplateStep] WHERE (([CheckListTemplateInfoId] = @CheckListTemplateInfoId) AND ([RowStatus] = @RowStatus)) ORDER BY [SeqNo]" DeleteCommand="DELETE FROM [CheckListTemplateStep] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CheckListTemplateStep] ([CheckListTemplateInfoId], [StepName], [UserId], [UserGroupId], [ChecklistTypeId], [UrlLink], [StoreProcedureName], [IsSendEmailNotification], [EmailNotification], [SeqNo], [Predecessor], [RowStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (@CheckListTemplateInfoId, @StepName, @UserId, @UserGroupId, @ChecklistTypeId, @UrlLink, @StoreProcedureName, @IsSendEmailNotification, @EmailNotification, @SeqNo, @Predecessor, @RowStatus, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy)" UpdateCommand="UPDATE [CheckListTemplateStep] SET [CheckListTemplateInfoId] = @CheckListTemplateInfoId, [StepName] = @StepName, [UserId] = @UserId, [UserGroupId] = @UserGroupId, [ChecklistTypeId] = @ChecklistTypeId, [UrlLink] = @UrlLink, [StoreProcedureName] = @StoreProcedureName, [IsSendEmailNotification] = @IsSendEmailNotification, [EmailNotification] = @EmailNotification, [SeqNo] = @SeqNo, [Predecessor] = @Predecessor, [RowStatus] = @RowStatus, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CheckListTemplateInfoId" Type="Int32" />
                        <asp:Parameter Name="StepName" Type="String" />
                        <asp:Parameter Name="UserId" Type="Int32" />
                        <asp:Parameter Name="UserGroupId" Type="Int32" />
                        <asp:Parameter Name="ChecklistTypeId" Type="Int32" />
                        <asp:Parameter Name="UrlLink" Type="String" />
                        <asp:Parameter Name="StoreProcedureName" Type="String" />
                        <asp:Parameter Name="IsSendEmailNotification" Type="Boolean" />
                        <asp:Parameter Name="EmailNotification" Type="String" />
                        <asp:Parameter Name="SeqNo" Type="Int32" />
                        <asp:Parameter Name="Predecessor" Type="String" />
                        <asp:Parameter Name="RowStatus" Type="Byte" />
                        <asp:Parameter Name="CreatedDate" Type="DateTime" />
                        <asp:Parameter Name="CreatedBy" Type="String" />
                        <asp:Parameter Name="ModifiedDate" Type="DateTime" />
                        <asp:Parameter Name="ModifiedBy" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="CheckListTemplateInfoId" SessionField="CheckListTemplateInfoId" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="RowStatus" Type="Byte" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CheckListTemplateInfoId" Type="Int32" />
                        <asp:Parameter Name="StepName" Type="String" />
                        <asp:Parameter Name="UserId" Type="Int32" />
                        <asp:Parameter Name="UserGroupId" Type="Int32" />
                        <asp:Parameter Name="ChecklistTypeId" Type="Int32" />
                        <asp:Parameter Name="UrlLink" Type="String" />
                        <asp:Parameter Name="StoreProcedureName" Type="String" />
                        <asp:Parameter Name="IsSendEmailNotification" Type="Boolean" />
                        <asp:Parameter Name="EmailNotification" Type="String" />
                        <asp:Parameter Name="SeqNo" Type="Int32" />
                        <asp:Parameter Name="Predecessor" Type="String" />
                        <asp:Parameter Name="RowStatus" Type="Byte" />
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
    <asp:SqlDataSource ID="sqlDSCheckListTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CheckListTemplateInfo] WHERE IsActive = 1" DeleteCommand="DELETE FROM [CheckListTemplateInfo] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CheckListTemplateInfo] ([TemplateName], [TemplateDocNumber], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], CheckListGroupId) VALUES (@TemplateName, @TemplateDocNumber, @IsActive, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy, @CheckListGroupId)" UpdateCommand="UPDATE [CheckListTemplateInfo]
SET    [TemplateName]          = @TemplateName,
       [TemplateDocNumber]     = @TemplateDocNumber,
       [IsActive]              = @IsActive,
       [CreatedDate]           = @CreatedDate,
       [CreatedBy]             = @CreatedBy,
       [ModifiedDate]          = @ModifiedDate,
       [ModifiedBy]            = @ModifiedBy,
       CheckListGroupId = @CheckListGroupId
WHERE  [Id]                    = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TemplateName" Type="String" />
            <asp:Parameter Name="TemplateDocNumber" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="CheckListGroupId" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TemplateName" Type="String" />
            <asp:Parameter Name="TemplateDocNumber" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="CheckListGroupId" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlUserGroups" runat="server" ConnectionString="<%$ ConnectionStrings:DotWebDb %>" SelectCommand="SELECT * FROM [UserGroups]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCheckListTypes" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [ChecklistTypes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCheckListGroup" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CheckListGroup]"></asp:SqlDataSource>
    </asp:Content>
