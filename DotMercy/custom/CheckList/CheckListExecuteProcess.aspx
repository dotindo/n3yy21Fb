<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CheckListExecuteProcess.aspx.cs" Inherits="DotMercy.custom.CheckList.CheckListExecuteProcess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dxpnlControl_DevEx {
             font: 11px Verdana, Geneva, sans-serif;
             border: 0px solid #9598A1;
             margin-left: 10px;
         }
    </style>
    <script type="text/javascript">
        function OnInit(s, e) {
            s.Focus();
        }

        function OnClick() {
            loadingPanel.Show();
        }

        function OnEndCallback(s, e) {
            loadingPanel.Hide();
        }
    </script>
    <div class="dxflFormLayout_DevEx" id="ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_spLayout">
        <table class="dxflGroup_DevEx dxflGroupSys dxflAGSys" style="border-collapse: separate;">
            <tbody>
                <tr>
                    <td class="dxflGroupCell_DevEx" id="ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_spLayout_0">
                        <table class="dxflCLLSys dxflItemSys dxflTextItemSys dxflItem_DevEx" style="border-collapse: separate;">
                            <tbody>
                                <tr>
                                    <td class="dxflHALSys dxflVATSys dxflCaptionCell_DevEx dxflCaptionCellSys" style="width: 130px;">
                                        <label class="dxflCaption_DevEx">Store Procedure Name:</label></td>
                                    <td class="dxflNestedControlCell_DevEx">
                                        <dx:ASPxLabel ID="lblSPName" runat="server"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="dxflVATSys dxflGroupCell_DevEx" id="ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_spLayout_1">
                        <div class="dxflGroupBox_DevEx dxflGroupBoxSys">
                            <span class="dxflGroupBoxCaption_DevEx" style="color: rgb(161, 163, 170);">Parameter</span>
                            <table class="dxflGroup_DevEx dxflGroupSys dxflAGSys" style="border-collapse: separate;">
                            </table>
                            <dx:ASPxPanel ID="pnlParameter" runat="server" Width="200px" Paddings="10px" Styles="margin-left:10px;">
                            </dx:ASPxPanel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxCheckBox ID="chkUpdate" runat="server" Text="Set Instance Step to finish after process?" Checked="True"></dx:ASPxCheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="dxflGroupCell_DevEx" id="ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_spLayout_2">
                        <table class="dxflCLLSys dxflItemSys dxflButtonItemSys dxflItem_DevEx" style="border-collapse: separate;">
                            <tbody>
                                <tr>
                                    <td class="dxflHALSys dxflVATSys dxflCaptionCell_DevEx dxflCaptionCellSys" style="width: 130px;">
                                        <label class="dxflCaption_DevEx"></label>
                                    </td>
                                    <td class="dxflNestedControlCell_DevEx">
                                        <dx:ASPxButton runat="server" ID="btnExecuteSP" Text="Execute Process" OnClick="btnExecuteSP_Click">
                                            <ClientSideEvents Click="OnClick" Init="OnInit" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="dxflGroupCell_DevEx" style="color: #FF0000; font-size: x-small">* Store procedure process time depends on logic complexity</td>
                </tr>
            </tbody>
        </table>
    </div>
    <dx:ASPxLoadingPanel ID="loadingPanel" runat="server" ClientInstanceName="loadingPanel" Modal="True"></dx:ASPxLoadingPanel>
</asp:Content>
