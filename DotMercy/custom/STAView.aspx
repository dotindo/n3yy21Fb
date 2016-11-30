<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="STAView.aspx.cs" Inherits="DotMercy.custom.STAView" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="masterDataSource" ClientInstanceName="masterGrid"
        Width="60%" KeyFieldName="Id" CssClass="gridView" OnBeforePerformDataSelect="Page_Load">
        <Columns>

            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Issuer" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="sdsUser" TextField="UserName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="IssuedDate" VisibleIndex="2"></dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="RICStatusId" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sdsRICStatus" TextField="Name" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="RICNr" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AlterationId" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ReasonOfAlteration" VisibleIndex="6">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="CommnosCountry" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CommnosFrom" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CommnosTo" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackingMonth" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ChassisNR" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ImplPlan" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CumulativeFigure" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ImplementationDate" VisibleIndex="14">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="ActualImplementationDate" VisibleIndex="15">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="Remark" VisibleIndex="16"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="Codes" VisibleIndex="17">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn FieldName="OldUntil" VisibleIndex="18"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NewFrom" VisibleIndex="19"></dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="CreatedById" VisibleIndex="20">
                <PropertiesComboBox DataSourceID="sdsOrganization" TextField="Name" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ApprovedBy1" VisibleIndex="21">
                <PropertiesComboBox DataSourceID="sdsUser" TextField="UserName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ApprovedBy1Date" VisibleIndex="22">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ApprovedBy2" VisibleIndex="23">
                <PropertiesComboBox DataSourceID="sdsUser" TextField="UserName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ApprovedBy2Date" VisibleIndex="24">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ApprovedBy3" VisibleIndex="25">
                <PropertiesComboBox DataSourceID="sdsUser" TextField="UserName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ApprovedBy3Date" VisibleIndex="26">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ApprovedBy4" VisibleIndex="27">
                <PropertiesComboBox DataSourceID="sdsUser" TextField="UserName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="ApprovedBy4Date" VisibleIndex="28">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ModelId" VisibleIndex="29">
                <PropertiesComboBox DataSourceID="sdsModel" TextField="ModelName" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="VarianId" VisibleIndex="30">
                <PropertiesComboBox DataSourceID="sdsVariant" TextField="Variant" ValueField="Id"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>

        <Templates>
            <DetailRow>
                <div>
                    <table style="margin-bottom: 5px; padding-left: 10px">
                        <tr>
                            <td>
                                <div style="margin-left: 10px; padding-top: 15px; width: 250px">
                                    <dx:ASPxLabel ID="ASPxLabel1" Style="text-align: left; text-size-adjust: 75%; font-weight: bold;"
                                        runat="server" Text="Mercedes-Benz Indonesia">
                                    </dx:ASPxLabel>
                                </div>
                            </td>
                            <td style="width: 75%">
                                <div style="margin-left: 10px; padding-top: 15px; width: 400px; text-align: center">
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
                                        <dx:ASPxTextBox ID="txtIssuer" ReadOnly="true" runat="server" Width="150px"></dx:ASPxTextBox>
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
                                        <dx:ASPxTextBox ID="txtReasonOfAlteration" ReadOnly="true" runat="server" Width="167px"></dx:ASPxTextBox>
                                    </div>
                                </td>
                                <td rowspan="2" style="text-align: center; width: 150px">EPC 
                        <dx:ASPxLabel runat="server" ID="lbl_EPC"></dx:ASPxLabel>
                                </td>
                                <td rowspan="2">
                                    <dx:ASPxComboBox runat="server" ReadOnly="true" ID="ddlEPC">
                                    </dx:ASPxComboBox>
                                    <div style="float: right">
                                        <dx:ASPxButton Text="Approved" ID="btnApproved1" runat="server"></dx:ASPxButton>
                                    </div>
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
                            <dx:ASPxTextBox ID="txtCumulativeFigure" ReadOnly="true" runat="server" Width="167px"></dx:ASPxTextBox>
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
                                    <dx:ASPxDateEdit ID="txtImpleDate" ReadOnly="true" Width="167px" runat="server"></dx:ASPxDateEdit>
                                </div>
                                </td>
                                <td rowspan="2" style="text-align: center; width: 150px">PLG
                                </td>
                                <td rowspan="2">
                                    <dx:ASPxComboBox runat="server" ReadOnly="true" ID="ddlPLG">
                                    </dx:ASPxComboBox>
                                    <div style="float: right">
                                        <dx:ASPxButton Text="Approved" ID="btnApproved2" runat="server"></dx:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel runat="server" ID="lbl_ChassisNR" Text="CHASSIS NR :"></dx:ASPxLabel>
                                    <div style="float: right; width: 200px">
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
                                        <dx:ASPxComboBox ID="ddlRemark" ReadOnly="true" runat="server">
                                            <Items>
                                                <dx:ListEditItem Text="Approved" Value="1" />
                                                <dx:ListEditItem Text="Not Approved" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </div>
                                </td>
                                <td colspan="2" rowspan="2" style="vertical-align: bottom">
                                    <dx:ASPxMemo ID="txtCodes" ReadOnly="true" runat="server" Height="70px" Width="335px"></dx:ASPxMemo>
                                </td>
                                <td style="text-align: center; width: 150px">APC1/APC2
                                </td>
                                <td>
                                    <dx:ASPxComboBox runat="server" ReadOnly="true" ID="ddlAPC">
                                    </dx:ASPxComboBox>
                                    <div style="float: right">
                                        <dx:ASPxButton Text="Approved" ID="btnApproved3" runat="server"></dx:ASPxButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; width: 150px">QEP
                                </td>
                                <td>
                                    <dx:ASPxComboBox runat="server" ReadOnly="true" ID="ddlQEP">
                                    </dx:ASPxComboBox>
                                    <div style="float: right">
                                        <dx:ASPxButton Text="Approved" ID="btnApproved4" runat="server"></dx:ASPxButton>
                                    </div>
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
                    </div>

                </div>
                <dx:ASPxGridView ID="detailGrid" runat="server" DataSourceID="SqlDataSource2" KeyFieldName="Id"
                    Width="100%" OnBeforePerformDataSelect="detailGrid_DataSelect" AutoGenerateColumns="False">
                    <Columns>

                        <dx:GridViewDataTextColumn FieldName="OldPartNumber" VisibleIndex="2"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="OldDescription" VisibleIndex="3"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="OldQty" VisibleIndex="4"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="OldESD" VisibleIndex="5"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NewPartNumber" VisibleIndex="6"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NewDescription" VisibleIndex="7"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NewQty" VisibleIndex="8"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NewESD" VisibleIndex="9"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ID" FieldName="NewID" VisibleIndex="10"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Index" FieldName="NewIndex" VisibleIndex="11"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dialog Address" FieldName="NewDialogAddress" VisibleIndex="12"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Assy" FieldName="NewAssy" VisibleIndex="13"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Remark" FieldName="NewRemark" VisibleIndex="14"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>

        <SettingsPager PageSize="32" />
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />
        <Settings ShowGroupPanel="True" />
        <SettingsDetail ShowDetailRow="true" />
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="masterDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="SELECT * FROM [RecordImplemControl] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsOrganization" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, Name, Code, Decsription from Organizations Order by Name"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="SELECT [Id],[RICId],[OldNo],[OldPartNo],[OldPartDescription],[OldQty],[OldESD],[NewPartNo],[NewPartDescription],[NewQty],[NewESD],[PackID],[NewIndex],[DialogAddress],[CGISNumber],[Remark],[NewPartNumber],[NewDescription],[PartNumberGab],[OldCode],[NewCode] FROM [RecordImplemControlDetail] WHERE ([RICId] = @RICId)"
        DeleteCommand="DELETE FROM [RecordImplemControlDetail] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [RecordImplemControlDetail] ([RICId],[OldNo],[OldPartNo],[OldPartDescription],[OldQty],[OldESD],[NewPartNo],[NewPartDescription],[NewQty],[NewESD],[PackID],[NewIndex],[DialogAddress],[CGISNumber],[Remark],[NewPartNumber],[NewDescription],[PartNumberGab],[OldCode],[NewCode]) VALUES (@RICId,@OldNo,@OldPartNo,@OldPartDescription,@OldQty,@OldESD,@NewPartNo,@NewPartDescription,@NewQty,@NewESD,@PackID,@NewIndex,@DialogAddress,@CGISNumber,@Remark,@NewPartNumber,@NewDescription,@PartNumberGab,@OldCode,@NewCode)"
        UpdateCommand="UPDATE [RecordImplemControlDetail] SET [RICId] = @RICId, [OldNo] = @OldNo, [OldPartNo] = @OldPartNo, [OldPartDescription] = @OldPartDescription, [OldQty] = @OldQty, [OldESD] = @OldESD, [NewPartNo] = @NewPartNo, [NewPartDescription] = @NewPartDescription, [NewQty] = @NewQty,[NewESD] = @NewESD,[PackID] = @PackID,[NewIndex] = @NewIndex,[DialogAddress] = @DialogAddress,[CGISNumber] = @CGISNumber,[Remark] = @Remark,[NewPartNumber] = @NewPartNumber ,[NewDescription] = @NewDescription,[PartNumberGab] = @PartNumberGab,[OldCode] = @OldCode,[NewCode] = @NewCode WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter DefaultValue="0" Name="RICId2" SessionField="sessiionRICId2" Type="Int32" />
            <asp:Parameter Name="RICId" Type="Int32" />
            <asp:Parameter Name="OldNo" Type="Int32" />
            <asp:Parameter Name="OldPartNo" Type="String" />
            <asp:Parameter Name="OldPartDescription" Type="String" />
            <asp:Parameter Name="OldQty" Type="Decimal" />
            <asp:Parameter Name="OldESD" Type="String" />
            <asp:Parameter Name="NewPartNo" Type="String" />
            <asp:Parameter Name="NewPartDescription" Type="String" />
            <asp:Parameter Name="NewQty" Type="Decimal" />
            <asp:Parameter Name="NewESD" Type="String" />
            <asp:Parameter Name="PackID" Type="String" />
            <asp:Parameter Name="NewIndex" Type="String" />
            <asp:Parameter Name="DialogAddress" Type="String" />
            <asp:Parameter Name="CGISNumber" Type="String" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="NewPartNumber" Type="String" />
            <asp:Parameter Name="NewDescription" Type="String" />
            <asp:Parameter Name="PartNumberGab" Type="String" />
            <asp:Parameter Name="OldCode" Type="String" />
            <asp:Parameter Name="NewCode" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="RICId" SessionField="sessiionRICId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RICId" Type="Int32" />
            <asp:Parameter Name="OldNo" Type="Int32" />
            <asp:Parameter Name="OldPartNo" Type="String" />
            <asp:Parameter Name="OldPartDescription" Type="String" />
            <asp:Parameter Name="OldQty" Type="Decimal" />
            <asp:Parameter Name="OldESD" Type="String" />
            <asp:Parameter Name="NewPartNo" Type="String" />
            <asp:Parameter Name="NewPartDescription" Type="String" />
            <asp:Parameter Name="NewQty" Type="Decimal" />
            <asp:Parameter Name="NewESD" Type="String" />
            <asp:Parameter Name="PackID" Type="String" />
            <asp:Parameter Name="NewIndex" Type="String" />
            <asp:Parameter Name="DialogAddress" Type="String" />
            <asp:Parameter Name="CGISNumber" Type="String" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="NewPartNumber" Type="String" />
            <asp:Parameter Name="NewDescription" Type="String" />
            <asp:Parameter Name="PartNumberGab" Type="String" />
            <asp:Parameter Name="OldCode" Type="String" />
            <asp:Parameter Name="NewCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsAlteration" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, Reason from Alterations Order by Reason"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPackingMonth" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, PackingMth from PackingMonths Order by PackingMth"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsRICStatus" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, Name from RICStatus Order by Name"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsUser" runat="server"
        ConnectionString="<%$ ConnectionStrings:DotWebDb %>"
        SelectCommand="Select Id,UserName,OrganizationId from Users Order by UserName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVariant" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, Variant, Code from Variants Order by Variant"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SdsModel" runat="server"
        ConnectionString="<%$ ConnectionStrings:AppDb %>"
        SelectCommand="Select Id, ModelName from Models "></asp:SqlDataSource>

</asp:Content>
