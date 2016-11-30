<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ViewIrregAlt.aspx.cs" Inherits="DotMercy.custom.IrregAlt.ViewIrregAlt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MainContainer" runat="server">
        <br />
        &nbsp;
        <dx:ASPxLabel runat="server" ID="lblHeader" CssClass="headerText" />
        <br />
        <dx:ASPxGridView ID="gvIrregAltvw" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvIrregAltvw">
            <Columns>
                <dx:GridViewDataHyperLinkColumn FieldName="Task Type" VisibleIndex="0" PropertiesHyperLinkEdit-NavigateUrlFormatString="IAForm.aspx?id={0}" PropertiesHyperLinkEdit-TextField="TaskType">
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valid From" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valid To" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Info Form" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Info Number" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="False" VisibleIndex="7">
                    <HeaderCaptionTemplate>
                        <dx:ASPxHyperLink ID="btnAdd" runat="server" Text="New">
                            <ClientSideEvents Click="function (s, e) { window.location = 'IAForm.aspx';}" />

                        </dx:ASPxHyperLink>
                    </HeaderCaptionTemplate>
                </dx:GridViewCommandColumn>
            </Columns>
            <Settings ShowGroupPanel="false" />
            <SettingsDetail ShowDetailRow="false" />
        </dx:ASPxGridView>

    </div>
</asp:Content>

