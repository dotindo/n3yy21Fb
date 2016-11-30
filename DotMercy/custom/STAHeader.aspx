<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="STAHeader.aspx.cs" Inherits="DotMercy.custom.STAHeader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
   
    </style>
    <script type="text/javascript">        
    </script>
    <div>
        <table style="width: 100%; margin-bottom: 5px; padding-left: 10px">
            <tr>
                <td>
                    <div style="margin-left: 10px; padding-top: 15px; width: 200px">
                        <dx:ASPxLabel ID="ASPxLabel1" Style="text-align: left; text-size-adjust: 75%; font-weight: bold;"
                            runat="server" Text="Mercedes-Benz Indonesia">
                        </dx:ASPxLabel>
                    </div>
                </td>
                <td>
                    <div style="margin-left: 10px; padding-top: 15px; width: 350px; text-align: center">
                        <label style="font-weight: bold; font-size: medium; vertical-align: text-top;">IMPLEMENTATION  CONTROL  FOR ALTERATION PKW</label>
                    </div>
                </td>
                <td>
                    <div style="margin-left: 10px; padding-top: 15px; width: 300px">
                    </div>
                </td>
            </tr>
        </table>
        <div id="Header">
            <table border="1" id="HeaderTop" style="margin-left: 10px;">
                <tr>
                    <td rowspan="1">
                        <dx:ASPxLabel ID="ASPxLabel3" Style="text-align: left;" runat="server" Text="Issuer :"></dx:ASPxLabel>
                        <div style="float: right">
                            <dx:ASPxTextBox ID="txtIssuer" runat="server" Width="150px"></dx:ASPxTextBox>
                        </div>
                    </td>
                    <td rowspan="2" colspan="2" style="text-align: center" id="TitleMiddleHeader">IMPLEMENTATION  CONTROL
                       FOR ALTERATION PKW
                    </td>
                    <td colspan="2">
                        <div style="text-align: center">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Issued on :"></dx:ASPxLabel>
                        </div>
                        <dx:ASPxTextBox ID="txtIssuedOn" Style="margin: auto;" runat="server" ReadOnly="true" Width="150px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <dx:ASPxLabel ID="lblModelName" runat="server" Width="100"></dx:ASPxLabel>
                        <dx:ASPxLabel ID="lbl_GLE250D" runat="server" Text="BM :"></dx:ASPxLabel>
                        <div style="float: right">
                            <dx:ASPxLabel ID="lblbaumuster" runat="server" Width="150"></dx:ASPxLabel>
                        </div>
                    </td>
                    <td colspan="2">
                        <div style="text-align: center;">
                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Status :"></dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblStatus" runat="server" Text="White"></dx:ASPxLabel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <dx:ASPxLabel ID="lbl_TechAteration" Style="text-align: center;" runat="server" Text="Technical Alteration :"></dx:ASPxLabel>
                    </td>
                    <td rowspan="1" style="text-align: center; width: 150px" id="Title_headerMid">Reason Of Alteration
                    </td>
                    <td rowspan="1" style="text-align: center; width: 150px" id="TitleCreateBy">CREATED BY 
                    </td>
                    <td rowspan="1" style="text-align: center; width: 150px" id="TitleAppBy">APPROVED BY
                    </td>
                </tr>
                <tr>
                    <td rowspan="1">
                        <dx:ASPxLabel ID="lbl_RicNumber" runat="server" Text="RIC NUMBER"></dx:ASPxLabel>
                    </td>
                    <td>
                        <div style="float: right">
                            <dx:ASPxTextBox ID="txtReasonOfAlteration" runat="server" Width="167px"></dx:ASPxTextBox>
                        </div>
                    </td>
                    <td rowspan="2" style="text-align: center; width: 150px">EPC 
                        <dx:ASPxLabel runat="server" ID="lbl_EPC"></dx:ASPxLabel>
                    </td>
                    <td rowspan="2">
                        <dx:ASPxComboBox runat="server" ID="ddlEPC">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="float: left">
                            <dx:ASPxLabel ID="lblRicNumber" runat="server"></dx:ASPxLabel>
                        </div>
                    </td>
                    <td>
                        <div style="float: right">
                            <dx:ASPxTextBox ID="txtTechnicalAlteration" runat="server" ReadOnly="true" Width="167px"></dx:ASPxTextBox>
                        </div>
                    </td>
                    <td rowspan="2" style="text-align: center; width: 150px">Cumulative Figure: 
                        <div style="float: right">
                            <dx:ASPxTextBox ID="txtCumulativeFigure" runat="server" Width="167px"></dx:ASPxTextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                        <dx:ASPxLabel runat="server" ID="lbl_Commnos" Text="COMMNOS   :"></dx:ASPxLabel>
                        <dx:ASPxLabel runat="server" ID="lblCommnos1" Text="831"></dx:ASPxLabel>
                        <dx:ASPxLabel runat="server" ID="lblCommnos2"></dx:ASPxLabel>
                        -
                            <dx:ASPxLabel runat="server" ID="lblCommnos3"></dx:ASPxLabel>
                        <dx:ASPxLabel runat="server" ID="lblCommnosUnits"></dx:ASPxLabel>
                    </td>
                    <td colspan="1" rowspan="3">&nbsp;</td>
                    <td rowspan="1" colspan="2" style="text-align: center; width: 150px">CONFIRMED BY
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ID="lbl_PackingMonth" Text="PACKING MONTH   :"></dx:ASPxLabel>
                        <div style="float: right">
                            <dx:ASPxTextBox ID="txtPackingMonth" runat="server" ReadOnly="true" Width="150px"></dx:ASPxTextBox>
                        </div>
                    </td>
                    <td colspan="1" rowspan="2" style="text-align: center; width: 150px">Impl. Date MBIna  :<div style="float: right">
                        <%--<dx:ASPxTextBox ID="txtImpleDateMbina"   runat="server" ></dx:ASPxTextBox>--%>
                        <dx:ASPxDateEdit ID="txtImpleDate" Width="167px" runat="server"></dx:ASPxDateEdit>
                    </div>
                    </td>
                    <td rowspan="2" style="text-align: center; width: 150px">PLG
                    </td>
                    <td rowspan="2">
                        <dx:ASPxComboBox runat="server" ID="ddlPLG">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ID="lbl_ChassisNR" Text="CHASSIS NR :"></dx:ASPxLabel>
                        <div style="float: right;width:200px" >
                            <dx:ASPxLabel runat="server" ID="lblChassis1"></dx:ASPxLabel>
                            -                            
                            <dx:ASPxLabel runat="server" ID="lblChassis2"></dx:ASPxLabel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <dx:ASPxLabel Text="Remarks :" runat="server" ID="lbl_Remarks"></dx:ASPxLabel>
                        <div style="float: right">
                            <dx:ASPxComboBox ID="ddlRemark" runat="server">
                                <Items>
                                    <dx:ListEditItem Text="Approved" Value="1" />
                                    <dx:ListEditItem Text="Not Approved" Value="0" />
                                </Items>
                            </dx:ASPxComboBox>
                        </div>
                    </td>
                    <td colspan="2" rowspan="2" style="vertical-align: bottom">
                        <dx:ASPxMemo ID="txtCodes" runat="server" Height="70px" Width="335px"></dx:ASPxMemo>
                    </td>
                    <td style="text-align: center; width: 150px">APC1/APC2
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ID="ddlAPC">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 150px">QEP
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ID="ddlQEP">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">OLD UNTIL
                        <dx:ASPxLabel runat="server" ID="lblOldUntil"></dx:ASPxLabel>
                    </td>
                    <td colspan="2" style="text-align: center; width: 300px">NEW FROM
                        <dx:ASPxLabel runat="server" ID="lblNewFrom"></dx:ASPxLabel>
                    </td>
                    <td colspan="2"></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <div style="margin-left: 10px; padding-top: 15px; width: 350px">
                        </div>
                    </td>
                    <td>
                        <div style="margin-left: 10px; padding-top: 15px; width: 350px">
                        </div>
                    </td>
                    <td>
                        <div style="float: right; margin-top: 10px; margin-left: 169px">
                            <dx:ASPxButton runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click"></dx:ASPxButton>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
