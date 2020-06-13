<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookedEvents.aspx.cs" Inherits="BookedEvents" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="container">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div>
            <table class="nav-justified">
                <tr>
                    <td rowspan="2">
                        <asp:Image ID="Image1" ImageUrl='<%#"Images/event/"+ Eval("ephoto")%>' style="height:90px;width:160px;" runat="server" />
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkbEName" runat="server" Text='<%#Eval("ename")%>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTime" runat="server" Text='<%#Eval("estartdate")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><asp:ImageButton ImageUrl="~/Images/Logos/Delete.png" ID="imgDelete" runat="server" OnClick="imgDelete_Click" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "bkid") %>'></asp:ImageButton></td>
                </tr>
            </table>
                    <br />
        </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

