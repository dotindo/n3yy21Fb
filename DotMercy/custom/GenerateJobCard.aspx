<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="GenerateJobCard.aspx.cs" Inherits="DotMercy.custom.GenerateJobCard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <style type="text/css">
        .categoryTable
        {
            width: 100%;
        }
        .categoryTable .imageCell
        {
            padding: 2px;
        }
        .categoryTable .textCell
        {
            padding-left: 20px;
            width: 100%;
        }
        .textCell .label
        {
            color: #969696;
        }
        .textCell .description
        {
            font-size: 13px;
            width: 230px;
        }
    </style>

    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="SqlDataSource1"
        KeyFieldName="id" Width="100%" AutoGenerateColumns="False" OnRowInserted="grid_RowInserted">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn FieldName="DATE" VisibleIndex="2">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom" EditFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataTextColumn FieldName="VarianId" VisibleIndex="3">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="GroupId" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
                        
            
            <dx:GridViewDataTextColumn FieldName="StartProdNo" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EndProdNo" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ModelId" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackingMonth" VisibleIndex="8">               
               <EditItemTemplate>
                   <dx:ASPxDateEdit id="date" runat="server" EditFormatString="yyyyMM" Text='<%# Bind("PackingMonth") %>'></dx:ASPxDateEdit>
               </EditItemTemplate>                            
            </dx:GridViewDataTextColumn>
                        
            
        </Columns>

        <Settings ShowGroupPanel="True" />

        <SettingsDetail ShowDetailRow="false" />
        <SettingsBehavior EnableCustomizationWindow="true" />
    </dx:ASPxGridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="SELECT [id]
      ,[DATE]
      ,[VarianId]
      ,[GroupId]
      ,[StartProdNo]
      ,[EndProdNo]
      ,[ModelId]
      ,[PackingMonth]
  FROM [mercedesdb].[dbo].[GenerateJobCard]" DeleteCommand="DELETE FROM [GenerateJobCard] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [GenerateJobCard] ([Date], [VarianId], [PackingMonth], [GroupId], [StartProdNo], [EndProdNo], [ModelId]) VALUES 
        (@Date, @VarianId,@PackingMonth
        , @GroupId, @StartProdNo, @EndProdNo, @ModelId)" 
        UpdateCommand="UPDATE [GenerateJobCard] SET [Date] = @Date, [VarianId] = @VarianId, 
[PackingMonth] = @PackingMonth
, [GroupId] = @GroupId, 
        [StartProdNo] = @StartProdNo, [EndProdNo] = @EndProdNo, [ModelId] = @ModelId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Date" DbType="Date" />
            <asp:Parameter Name="VarianId" Type="Int32" />
           <asp:Parameter Name="PackingMonth" Type="String"/>
            <asp:Parameter Name="GroupId" Type="Int32" />
            <asp:Parameter Name="StartProdNo" Type="String" />
            <asp:Parameter Name="EndProdNo" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Date" DbType="Date" />
            <asp:Parameter Name="VarianId" Type="Int32" />
            <asp:Parameter Name="PackingMonth" Type="String"/>
            <asp:Parameter Name="GroupId" Type="Int32" />
            <asp:Parameter Name="StartProdNo" Type="String" />
            <asp:Parameter Name="EndProdNo" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPackingMonth" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, PackingMth from PackingMonths Order by PackingMth">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsModel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, VarianName from Varians Order by VarianName">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsModelGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, Name from ModelGroup Order by Name">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVarian" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, ModelVarian from VarianDetails Order by ModelVarian">                   
    </asp:SqlDataSource>

</asp:Content>
