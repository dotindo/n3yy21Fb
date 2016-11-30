<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CgisSync.aspx.cs" Inherits="DotMercy.custom.CgisSync" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    CGIS Process Sync
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function EndProcessSync(retStatus) {
            grvCgisProcessHistory.Refresh();
            alert('Synchronized ' + retStatus);
        }

    </script>
        <h2>CGIS Process Sync</h2>
    <dx:ASPxFormLayout ID="frmLayout" runat="server">
        <Items>
            <dx:LayoutItem Caption="Packing Month">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxDateEdit ID="dtPackingMonth" runat="server" DisplayFormatString="yyyyMM">
                        </dx:ASPxDateEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Type">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cboTypes" runat="server" DataSourceID="sdsTypes" TextField="Type" TextFormatString="{0}|{1}|{2}|{3}" ValueField="ModelId">
                            <Columns>
                                <dx:ListBoxColumn Caption="Model" FieldName="ModelName" />
                                <dx:ListBoxColumn Caption="Baumuster" FieldName="Baumuster" />
                                <dx:ListBoxColumn Caption="Type" FieldName="Type" Name="Type" />
                                <dx:ListBoxColumn Caption="CGIS Model" FieldName="CGISModel" Name="CGISModel" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton ID="btnProcess" runat="server" Text="Process CGIS Sync" ClientInstanceName="btnProcess" OnClick="btnProcess_Click">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="grvCgisProcessHistory" ClientInstanceName="grvCgisProcessHistory" runat="server" AutoGenerateColumns="False" DataSourceID="sdsCgisProcessSync" KeyFieldName="Id">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackingMonth" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ProcessDate" VisibleIndex="4">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy hh:mm:ss" EditFormat="DateTime">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ProcessBy" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TypeId" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="sdsTypeMaster" TextField="Type" ValueField="Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Model" FieldName="ModelId" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sdsModels" TextField="ModelName" ValueField="Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Settings ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="sdsCgisProcessSync" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [CGISSynchronizeds]"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT
	t.Id as TypeId,
	m.Id as ModelId,
	m.ModelName,
	m.Baumuster,
	t.Type AS Type,
	t.CGISModel
FROM Models m
INNER JOIN Types t
	ON m.TypeId = t.Id" ID="sdsTypes"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsModels" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [Models]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTypeMaster" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT * FROM [Types]"></asp:SqlDataSource>

</asp:Content>
