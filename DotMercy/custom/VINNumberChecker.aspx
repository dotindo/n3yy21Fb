<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="VINNumberChecker.aspx.cs" Inherits="DotMercy.custom.VINNumberChecker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">VIN Number Checker
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    </script>
    <div class="content">
        <h2>VIN Number Checker</h2>
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
            <Items>
                <dx:LayoutItem Caption="Line">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ddlLine" runat="server">
                            </dx:ASPxComboBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Serial Number">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="txtBarcode" runat="server" Width="170px">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
        <div style="padding-left: 207px">
            <dx:ASPxButton ID="btnVerify" runat="server" Text="Verify" AutoPostBack="False" OnClick="btnVerify_Click">
            </dx:ASPxButton>
        </div>
        <dx:ASPxPopupControl ID="PopupLogin" runat="server" Height="100px" Width="200px" Modal="True">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
                        <Items>
                            <dx:LayoutItem Caption="Authorization Key">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtPassword" runat="server" Width="170px" Password="True">
                                        </dx:ASPxTextBox>
                                        <br />
                                        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click">
                                        </dx:ASPxButton>
                                        <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
