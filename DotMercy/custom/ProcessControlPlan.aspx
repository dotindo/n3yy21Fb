<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ProcessControlPlan.aspx.cs" Inherits="DotMercy.custom.ProcessControlPlan" %>

<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
            
            function FileType_SelectedIndexChanged(s, e) {
                //FileType.FileType_SelectedIndexChanged = s.GetValue().toString();
                //FileType.PerformCallback(s.GetValue().toString()); 
                
            }

            /* UPLOAD CONTROL DATA UJI */
            function UpdateUploadButton() {
                btnUpload_DataUji.SetEnabled(UcDataUji.GetText(0) != "");
            }

            function UcDataUji_OnUploadStart() {
                btnUpload_DataUji.SetText('Uploading...');
                UpdateUploadButton();
            }

            function UcDataUji_OnFileUploadComplete(args) {

                if (args.isValid && args.callbackData != "") {

                    src = args.callbackData;
                    arrSplit = src.split("|");
                    tb_attach_filename.SetText(arrSplit[0]);
                    tb_attach_filename.Validate();

                } else {
                    if (args.isValid) {
                        alert("Import Data Sucessfully");
                    } else {
                        alert("Error Import Data");
                    }
                    //alert(args.errorText);
                    btnUpload_DataUji.SetText("Uploaded");
                }
            }

    </script>

    <div id="MainContainer" runat="server">
        
        
            <table width="50%" cellpadding="5" style="width:50%; margin-left: 30px" class="dxgvEditFormTable">

                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="3" style="font-weight: bold; font-size:medium">Process Control Plan</td>
                </tr>

                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>

                <tr>
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                        Packing Month
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                        :
                    </td>                                             
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                        <%--<dx:ASPxComboBox ID="PackingMonth" runat="server" ValueType="System.Int32"
                            ClientInstanceName="cbPackingMonth" DataSourceID="sdsPackingMonth" IncrementalFilteringMode="Contains"
                            TextField="PackingMth" ValueField="Id" Width="100%" >
                        </dx:ASPxComboBox>  --%>      
                        <dx:ASPxDateEdit ID="PackingMonth" runat="server" ClientInstanceName="PackingMonth" EditFormat="Custom" >

                        </dx:ASPxDateEdit>                                    
                    </td>
                </tr>

                <tr>
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                        Model Varian
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                        :
                    </td>                                             
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                        <dx:ASPxComboBox ID="ModelId" runat="server" ValueType="System.Int32"
                            ClientInstanceName="cbModel" DataSourceID="sdsModel" IncrementalFilteringMode="Contains"
                            TextField="ModelName" ValueField="Id" Width="100%" >
                        </dx:ASPxComboBox>                                                  
                    </td>
                </tr>

                <tr>
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                        Varian
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                        :
                    </td>                                             
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                        <dx:ASPxComboBox ID="VarianId" runat="server" ValueType="System.Int32"
                            ClientInstanceName="VarianId" DataSourceID="sdsVarian" IncrementalFilteringMode="Contains"
                            TextField="Variant" ValueField="Id" Width="100%" >
                        </dx:ASPxComboBox>                                                  
                    </td>
                </tr>

                
                <tr>                                                               
                    <td class="tdEditFormCell" colspan="3" style="width: 10%" align="left">
                        <dx:ASPxButton ID="btnProcess" runat="server" AutoPostBack="False" 
							ClientInstanceName="btnProcess" Text="Process" OnClick="FileType_SelectedIndexChanged">
                            
                        </dx:ASPxButton>
                    </td>
                </tr>


            </table>
       
        
    </div>


	<asp:SqlDataSource ID="sdsModel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, ModelName, TypeId from Models Order by ModelName">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVarian" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, ModelId, Variant from Variants Order by Variant">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPackingMonth" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select Id, PackingMth from PackingMonths Order by PackingMth">                   
    </asp:SqlDataSource>

</asp:Content>
