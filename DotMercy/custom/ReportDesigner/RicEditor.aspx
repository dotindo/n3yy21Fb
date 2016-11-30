<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="RicEditor.aspx.cs" Inherits="DotMercy.custom.ReportDesigner.RicEditor" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    RIC Report Editor
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxReportDesigner ID="ricReportDesigner" runat="server" ColorScheme="dark">
    </dx:ASPxReportDesigner>
</asp:Content>
