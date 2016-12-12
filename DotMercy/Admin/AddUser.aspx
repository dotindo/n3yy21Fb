<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="DotMercy.Admin.AddUser" %>
<asp:Content ID="pageTitle" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: 10px; margin-right: 10px">
        <div class="accountHeader">
            <h2>Create a New Account</h2>
            <p>Use the form below to create a new account.</p>
        </div>
        <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="User Name:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px">
                <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
                    <RequiredField ErrorText="User Name is required." IsRequired="true" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxLabel ID="lblEmail" runat="server" AssociatedControlID="tbEmail" Text="E-mail:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbEmail" runat="server" Width="200px">
                <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
                    <RequiredField ErrorText="E-mail is required." IsRequired="true" />
                    <RegularExpression ErrorText="Email validation failed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxLabel ID="lblFirstName" runat="server" AssociatedControlID="tbFirstName" Text="First Name:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbFirstName" runat="server" Width="200px">
                <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
                    <RequiredField ErrorText="First name is required." IsRequired="true" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxLabel ID="lblLastName" runat="server" AssociatedControlID="tbLastName" Text="Last Name:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbLastName" runat="server" Width="200px">
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxLabel ID="lblOrganization" runat="server" AssociatedControlID="cbOrganization" Text="Organization:" />
        <div class="form-field">
            <dx:ASPxComboBox ID="cbOrganization" runat="server" Width="200px" DataSourceID="organizationsDataSource" ValueField="Id" TextField="Name">
            </dx:ASPxComboBox>
        </div>
        <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
                Width="200px">
                <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
                    <RequiredField ErrorText="Password is required." IsRequired="true" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
            Text="Confirm password:" />
        <div class="form-field">
            <dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
                <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
                    <RequiredField ErrorText="Confirm Password is required." IsRequired="true" />
                </ValidationSettings>
                <ClientSideEvents Validation="function(s, e) {
                    var originalPasswd = Password.GetText();
                    var currentPasswd = s.GetText();
                    e.isValid = (originalPasswd  == currentPasswd );
                    e.errorText = 'The Password and Confirmation Password must match.';
                }" />
            </dx:ASPxTextBox>
        </div>
        <div id="divError" runat="server" Class="form-field hidden">
            <dx:ASPxLabel ID="lblError" runat="server" CssClass="errorText"></dx:ASPxLabel>
        </div>
        <dx:ASPxButton ID="btnCreateUser" runat="server" Text="Create User" ValidationGroup="RegisterUserValidationGroup"
            OnClick="btnCreateUser_Click">
        </dx:ASPxButton>
    </div>
    <ef:EntityDataSource ID="organizationsDataSource" runat="server" ContextTypeName="DotWeb.DotWebDb" EntitySetName="Organizations" />
</asp:Content>
