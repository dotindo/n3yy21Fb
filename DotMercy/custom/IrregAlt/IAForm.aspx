<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="IAForm.aspx.cs" Inherits="DotMercy.custom.IAForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Irregular Alteration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ALertMessage(message,boolFlag) {
            alert(message);
            if(boolFlag == 'true')
            {
                window.location = "custom/IrregAlt/ViewIrregAlt.aspx";
            }
        }

    </script>
    <div id="MainContainer" runat="server">
        <br />
        &nbsp;
        <dx:ASPxLabel runat="server" ID="lblHeader" CssClass="headerText" Font-Size="Large" Font-Bold="true" />
        <br />
        <dx:ASPxFormLayout ID="frmLayoutIrregAlt" runat="server">
            <Items>
                <dx:LayoutItem Caption="Type">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ddlTypeIA" runat="server" CssClass="">
                            </dx:ASPxComboBox>

                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Internal EPC Number">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="txtIntNumb" runat="server" Width="170px"></dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Info Number">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="txtInfNumb" runat="server" Width="170px"></dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Info Form">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="txtInfForm" runat="server" Width="170px"></dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Description">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo ID="mmDesc" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Valid Period">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="dtPeriodStart" runat="server"></dx:ASPxDateEdit>
                            <dx:ASPxLabel ID="lblto" runat="server" Text="to"></dx:ASPxLabel>
                            <dx:ASPxDateEdit ID="dtPeriodFins" runat="server"></dx:ASPxDateEdit>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Implemention Date">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="dtImplemenDate" runat="server"></dx:ASPxDateEdit>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Dynamic Check">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxCheckBox ID="chkDync" runat="server" ValueType="System.Boolean" Text="Check in Job Card"></dx:ASPxCheckBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Attachment">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="gvAttchmentReq" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvAttchmentReq" KeyFieldName="Id"
                                OnRowInserting="gvAttchmentReq_RowInserting" OnRowDeleting="gvAttchmentReq_RowDeleting">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Attachment" VisibleIndex="1">
                                        <EditFormSettings Visible="True" VisibleIndex="1" />
                                        <EditItemTemplate>
                                            <dx:ASPxUploadControl ID="UcAtthmentReq" runat="server" OnFileUploadComplete="UcAtthmentReq_FileUploadComplete"
                                                ClientInstanceName="UcAttachmentReq" OnInit="UcAtthmentReq_Init">
                                                <ValidationSettings
                                                    MaxFileSize="4000000">
                                                </ValidationSettings>
                                            </dx:ASPxUploadControl>
                                        </EditItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="2">
                                        <EditFormSettings Visible="false" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowNewButtonInHeader="true" VisibleIndex="3" ShowDeleteButton="true">
                                        <%--                                        <HeaderCaptionTemplate>
                                            <dx:ASPxHyperLink ID="btnAdd" runat="server" Text="Add">
                                                <ClientSideEvents Click="function (s, e) { grdAffectedPart.AddNewRow();}" />
                                            </dx:ASPxHyperLink>
                                        </HeaderCaptionTemplate>--%>
                                    </dx:GridViewCommandColumn>
                                </Columns>
                                <Settings ShowGroupPanel="false" />
                                <SettingsDetail ShowDetailRow="false" />
                            </dx:ASPxGridView>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Affected Part">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="gvAffectedPart" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdAffectedPart" KeyFieldName="Id"
                                OnRowInserting="gvAffectedPart_RowInserting" OnRowDeleting="gvAffectedPart_RowDeleting">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Part Number" VisibleIndex="1">
                                        <EditFormSettings Visible="True" VisibleIndex="1" />
                                        <EditItemTemplate>
                                            <dx:ASPxTextBox ID="txtPartNumb" runat="server" OnInit="txtPartNumb_Init">
                                            </dx:ASPxTextBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataMemoColumn FieldName="Description" VisibleIndex="2">
                                        <EditFormSettings Visible="True" VisibleIndex="2" />
                                        <EditItemTemplate>
                                            <dx:ASPxMemo ID="mmDescrPartNum" runat="server" OnInit="mmDescrPartNum_Init">
                                            </dx:ASPxMemo>
                                        </EditItemTemplate>
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewCommandColumn ShowNewButtonInHeader="true" VisibleIndex="3" ShowDeleteButton="true">
                                        <%--                                        <HeaderCaptionTemplate>
                                            <dx:ASPxHyperLink ID="btnAdd" runat="server" Text="Add">
                                                <ClientSideEvents Click="function (s, e) { grdAffectedPart.AddNewRow();}" />
                                            </dx:ASPxHyperLink>
                                        </HeaderCaptionTemplate>--%>
                                    </dx:GridViewCommandColumn>
                                </Columns>
                                <Settings ShowGroupPanel="false" />
                                <SettingsDetail ShowDetailRow="false" />
                            </dx:ASPxGridView>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Affected Models">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <%--<dx:ASPxButton ID="btnExport" runat="server" Text="To Excel" OnClick="btnExport_Click"></dx:ASPxButton>--%>

                            <dx:ASPxGridView ID="gvAffectedModels" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdAffectedModels" OnRowUpdating="gvAffectedModels_RowUpdating"
                                OnRowInserting="gvAffectedModels_RowInserting" OnInitNewRow="gvAffectedModels_InitNewRow" OnRowDeleting="gvAffectedModels_RowDeleting" KeyFieldName="Id"
                                OnDataBinding="gvAffectedModels_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Model" VisibleIndex="1">
                                        <EditItemTemplate>
                                            <dx:ASPxComboBox ID="cmb" runat="server" OnInit="cmb_Init">
                                            </dx:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewCommandColumn VisibleIndex="2" ShowNewButtonInHeader="true" ShowDeleteButton="true">
                                        <%--<HeaderCaptionTemplate>
                                            <dx:ASPxHyperLink ID="btnAdd" runat="server" Text="Add" >
                                                <ClientSideEvents Click="function (s, e) { grdAffectedModels.AddNewRow();}" />
                                                
                                            </dx:ASPxHyperLink>
                                        </HeaderCaptionTemplate>--%>
                                    </dx:GridViewCommandColumn>
                                </Columns>
                                <Settings ShowGroupPanel="false" />
                                <SettingsDetail ShowDetailRow="false" />
                            </dx:ASPxGridView>
                            <%--<dx:ASPxGridViewExporter ID="GridViewToexcel" runat="server" GridViewID="gvAffectedModels">

                            </dx:ASPxGridViewExporter>--%>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Affected Department">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="gvAffectDepart" runat="server" AutoGenerateColumns="False" ClientInstanceName="grdAffectedDepart" KeyFieldName="Id"
                                OnRowInserting="gvAffectDepart_RowInserting" OnRowDeleting="gvAffectDepart_RowDeleting" OnRowUpdating="gvAffectDepart_RowUpdating">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Department" VisibleIndex="1">
                                        <EditItemTemplate>
                                            <dx:ASPxComboBox ID="ddlDepartment" runat="server" OnInit="ddlDepartment_Init">
                                            </dx:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Manager" VisibleIndex="2">
                                        <EditItemTemplate>
                                            <dx:ASPxComboBox ID="ddlManager" runat="server" OnInit="ddlManager_Init">
                                            </dx:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Task" VisibleIndex="3">
                                        <EditItemTemplate>
                                            <dx:ASPxTextBox ID="txtTask" runat="server" OnInit="txtTask_Init">
                                            </dx:ASPxTextBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="4">
                                        <EditItemTemplate>
                                            <dx:ASPxComboBox ID="ddlStatusApproval" runat="server" OnInit="ddlStatus_Init">
                                            </dx:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewCommandColumn VisibleIndex="5" ShowDeleteButton="true" ShowNewButtonInHeader="true">
                                    </dx:GridViewCommandColumn>
                                </Columns>
                                <Templates>
                                    <DetailRow>
                                        <dx:ASPxGridView ID="detailgvAffectDepart" runat="server" Width="100%" ClientInstanceName="detailgvAffectDepart"
                                            OnBeforePerformDataSelect="detailgvAffectDepart_BeforePerformDataSelect" OnRowInserting="detailgvAffectDepart_RowInserting"
                                            OnRowUpdating="detailgvAffectDepart_RowUpdating">
                                            <Columns>

                                                <dx:GridViewDataTextColumn FieldName="Assignee" VisibleIndex="1">
                                                    <EditItemTemplate>
                                                        <dx:ASPxComboBox ID="ddlAssignee" runat="server" OnInit="ddlAssignee_Init">
                                                        </dx:ASPxComboBox>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="2">
                                                    <EditItemTemplate>
                                                        <dx:ASPxComboBox ID="ddlStatusAssignee" runat="server" OnInit="ddlStatusAssignee_Init">
                                                        </dx:ASPxComboBox>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <%--<dx:GridViewDataTextColumn FieldName="Attachment" VisibleIndex="3">
                                                    <EditItemTemplate>
                                                        <dx:ASPxUploadControl ID="ucAttachmentAssignee" runat="server"
                                                            OnFileUploadComplete="ucAttachmentAssignee_FileUploadComplete">
                                                            <ValidationSettings
                                                                MaxFileSize="4000000">
                                                        </dx:ASPxUploadControl>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataTextColumn>--%>
                                                <dx:GridViewCommandColumn ShowNewButtonInHeader="true" VisibleIndex="4" ShowDeleteButton="true">
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <SettingsDetail ShowDetailRow="true" />
                                        </dx:ASPxGridView>
                                    </DetailRow>
                                </Templates>
                                <Settings ShowGroupPanel="false" />
                                <SettingsDetail ShowDetailRow="true" />
                            </dx:ASPxGridView>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
        <dx:ASPxButton runat="server" Text="Save" ID="btnApproval" OnClick="btnApproval_Click"></dx:ASPxButton>
        <dx:ASPxButton runat="server" Text="Send Approval" ID="btnSendApp" OnClick="btnSendApp_Click"></dx:ASPxButton>
        <dx:ASPxButton runat="server" Text="Save" ID="btnSave" OnClick="btnSave_Click"></dx:ASPxButton>
    </div>
</asp:Content>
