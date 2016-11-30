<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ToolVerification.aspx.cs" Inherits="DotMercy.custom.ToolManagement.ToolVerification" %>
<%--Copy Dari Sini--%>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">Tool Verification

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
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
            var GetValueMax = Text_Max.GetText();
            var GetValueMin = Text_Min.GetText();
            var ValueText_VerValue1 = Text_VerValue1.GetText();
            var ValueText_VerValue2 = Text_VerValue2.GetText();
            var ValueText_VerValue3 = Text_VerValue3.GetText();
            if (parseFloat(ValueText_VerValue1) < parseFloat(GetValueMin)) {
                Text_VerValue1.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
                Btn_mark.SetEnabled();
           
            }
            if (parseFloat(ValueText_VerValue1) > parseFloat(GetValueMax)) {
                Text_VerValue1.GetMainElement().style.backgroundColor = "red";
                valueattempt +=  1;
                Btn_mark.SetEnabled();
                Lbl_Verify.SetText("FAILED");
            }
            if (parseFloat(ValueText_VerValue2) < parseFloat(GetValueMin)) {
                Text_VerValue2.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
                Btn_mark.SetEnabled();
             
            }
            if (parseFloat(ValueText_VerValue2) > parseFloat(GetValueMax)) {
                Text_VerValue2.GetMainElement().style.backgroundColor = "red";
                valueattempt +=  1;
                Btn_mark.SetEnabled();
            }
            if (parseFloat(ValueText_VerValue3) < parseFloat(GetValueMin)) {
                Text_VerValue3.GetMainElement().style.backgroundColor = "red";
                valueattempt +=  1;
                Btn_mark.SetEnabled();
           
            }
            if (parseFloat(ValueText_VerValue3) > parseFloat(GetValueMax)) {
                Text_VerValue3.GetMainElement().style.backgroundColor = "red";
                valueattempt += 1;
               
              
            }
            if (parseFloat(ValueText_VerValue1) > parseFloat(GetValueMin) && parseFloat(ValueText_VerValue1) < parseFloat(GetValueMax)) {
                Text_VerValue1.GetMainElement().style.backgroundColor = "Green";
             
            }
            if (parseFloat(ValueText_VerValue2) > parseFloat(GetValueMin) && parseFloat(ValueText_VerValue2) < parseFloat(GetValueMax)) {
                Text_VerValue2.GetMainElement().style.backgroundColor = "Green";
        
            }
            if (parseFloat(ValueText_VerValue3) > parseFloat(GetValueMin) && parseFloat(ValueText_VerValue3) < parseFloat(GetValueMax)) {
                Text_VerValue3.GetMainElement().style.backgroundColor = "Green";
               
            }
            if (valueattempt >= 1) {
                var getvalue= lbl_Attempt.GetText();
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
            if (Text_VerValue1.GetMainElement().style.backgroundColor == "green" && Text_VerValue2.GetMainElement().style.backgroundColor == "green" && Text_VerValue3.GetMainElement().style.backgroundColor == "green") {
                Lbl_Verify.SetText("Success");
                Lbl_Verify.GetMainElement().style.backgroundColor = "Green";
            }
            if (Text_VerValue1.GetMainElement().style.backgroundColor == "red" || Text_VerValue2.GetMainElement().style.backgroundColor == "red" || Text_VerValue3.GetMainElement().style.backgroundColor == "red") {
                Lbl_Verify.SetText("Failed");
                Lbl_Verify.GetMainElement().style.backgroundColor = "red";
            }
        }
       
    </script>
    <style>

    </style>
    <div class="content">
        <h2>Tool Verification</h2>  
   <asp:HiddenField id="hiddenvalue" runat="server" EnableViewState="true"/>
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
                        <dx:LayoutGroup Caption="" ColCount="5">
                            <Items>
                                <dx:LayoutItem Caption="NM">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_NM" CssClass="TextNmCSS" runat="server" ClientInstanceName="Text_NM" Width="170px">
                                                <ClientSideEvents KeyUp="functionMaxMin" />
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Min">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_Min"  runat="server" Width="170px" ClientInstanceName="Text_Min">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Max" ColSpan="3">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_Max"  runat="server" Width="170px" ClientInstanceName="Text_Max">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Verification">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue1" runat="server" Width="170px" ClientInstanceName="Text_VerValue1">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue2" runat="server" ClientInstanceName="Text_VerValue2" Width="170px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="Text_VerValue3" runat="server" ClientInstanceName="Text_VerValue3" Width="170px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton ID="Btn_Verify" runat="server" Text="Verify" AutoPostBack="False">
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
                        <dx:LayoutGroup Border-BorderStyle="None" Border-BorderWidth="0px" BorderLeft-BorderStyle="None" Caption="" ColCount="2">
                            <BorderLeft BorderStyle="None" />
                            <Border BorderStyle="None" BorderWidth="0px" />
                            <Items>
                                <dx:LayoutItem Caption="">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton ID="Btn_mark" runat="server" style="float: right;" Text="Mark As Scrap" ClientInstanceName="Btn_mark" OnClick="Btn_mark_Click">
                                                <ClientSideEvents Click="ClickMarkValidasi" />
                                            </dx:ASPxButton>    
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="" Width="10px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" style="width:10px;">
                                            <dx:ASPxButton ID="BtnSave" ClientInstanceName="Btn_Save"  runat="server" style="width:10px;float:right" Text="Save" OnClick="Btn_Save">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AppDb %>" SelectCommand="select distinct d.ResultId Status,a.Id,a.Description,b.InventoryNumber,c.CalDate,d.VerDate,a.Number from tools a left join ToolInventories b on a.Id = b.ToolSetupId
LEFT JOIN ToolCalibrations c on c.ToolSetupId = a.Id
LEFT JOIN ToolVerifications d on d.ToolSetupId = a.Id Where b.InventoryNumber !=''"></asp:SqlDataSource>

  
</asp:Content>
