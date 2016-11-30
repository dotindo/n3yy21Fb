<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="JobCardEditor.aspx.cs" Inherits="DotMercy.custom.ReportDesigner.JobCardEditor" %>

<%@ Register Assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    JobCard Report Editor
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxReportDesigner ID="jobcardReportDesigner" runat="server" ColorScheme="dark">
    </dx:ASPxReportDesigner>
</asp:Content>
