<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="PackingList.aspx.cs" Inherits="DotMercy.custom.PackingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">Upload File
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
            
            function FileType_SelectedIndexChanged(s, e) {
                //FileType.FileType_SelectedIndexChanged = s.GetValue().toString();
                //FileType.PerformCallback(s.GetValue().toString()); 
                
            }
            function ALertMessage(message) {
                alert(message);
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
                    //alert("Upload Success");
                    } else {
                    //alert("Error Uploading Data");
                    }
                    //alert(args.errorText);
                    //btnUpload_DataUji.SetText("Uploaded");
                }
            }

        function AlertRedirect(redirect) {
            if (String.length(redirect)>0) {
                //show alert
                alert('Upload File Success');
                //redirect to checklist
                window.location = redirect;
            } else {
                //show alert
                alert('File Upload Failed!');
            }
        }

    </script>

    <div id="MainContainer" class="content" runat="server">
        <h2>Upload File</h2>
        <table width="50%" cellpadding="5" style="width: 50%; margin-left: 30px" class="dxgvEditFormTable">
                <tr>
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                        Packing Month
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                        :
                    </td>                                             
                   
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                    <%-- <dx:ASPxComboBox ID="PackingMonth" runat="server" ValueType="System.Int32"
                            ClientInstanceName="cbPackingMonth" DataSourceID="sdsPackingMonth" IncrementalFilteringMode="Contains"
                            TextField="PackingMth" ValueField="Id" Width="100%" >
                        </dx:ASPxComboBox>    --%>
                    <%--<dx:ASPxDateEdit ID="dtPackingMonth" runat="server" DisplayFormatString="yyyyMM" EditFormat="Custom">
                        </dx:ASPxDateEdit>   --%>
                    <dx:ASPxTextBox ID="dtPackingMonth" runat="server" ClientInstanceName="dtPackingMonth">
                    </dx:ASPxTextBox>
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
                            ClientInstanceName="cbModel" DataSourceID="sdsModel"
                            TextField="VarianName" ValueField="Id" Width="100%" >
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
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                        File Type
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                        :
                    </td>                                             
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                        <dx:ASPxComboBox ID="FileType" runat="server" ValueType="System.Int32"
                            ClientInstanceName="FileType" DataSourceID="sdsFileType" IncrementalFilteringMode="Contains"
                            TextField="Name" ValueField="Id" Width="100%" OnCallback="FileType_Callback" >
                            <ClientSideEvents SelectedIndexChanged="FileType_SelectedIndexChanged" />
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                <RequiredField ErrorText="File Type not null" IsRequired="true" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>                                                                          
                    </td>
                </tr>

                <%--<tr>                                                               
                    <td class="tdEditFormCell" colspan="3" style="width: 10%" align="left">
                        <dx:ASPxButton ID="btnValidation" runat="server" AutoPostBack="False" 
							ClientInstanceName="btnValidation" Text="Validation" OnClick="FileType_SelectedIndexChanged">
                            
                        </dx:ASPxButton>
                    </td>
                </tr>--%>

                <tr>
                    <td class="tdEditFormCell" colspan="3" align="left">
                        &nbsp;
                    </td>
                </tr>

                <tr>
                    <td class="tdEditFormCell" style="width: 5%" align="left">
                    
                    </td>    
                    <td class="tdEditFormCell" style="width: 1%" align="left">
                    
                    </td> 
                    <td class="tdEditFormCell" style="width: 10%" align="left">
                        <div class="uploadContainer">
                            <dx:ASPxUploadControl ID="UcDataUji" runat="server" Width="250px" ClientInstanceName="UcDataUji"
                                NullText="Click here to browse files..." OnFileUploadComplete="UcDataUji_FileUploadComplete">
                                <ClientSideEvents FileUploadComplete="function(s, e) { UcDataUji_OnFileUploadComplete(e); }"
                                    FileUploadStart="function(s, e) { UcDataUji_OnUploadStart(); }"
                                TextChanged="function(s,e) { UpdateUploadButton(); }"></ClientSideEvents>
                            <ValidationSettings AllowedFileExtensions=".xlsx, .xls, .txt, .TXT, .csv">
                                </ValidationSettings>
                            </dx:ASPxUploadControl>

                            <dx:ASPxButton ID="btnUpload_DataUji" runat="server" AutoPostBack="False" ClientInstanceName="btnUpload_DataUji"
                                Style="text-align: left" Text="Upload" ClientEnabled="false" OnClick="FileType_SelectedIndexChanged" >
                                <ClientSideEvents Click="function(s, e) { UcDataUji.UploadFile();}" />
                            </dx:ASPxButton>

                        </div>
                    </td>
                </tr>

            </table>
       
        
    </div>


	<asp:SqlDataSource ID="sdsModel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, TypeId VarianCode, ModelName VarianName from Models Order by ModelName">                   
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsVarian" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="SELECT [Id], [ModelId], [Code] + '/' + [Variant] [Variant] FROM [Variants]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsFileType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppDb %>" 
        SelectCommand="Select  Id, Name from FileType Order by Id">                   
    </asp:SqlDataSource>


</asp:Content>
