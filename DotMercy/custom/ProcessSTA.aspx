<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ProcessSTA.aspx.cs" Inherits="DotMercy.custom.ProcessSTA" %>

<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainContainer" runat="server" class="content">
        <h2>Process STA</h2>
        <table width="50%" cellpadding="5" style="width: 50%; margin-left: 30px" class="dxgvEditFormTable">            
            <tr>
                <td class="tdEditFormCell" style="width: 5%" align="left">Packing Month
                    </td>    
                <td class="tdEditFormCell" style="width: 1%" align="left">:
                    </td>                                             
                   
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                    <%-- <dx:ASPxComboBox ID="PackingMonth" runat="server" ValueType="System.Int32"
                            ClientInstanceName="cbPackingMonth" DataSourceID="sdsPackingMonth" IncrementalFilteringMode="Contains"
                            TextField="PackingMth" ValueField="Id" Width="100%" >
                        </dx:ASPxComboBox>    --%>
                    <%--<dx:ASPxDateEdit ID="dtPackingMonth" runat="server" DisplayFormatString="yyyyMM" EditFormat="Custom">
                        </dx:ASPxDateEdit>   --%>
                    <dx:ASPxTextBox ID="dtPackingMonth" runat="server" ClientInstanceName="dtPackingMonth">
                    </dx:ASPxTextBox>
                    </td>
                </tr>

            <tr>
                <td class="tdEditFormCell" style="width: 5%" align="left">Model
                </td>
                <td class="tdEditFormCell" style="width: 1%" align="left">:
                </td>
                <td class="tdEditFormCell" style="width: 10%" align="left">
                    <dx:ASPxComboBox ID="ModelId" runat="server" ValueType="System.Int32"
                        ClientInstanceName="cbModel" DataSourceID="sdsModel" IncrementalFilteringMode="Contains"
                        TextField="ModelName" ValueField="Id" Width="100%">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td class="tdEditFormCell" style="width: 5%" align="left">Variant
                </td>
                <td class="tdEditFormCell" style="width: 1%" align="left">:
                </td>
                <td class="tdEditFormCell" style="width: 10%" align="left">
                    <dx:ASPxComboBox ID="VarianId" runat="server" ValueType="System.Int32"
                        ClientInstanceName="VarianId" DataSourceID="sdsVarian" IncrementalFilteringMode="Contains"
                        TextField="Variant" ValueField="Id" Width="100%">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td class="tdEditFormCell" colspan="3" style="width: 10%" align="left">
                    <dx:ASPxButton ID="btnProcess" runat="server" AutoPostBack="False"
                        ClientInstanceName="btnProcess" Text="Process" OnClick="btnProcess_OnClick">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>

    <asp:SqlDataSource ID="sdsModel" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="SELECT m.Id, m.TypeId, m.Baumuster, m.ModelName FROM Models m"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVarian" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="SELECT v.Id, v.ModelId, v.Variant from Variants v"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPackingMonth" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, PackingMth from PackingMonths Order by PackingMth"></asp:SqlDataSource>

</asp:Content>
