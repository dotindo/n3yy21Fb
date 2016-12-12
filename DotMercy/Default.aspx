<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DotMercy._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%--    <script type="text/javascript">
    </script>

    <div class="container-fluid">
    <div class="content row">
        <div class="col-md-5 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">My Tasks</div>
                <div class="panel-body">
                    <asp:GridView ID="gvPendingTask" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-CssClass="tblaltrow"
                        EmptyDataText="Pending tasks not available..." GridLines="None" Width="100%" Style="padding-top: 10px;" ShowHeader="false">
                        <Columns>
                            <asp:BoundField DataField="Id" Visible="false" />
                            <asp:BoundField DataField="UserId" Visible="false" />
                            <asp:BoundField DataField="Task" ItemStyle-CssClass="GridViewRow"
                                ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Justify" ItemStyle-Wrap="true" />
                            <asp:TemplateField ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" ControlStyle-Font-Underline="false" ItemStyle-CssClass="GridViewRow">
                                <ItemTemplate>
                                    <asp:HyperLink Target="_blank" runat="server" NavigateUrl='<%# Eval("Link") %>' Class="btn btn-xs btn-primary"
                                        Text='Open' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">Notifications</div>
                <div class="panel-body">
                    <asp:GridView ID="gvNotification" runat="server" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="tblaltrow"
                        EmptyDataText="Notifications not available..." GridLines="None" Width="100%" Style="padding-top: 10px;" ShowHeader="false">
                        <Columns>
                            <asp:BoundField DataField="Id" Visible="False" />
                            <asp:BoundField DataField="Username">
                                <ItemStyle VerticalAlign="Top" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Message">
                                <ItemStyle CssClass="GridViewRow" HorizontalAlign="Justify" VerticalAlign="Middle" Wrap="True" />
                            </asp:BoundField>
                            <asp:TemplateField ItemStyle-CssClass="GridViewRow">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Link") %>' Target="_blank" Text="Open" Class="btn btn-xs btn-primary" />
                                </ItemTemplate>
                                <ControlStyle Font-Underline="False" />
                                <ItemStyle Font-Bold="True" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}">
                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="150px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    </div>--%>
</asp:Content>
