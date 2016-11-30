<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Ric.aspx.cs" Inherits="DotMercy.custom.Ric" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
	<dx:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="masterDataSource" ClientInstanceName="masterGrid"
		Width="60%" KeyFieldName="Id" CssClass="gridView">
		<Columns>

            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Issuer" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="IssuedDate" VisibleIndex="2"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="RICStatusId" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RICNR" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AlterationId" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ReasonOfAlteration" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CommnosCountry" VisibleIndex="7" ReadOnly="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CommnosFrom" VisibleIndex="7" ReadOnly="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CommnosTo" VisibleIndex="7" ReadOnly="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackingMonthId" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ChassisNR" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IMPLPLAN" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Remark" ReadOnly="True" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Codes" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="OldUntil" VisibleIndex="13"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NewFrom" VisibleIndex="14"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="CreatedById" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApprovedBy1" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ModelId" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="VarianId" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            
		</Columns>

   		<SettingsPager PageSize="32" />
		<SettingsSearchPanel Visible="True" />
		<Paddings Padding="0px" />
		<Border BorderWidth="0px" />
		<BorderBottom BorderWidth="1px" />
		<Settings ShowGroupPanel="True" />
        <SettingsDetail ShowDetailRow="false" />
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="masterDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="SELECT
	[Id],
	[Issuer],
	[IssuedDate],
	[RICStatusId],
	[RICNR],
	[AlterationId],
	[ReasonOfAlteration],
	[CommnosCountry], [CommnosFrom], [CommnosTo],
	[PackingMonthId],
	[ChassisNR],
	[IMPLPLAN],
	Case [Remark] WHEN 1 then 'Active'
	else 'InActive' END AS Remark,
	[Codes],
	[OldUntil],
	[NewFrom],
	[CreatedById],
	ApprovedBy1,
	[ModelId],
	[VarianId]
FROM [RecordImplemControl]" 
        DeleteCommand="DELETE FROM [RecordImplemControl] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [RecordImplemControl] ([Issuer], [IssuedDate], [RICStatusId], [RICNR], [AlterationId], [ReasonOfAlteration], [CommnosCountry], [CommnosFrom], [CommnosTo], [PackingMonthId], [ChassisNR], [IMPLPLAN], [Remark], [Codes], [OldUntil], [NewFrom], [CreatedById], [ApprovedBy1], [ApprovedBy2], [ApprovedBy3], [ApprovedBy4], [ModelId], [VarianId]) VALUES (@Issuer, @IssuedDate, @RICStatusId, @RICNR, @AlterationId, @ReasonOfAlteration, @CommnosCountry, @CommnosFrom, @CommnosTo, @PackingMonthId, @ChassisNR, @IMPLPLAN, @Remark, @Codes, @OldUntil, @NewFrom, @CreatedById, @ApprovedBy1, @ApprovedBy2, @ApprovedBy3, @ApprovedBy4, @ModelId, @VarianId)" 
        UpdateCommand="UPDATE [RecordImplemControl] SET [Issuer] = @Issuer, [IssuedDate] = @IssuedDate, [RICStatusId] = @RICStatusId, [RICNR] = @RICNR, [AlterationId] = @AlterationId, [ReasonOfAlteration] = @ReasonOfAlteration, [CommnosCountry] = @CommnosCountry, [CommnosFrom] = @CommnosFrom, [CommnosTo] = @CommnosTo, [PackingMonthId] = @PackingMonthId, [ChassisNR] = @ChassisNR, [IMPLPLAN] = @IMPLPLAN, [Remark] = @Remark, [Codes] = @Codes, [OldUntil] = @OldUntil, [NewFrom] = @NewFrom, [CreatedById] = @CreatedById, [ApprovedBy1] = @ApprovedBy1, [ApprovedBy2] = @ApprovedBy2, [ApprovedBy3] = @ApprovedBy3, [ApprovedBy4] = @ApprovedBy4, [ModelId] = @ModelId, [VarianId] = @VarianId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Issuer" Type="Int32" />
            <asp:Parameter DbType="Date" Name="IssuedDate" />
            <asp:Parameter Name="RICStatusId" Type="Int32" />
            <asp:Parameter Name="RICNR" Type="String" />
            <asp:Parameter Name="AlterationId" Type="Int32" />
            <asp:Parameter Name="ReasonOfAlteration" Type="String" />
            <asp:Parameter Name="CommnosCountry" Type="String" />
            <asp:Parameter Name="CommnosFrom" Type="String" />
            <asp:Parameter Name="CommnosTo" Type="String" />
            <asp:Parameter Name="PackingMonthId" Type="Int32" />
            <asp:Parameter Name="ChassisNR" Type="String" />
            <asp:Parameter Name="IMPLPLAN" Type="String" />
            <asp:Parameter Name="Remark" Type="Boolean" />
            <asp:Parameter Name="Codes" Type="String" />
            <asp:Parameter DbType="Date" Name="OldUntil" />
            <asp:Parameter DbType="Date" Name="NewFrom" />
            <asp:Parameter Name="CreatedById" Type="Int32" />
            <asp:Parameter Name="ApprovedBy1" Type="String" />
            <asp:Parameter Name="ApprovedBy2" Type="String" />
            <asp:Parameter Name="ApprovedBy3" Type="String" />
            <asp:Parameter Name="ApprovedBy4" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
            <asp:Parameter Name="VarianId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Issuer" Type="Int32" />
            <asp:Parameter DbType="Date" Name="IssuedDate" />
            <asp:Parameter Name="RICStatusId" Type="Int32" />
            <asp:Parameter Name="RICNR" Type="String" />
            <asp:Parameter Name="AlterationId" Type="Int32" />
            <asp:Parameter Name="ReasonOfAlteration" Type="String" />
            <asp:Parameter Name="CommnosCountry" Type="String" />
            <asp:Parameter Name="CommnosFrom" Type="String" />
            <asp:Parameter Name="CommnosTo" Type="String" />
            <asp:Parameter Name="PackingMonthId" Type="Int32" />
            <asp:Parameter Name="ChassisNR" Type="String" />
            <asp:Parameter Name="IMPLPLAN" Type="String" />
            <asp:Parameter Name="Remark" Type="Boolean" />
            <asp:Parameter Name="Codes" Type="String" />
            <asp:Parameter DbType="Date" Name="OldUntil" />
            <asp:Parameter DbType="Date" Name="NewFrom" />
            <asp:Parameter Name="CreatedById" Type="Int32" />
            <asp:Parameter Name="ApprovedBy1" Type="String" />
            <asp:Parameter Name="ApprovedBy2" Type="String" />
            <asp:Parameter Name="ApprovedBy3" Type="String" />
            <asp:Parameter Name="ApprovedBy4" Type="String" />
            <asp:Parameter Name="ModelId" Type="Int32" />
            <asp:Parameter Name="VarianId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsOrganization" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, Name, Code, Decsription from Organizations Order by Name">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsAlteration" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, Reason from Alterations Order by Reason">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPackingMonth" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, PackingMth from PackingMonths Order by PackingMth">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsRICStatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, Name from RICStatus Order by Name">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, UserName,OrganizationsId from Users Order by UserName">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsModel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="SELECT * FROM [Models]">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVarian" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="SELECT * FROM [Variants]">                   
    </asp:SqlDataSource>


</asp:Content>
