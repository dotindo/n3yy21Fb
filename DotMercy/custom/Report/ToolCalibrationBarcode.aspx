﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ToolCalibrationBarcode.aspx.cs" Inherits="DotMercy.custom.Report.ToolCalibrationBarcode" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="DotMercy.custom.Report.rptToolCalibrationBarcode">
    </dx:ASPxDocumentViewer>
</asp:Content>