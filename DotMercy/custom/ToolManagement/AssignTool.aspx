<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AssignTool.aspx.cs" Inherits="DotMercy.custom.ToolManagement.AssignTool" %>
<%--Copy Dari Sini--%>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">Assign Tool
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function OnValueChanged(s, e) {
            var checkState = checkBox.GetCheckState();
            var checked = checkBox.GetChecked();
            checkStateLabel.SetText("CheckState = " + checkState);
            checkedLabel.SetText("Checked = " + checked);
        }
        function ClickUpdate() {
            var index = Gv_AssignTool.GetFocusedRowIndex();
            Gv_AssignTool.StartEditRow(index);
        }
        gv.Refresh();
    </script>
    <div class="content">
        <h2>Assign Tool</h2>  
    <dx:ASPxFormLayout ID="LayOutAssign" runat="server" style="margin-top: 0px">
        <Items>
            <dx:LayoutGroup Caption="" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Tool Number">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                  <dx:ASPxComboBox ID="ComboBox_ToolNumber" runat="server" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="SelectedChangedToolNumber">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Packing Month">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit runat="server" id="dtPackingMonth" DisplayFormatString="yyyyMM"></dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Inventory Number">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ComboBox_InventoryNumber" runat="server">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Model">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ComboBox_Model" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectedChangedModelVariant">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Production Line">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ComboBox_ProductionLine" runat="server">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Model Variant">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ComboBox_ModelVariant" runat="server">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Station">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ComboBox_Station" runat="server">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="Btn_ShowGv" runat="server" ClientInstanceName="Btn_ShowGv" OnClick="ShowGv" Text="Btn_Show">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                               
                                <dx:ASPxGridView ID="GV_AssignToolProcess" runat="server" Width="100%" KeyFieldName="Id" ClientInstanceName="Gv_AssignTool" OnRowUpdating="GV_AssignToolProcess_RowUpdating" OnCancelRowEditing="GV_AssignToolProcess_CancelRowEditing">
                                    <Columns>
                                        <dx:GridViewCommandColumn VisibleIndex="0" ShowUpdateButton="true" ShowEditButton="true">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataCheckColumn VisibleIndex="1" FieldName="IsAssign"  Name="IsAssign" ReadOnly="false">
                                            <PropertiesCheckEdit AllowGrayed="True" ClientInstanceName="checkBox" DisplayTextGrayed="red" DisplayTextUndefined="red" ValueGrayed="True">
                                            </PropertiesCheckEdit>
                                            <Settings SortMode="DisplayText" />
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="AssemblyProcessName" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="AssemblyProcessNo" Name="Process Number" VisibleIndex="2">
                                            <EditFormSettings Caption="Process Number" />
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Name="IdControlPlan" FieldName="Id" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Name="ToolInventoryId" FieldName="ToolInventoryId" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Name="ControlPlanTool" FieldName="ControlPlanTool" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem Caption="" Name="SaveButton">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton ID="BtnSave" runat="server" OnClick="SaveGv" Text="Save" ClientInstanceName="BtnSave">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
        </div>
</asp:Content>
