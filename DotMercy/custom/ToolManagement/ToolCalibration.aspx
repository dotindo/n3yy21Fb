<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ToolCalibration.aspx.cs" Inherits="DotMercy.custom.ToolManagement.ToolCalibration" %>
<%--Copy Dari Sini--%>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">Tool Calibration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function PickDate() {
            //$('#datepicker').datepicker({ minDate: 0 });
            DateDetails.date
        }
        function ClickMarkValidasi() {
            var GetValueNM = Text_NM.GetText();
            var GetValueVer1 = Text_VerValue1.GetText();
            var GetValueVer2 = Text_VerValue2.GetText();
            var GetValueVer3 = Text_VerValue3.GetText();
            if (GetValueNM == '') {
                alert('Please Fill Nm')
                return false;
            }
            if (GetValueVer1 == '') {
                alert('Please Fill Verification one')
                return false;
            }
            if (GetValueVer2 == '') {
                alert('Please Fill Verification two')
                return false;
            }
            if (GetValueVer3 == '') {
                alert('Please Fill Verification three')
                return false;
            }

        }
        function ClickSaveValidasi() {
            var GetValueNM = Text_NM.GetText();
            var GetValueVer1 = Text_VerValue1.GetText();
            var GetValueVer2 = Text_VerValue2.GetText();
            var GetValueVer3 = Text_VerValue3.GetText();
            if (GetValueNM == '') {
                alert('Please Fill Nm')
                return false;
            }
            if (GetValueVer1 == '') {
                alert('Please Fill Verification one')
                return false;
            }
            if (GetValueVer2 == '') {
                alert('Please Fill Verification two')
                return false;
            }
            if (GetValueVer3 == '') {
                alert('Please Fill Verification three')
                return false;
            }
            if (Text_VerValue1.GetMainElement().style.backgroundColor == "red") {
                alert('Verification One Failed Please Verify again')
                return false;
            }
            if (Text_VerValue2.GetMainElement().style.backgroundColor == "red") {
                alert('Verification Two Failed Please Verify again')
                return false;
            }
            if (Text_VerValue3.GetMainElement().style.backgroundColor == "red") {
                alert('Verification three Failed Please Verify again')
                return false;
            }
        }
        function CollapsingDetailRow() {
            //  Btn_mark.SetEnabled(true);
        }
        function ExpandingDetailRow() {
            //   Btn_mark.SetEnabled(true);
        }
        function functionMaxMin() {
            Btn_mark.SetEnabled(true);
            var GetValueNM = Text_NM.GetText();
            if (GetValueNM > 10) {
                var Persentase = GetValueNM * (4 / 100);
                var NilMax = parseInt(GetValueNM) + Persentase;
                var NilMin = parseInt(GetValueNM) - Persentase;
                Text_Max.SetText(NilMax);
                Text_Min.SetText(NilMin);
            } else {
                var Persentase = GetValueNM * (6 / 100);
                var NilMax = parseInt(GetValueNM) + Persentase;
                var NilMin = parseInt(GetValueNM) - Persentase;
                Text_Max.SetText(NilMax);
                Text_Min.SetText(NilMin);
            }

        };
        function Validasi() {
            Btn_mark.SetEnabled(true);
            var valueattempt = '';
            var GetValueRange = lblNmRange.GetText();
            var GetValueMax = GetValueRange.split('-')[1].split(' ')[0];
            //20%
            var ValueText_VerValue1 = Text_VerValue1.GetText();
            var ValuePersen1 = GetValueMax * (20 / 100);
            //40%
            var ValueText_VerValue2 = Text_VerValue2.GetText();
            var ValuePersen2 = GetValueMax * (40 / 100);
            //60%
            var ValueText_VerValue3 = Text_VerValue3.GetText();
            var ValuePersen3 = GetValueMax * (60 / 100);
            //80%
            var ValueText_VerValue4 = Text_VerValue4.GetText();
            var ValuePersen4 = GetValueMax * (80 / 100);
            //100%
            var ValueText_VerValue5 = Text_VerValue5.GetText();
            var ValuePersen5 = GetValueMax * (100 / 100);
            
            //validasi 20%  10 < 9
            var GetRangePersen20 = ValuePersen1 - ValueText_VerValue1;
            if (Math.abs(GetRangePersen20) > 1) {
                Text_VerValue1.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
            }
            if (Math.abs(GetRangePersen20) <= 1) {
                Text_VerValue1.GetMainElement().style.backgroundColor = "green";
            }
            //validasi 40%
            var GetRangePersen40 = ValuePersen2 - ValueText_VerValue2;
            if (Math.abs(GetRangePersen40) > 1) {
                Text_VerValue2.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
            }
            if (Math.abs(GetRangePersen40) <= 1) {
                Text_VerValue2.GetMainElement().style.backgroundColor = "green";
            }
            //validasi 60%
            var GetRangePersen60 = ValuePersen3 - ValueText_VerValue3;
            if (Math.abs(GetRangePersen60) > 1) {
                Text_VerValue3.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
            }
            if (Math.abs(GetRangePersen60) <= 1) {
                Text_VerValue3.GetMainElement().style.backgroundColor = "green";
            }
            //validasi80%
            var GetRangePersen80 = ValuePersen4 - ValueText_VerValue4;
            if (Math.abs(GetRangePersen80) > 1) {
                Text_VerValue4.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
            }
            if (Math.abs(GetRangePersen80) <= 1) {
                Text_VerValue4.GetMainElement().style.backgroundColor = "green";
            }
            //validasi100%
            var GetRangePersen100 = ValuePersen5 - ValueText_VerValue5;
            if (Math.abs(GetRangePersen100) > 1) {
                Text_VerValue5.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
            }
            if (Math.abs(GetRangePersen100) <= 1) {
                Text_VerValue5.GetMainElement().style.backgroundColor = "green";
            }
            if (parseFloat(valueattempt) >= 1) {
                var getvalue = lbl_Attempt.GetText();
                if (getvalue == "") {
                    lbl_Attempt.SetText(0);
                }
                var valueattemptUI = parseInt(lbl_Attempt.GetText()) + 1;
                lbl_Attempt.SetText(valueattemptUI);
              

            }
            if (parseInt(lbl_Attempt.GetText()) >= 3) {
                //Btn_mark.SetEnabled();
                Btn_mark.SetEnabled(true);
                Btn_Save.SetEnabled();
            }
            if (Text_VerValue1.GetMainElement().style.backgroundColor == "green" && Text_VerValue2.GetMainElement().style.backgroundColor == "green" && Text_VerValue3.GetMainElement().style.backgroundColor == "green" && Text_VerValue4.GetMainElement().style.backgroundColor == "green" && Text_VerValue5.GetMainElement().style.backgroundColor == "green") {
                Lbl_Verify.SetText("Success");
                Lbl_Verify.GetMainElement().style.backgroundColor = "Green";
             
            }
            if (Text_VerValue1.GetMainElement().style.backgroundColor == "red" || Text_VerValue2.GetMainElement().style.backgroundColor == "red" || Text_VerValue3.GetMainElement().style.backgroundColor == "red" || Text_VerValue4.GetMainElement().style.backgroundColor == "red" || Text_VerValue5.GetMainElement().style.backgroundColor == "red") {
                Lbl_Verify.SetText("Failed");
                Lbl_Verify.GetMainElement().style.backgroundColor = "red";
            }
        }

    </script>
    <div class="content">
        <h2>Tool Calibration</h2>        
       <dx:ASPxGridView ID="GridviewToolVerification" runat="server" KeyFieldName="Id;InventoryNumber" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnDetailRowExpandedChanged="DetailChangedTes" ClientInstanceName="GridviewToolVerification">
        <ClientSideEvents DetailRowCollapsing="CollapsingDetailRow" DetailRowExpanding="ExpandingDetailRow" />
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InventoryNumber" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Status" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxFormLayout ID="LayoutDetails" runat="server" ClientInstanceName="LayoutDetails" KeyFieldName="Id;InventoryNumber" DataSourceID="SqlDataSource1" ClientIDMode="Static" ViewStateMode="Enabled" >
                    <Items>
                        <dx:LayoutItem Caption="Last Calibration Date">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <dx:ASPxLabel ID="lblCalibrationDate" runat="server" ClientInstanceName="lblCalibrationDate">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Last Verification Date">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblVerificationDate" runat="server" ClientInstanceName="lblVerificationDate" ViewStateMode="Enabled">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tool Number">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblToolNumber" runat="server" ClientInstanceName="lblToolNumber" ViewStateMode="Enabled">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Inventory Number">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblInventoryNumber" runat="server" ClientInstanceName="lblInventoryNumber">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                          <dx:LayoutItem Caption="Nm Range">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblNmRange" runat="server" ClientInstanceName="lblNmRange">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutGroup Caption="" ColCount="8">
                            <Items>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E1" runat="server" Text="20%" Width="20px">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E2" runat="server" Text="40%">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E3" runat="server" Text="60%">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E4" runat="server" Text="80%">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                 <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E6" runat="server" Text="100%">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="" ColSpan="3">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="LayoutDetails_E7" runat="server" Text="">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Verification">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue1" runat="server" ClientInstanceName="Text_VerValue1" Width="60px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue2" runat="server" ClientInstanceName="Text_VerValue2" Width="60px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue3" runat="server" ClientInstanceName="Text_VerValue3" Width="60px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                 <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue4" runat="server" ClientInstanceName="Text_VerValue4" Width="60px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue5" runat="server" ClientInstanceName="Text_VerValue5" Width="60px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton ID="Btn_Verify" runat="server" AutoPostBack="False" Text="Verify" UseSubmitBehavior="False">
                                                <ClientSideEvents Click="Validasi" />
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="Lbl_Verify" runat="server" ClientInstanceName="Lbl_Verify">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Attempt">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxLabel ID="lbl_Attempt" runat="server" ClientInstanceName="lbl_Attempt">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="">
                            <CellStyle>
                                <Border BorderColor="White" BorderStyle="None" />
                            </CellStyle>
                            <Items>
                                <dx:LayoutItem Caption="Remarks" Name="Memo_Remarks">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxMemo ID="RemarksDetail" runat="server" Height="71px" Width="628px">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Next Calibration Date" Name="DateNextCalibration">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="DateDetails" runat="server" ClientInstanceName="DateDetails" OnCalendarDayCellPrepared="DateDetails">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Border-BorderStyle="None" Border-BorderWidth="0px" BorderLeft-BorderStyle="None" Caption="" ColCount="2">
                            <BorderLeft BorderStyle="None" />
                            <Border BorderStyle="None" BorderWidth="0px" />
                            <Items>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton ID="Btn_mark" runat="server" Text="MarkAsCrap" OnClick="MarkAsCrapSave">
                                            </dx:ASPxButton>    
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="" Width="10px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" style="width:10px;">
                                            <dx:ASPxButton ID="BtnSave"  runat="server" style="width:10px;float:right" Text="Save" OnClick="SaveCalibration">
                                                <ClientSideEvents Click="ClickSaveValidasi" />
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="select DISTINCT d.ResultId Status,a.Id,a.Description,b.InventoryNumber,c.CalDate,d.VerDate,a.Number from tools a left join ToolInventories b on a.Id = b.ToolSetupId
LEFT JOIN ToolCalibrations c on c.ToolSetupId = a.Id
LEFT JOIN ToolVerifications d on d.ToolSetupId = a.Id Where b.InventoryNumber !=''"></asp:SqlDataSource>
</asp:Content>
