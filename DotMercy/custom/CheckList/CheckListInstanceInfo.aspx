<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CheckListInstanceInfo.aspx.cs" Inherits="DotMercy.custom.CheckList.CheckListInstanceInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">Checklist
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var command = "";
        function OnBeginCallback(s, e) {
            console.log('Begin callback: ' + e.command);
            s.isError = false;
            command = e.command;
        }

        function OnEndCallback(s, e) {
            console.log('Command Name: ' + command);
            if ((command == "CUSTOMBUTTON") && !s.isError) {
                gridInstance.Refresh();
            }
            console.log('cp_redirect data: ' + s.cp_redirect);
            if (s.cp_redirect != null) {
                console.log('Try to open new window...');
                //window.open(s.cp_redirect, '_blank');
                window.open(s.cp_redirect);
                delete (s.cp_redirect);
            }
        }

        function OnCallbackError(s, e) {
            s.isError = true;
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID == 'btnDelete') {
                e.processOnServer = confirm('Are you sure you want to delete this item?');
            } else {
                e.processOnServer = true;
            }
        }

        function OnGridDetailCustomButtonClick(s, e) {
            if (e.buttonID == 'btnSetToComplete') {
                e.processOnServer = confirm('Are you sure you want to complete this process?');
            } else if (e.buttonID == 'btnOpenLink') {
                e.processOnServer = true;
            } else if (e.buttonID == 'btnShowEmail') {
                var keyValue = detailGrid.GetRowKey(e.visibleIndex);
                popupEmail.Show();
                popupEmail.SetHeaderText = 'Email Notification';
                popupEmail.PerformCallback(keyValue + ';' + e.buttonID);
            }
        }

        var lastModelId = null;
        function OnModelChanged(cboModel) {
            if (cboVarian.InCallback()) {
                lastModelId = cboModel.GetValue().toString();
            } else {
                cboVarian.PerformCallback(cboModel.GetValue().toString());
            }
        }
    </script>
    <style>
        .headerText {
            font-weight: bold;
            font-size: medium;
        }
    </style>
    <div class="content mainContent">        
        <dx:ASPxLabel runat="server" ID="lblHeader" CssClass="h2" />        
        <dx:ASPxFormLayout ID="frmLayoutCreateCheckList" runat="server">
            <Items>
                <dx:LayoutItem Caption="Check List Template">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="cboCheckListTpl" runat="server" DataSourceID="SqlDsCheckListTemplate" TextField="TemplateName" ValueField="Id" Width="271px" SelectedIndex="0">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDsCheckListTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT Id, TemplateName, TemplateDocNumber, IsActive, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, CheckListGroupId FROM CheckListTemplateInfo WHERE (IsActive = @IsActive) AND (CheckListGroupId = @CheckListGroupId)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                                    <asp:SessionParameter Name="CheckListGroupId" SessionField="CheckListGroupId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Packing Month">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="dtPackingMonth" runat="server" DisplayFormatString="yyyyMM" EditFormat="Custom">
                            </dx:ASPxDateEdit>
                            <%--<dx:ASPxComboBox ID="cboPackingMonth" runat="server" DataSourceID="sdsPackingMonth" TextField="PackingMth" ValueField="PackingMth">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="sdsPackingMonth" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [PackingMonths]"></asp:SqlDataSource>--%>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Model">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="cboModel" runat="server" DataSourceID="SqlDsModel" TextField="ModelName" ValueField="Id" ClientInstanceName="cboModel">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {OnModelChanged(s);}" />
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDsModel" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [Models]"></asp:SqlDataSource>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Variant">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="cboModelVariant" runat="server" TextField="Variant" ValueField="Id" ClientInstanceName="cboVarian" OnCallback="cboModelVariant_Callback">
                                <ClientSideEvents EndCallback="function(s, e) {if(lastModelId) {cboVarian.PerformCallback(lastModelId);lastModelId = null;}}" />
                            </dx:ASPxComboBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click">
                            </dx:ASPxButton>
                            <dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseOnEscape="True" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
    </div>
    <dx:ASPxGridView ID="grvInstanceInfo" runat="server" AutoGenerateColumns="False" KeyFieldName="Id" OnCustomButtonCallback="grvInstanceInfo_CustomButtonCallback" DataSourceID="sdsCheckListInfo" ClientInstanceName="gridInstance" OnCustomButtonInitialize="grvInstanceInfo_CustomButtonInitialize">
        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">

                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnDelete" Text="Delete">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>

            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CheckListTemplateInfoId" VisibleIndex="2" ReadOnly="True" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackingMonth" VisibleIndex="7" ReadOnly="True" GroupIndex="0" SortIndex="0" SortOrder="Descending">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Variant" VisibleIndex="6" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RunningNumber" ReadOnly="True" Visible="False" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstanceName" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastActivity" ReadOnly="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RowStatus" ReadOnly="True" VisibleIndex="16" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreatedDate" VisibleIndex="17" ReadOnly="True">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ModifiedDate" VisibleIndex="19" ReadOnly="True">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ModifiedBy" VisibleIndex="20" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataProgressBarColumn Caption="Progress" FieldName="Progress" ReadOnly="True" VisibleIndex="11">
            </dx:GridViewDataProgressBarColumn>

            <dx:GridViewCommandColumn Caption="STA View" VisibleIndex="12">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="OpenSTA" Text="Open STA">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn Caption="RIC Document" VisibleIndex="13">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="OpenRIC" Text="Open RIC">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>

            <dx:GridViewCommandColumn Caption="CP View" VisibleIndex="14">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="OpenCP" Text="Open CP">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn Caption="JobCard Document" VisibleIndex="15">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="OpenJC" Text="Open JobCard">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>

        </Columns>
        <Templates>
            <DetailRow>

                <dx:ASPxGridView ID="grvCheckListStep" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDsCheckListDetail" KeyFieldName="Id"
                    OnBeforePerformDataSelect="grvCheckListStep_BeforePerformDataSelect" OnCustomButtonCallback="grvCheckListStep_CustomButtonCallback"
                    OnCustomColumnDisplayText="grvCheckListStep_CustomColumnDisplayText" ClientInstanceName="detailGrid" OnCustomButtonInitialize="grvCheckListStep_CustomButtonInitialize">
                    <ClientSideEvents BeginCallback="OnBeginCallback" CallbackError="OnCallbackError" EndCallback="OnEndCallback" CustomButtonClick="OnGridDetailCustomButtonClick" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CheckListInstanceInfoId" VisibleIndex="1" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn Caption="Action" VisibleIndex="2">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnSetToComplete" Text="Set To Complete">
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnOpenLink" Text="Open Link">
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnExecuteProcess" Text="Execute Process"></dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="SeqNo" VisibleIndex="3"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="StepName" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Group" FieldName="UserGroupId" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="StepProcessStart" VisibleIndex="9">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="StepProcessEnd" VisibleIndex="10">
                            <PropertiesDateEdit EditFormat="DateTime">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Predecessor" FieldName="Predecessor" Name="Predecessor" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="PIC" FieldName="UserId" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn Caption="Email Notification" VisibleIndex="8">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnShowEmail" Text="Show">
                                    <Image IconID="people_publicfix_16x16">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDsCheckListDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CheckListInstanceStep] WHERE ([CheckListInstanceInfoId] = @CheckListInstanceInfoId) ORDER BY SeqNo">
                    <SelectParameters>
                        <asp:SessionParameter Name="CheckListInstanceInfoId" SessionField="CheckListMasterId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </DetailRow>
        </Templates>
        <SettingsBehavior ConfirmDelete="True" />
        <Settings ShowGroupPanel="True" />
        <SettingsDataSecurity AllowInsert="False" AllowDelete="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsDetail ShowDetailRow="True"></SettingsDetail>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="sdsCheckListInfo" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" DeleteCommand="DELETE FROM [CheckListInstanceInfo] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CheckListInstanceInfo] ([CheckListTemplateInfoId], [PackingMonth], [Model], [Variant], [RunningNumber], [InstanceName], [InstanceDocument], [LastActivity], [Progress], [RowStatus], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (@CheckListTemplateInfoId, @PackingMonth, @Model, @Variant, @RunningNumber, @InstanceName, @InstanceDocument, @LastActivity, @Progress, @RowStatus, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy)" SelectCommand="SELECT * FROM [CheckListInstanceInfo] WHERE ([RowStatus] = @RowStatus) AND ([CheckListGroupId] = @CheckListGroupId) ORDER BY PackingMonth DESC" UpdateCommand="UPDATE [CheckListInstanceInfo] SET [CheckListTemplateInfoId] = @CheckListTemplateInfoId, [PackingMonth] = @PackingMonth, [Model] = @Model, [Variant] = @Variant, [RunningNumber] = @RunningNumber, [InstanceName] = @InstanceName, [InstanceDocument] = @InstanceDocument, [LastActivity] = @LastActivity, [Progress] = @Progress, [RowStatus] = @RowStatus, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CheckListTemplateInfoId" Type="Int32" />
            <asp:Parameter Name="PackingMonth" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Variant" Type="String" />
            <asp:Parameter Name="RunningNumber" Type="String" />
            <asp:Parameter Name="InstanceName" Type="String" />
            <asp:Parameter Name="InstanceDocument" Type="String" />
            <asp:Parameter Name="LastActivity" Type="String" />
            <asp:Parameter Name="Progress" Type="Decimal" />
            <asp:Parameter Name="RowStatus" Type="Byte" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="RowStatus" Type="Byte" />
            <asp:SessionParameter Name="CheckListGroupId" SessionField="CheckListGroupId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CheckListTemplateInfoId" Type="Int32" />
            <asp:Parameter Name="PackingMonth" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Variant" Type="String" />
            <asp:Parameter Name="RunningNumber" Type="String" />
            <asp:Parameter Name="InstanceName" Type="String" />
            <asp:Parameter Name="InstanceDocument" Type="String" />
            <asp:Parameter Name="LastActivity" Type="String" />
            <asp:Parameter Name="Progress" Type="Decimal" />
            <asp:Parameter Name="RowStatus" Type="Byte" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <dx:ASPxPopupControl ID="popupEmail" ClientInstanceName="popupEmail" runat="server" HeaderText="Email Notification" AllowDragging="True" AllowResize="True"
        Width="450px" Height="300px" Modal="True" OnWindowCallback="popupEmail_OnWindowCallback" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div style="width: 100%; display: inline-flex;"> 
                    <dx:ASPxLabel runat="server" Text="Add Email: " />
                    <dx:ASPxTextBox runat="server" ID="txtNewEmail"></dx:ASPxTextBox>
                    <dx:ASPxButton runat="server" ID="btnAdd" Text="Add" OnClick="btnAdd_Click"></dx:ASPxButton> 
                </div>
                <div style="width: 100%; height: 100%; overflow: auto;">
                    <dx:ASPxGridView ID="grvEmailAddress" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="btnDeleteEmail" Text="Delete">
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Email Address" FieldName="EmailAddress" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
