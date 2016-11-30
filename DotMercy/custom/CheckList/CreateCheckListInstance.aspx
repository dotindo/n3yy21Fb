<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CreateCheckListInstance.aspx.cs" Inherits="DotMercy.custom.CheckList.CreateCheckListInstance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        &nbsp;
        <label style="font-weight: bold; font-size: medium">Create New Check List</label>
    </div>
    <dx:ASPxFormLayout ID="frmLayoutCreateCheckList" runat="server">
        <Items>
            <dx:LayoutItem Caption="Check List Template">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cboCheckListTpl" runat="server" DataSourceID="SqlDsCheckListTemplate" TextField="TemplateName" ValueField="Id">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDsCheckListTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT Id, TemplateName, TemplateDocNumber, IsActive, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy FROM CheckListTemplateInfo WHERE (IsActive = @IsActive)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Packing Month">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxDateEdit ID="dtPackingMonth" runat="server" DisplayFormatString="yyyyMM">
                        </dx:ASPxDateEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Model">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cboModel" runat="server" AutoPostBack="True" DataSourceID="SqlDsModel" OnSelectedIndexChanged="cboModel_SelectedIndexChanged" TextField="ModelName" ValueField="Id">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDsModel" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [Model]"></asp:SqlDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Variant">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cboModelVariant" runat="server" TextField="Variant" ValueField="Id">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDsModelVariant" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT Id, ModelId, Variant, Baumuster, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy FROM ModelVariant WHERE (ModelId = @ModelId)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cboModel" Name="ModelId" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
</asp:Content>
