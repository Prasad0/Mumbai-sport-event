<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="usersite.aspx.cs" Inherits="usersite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="col-lg-offset-2 col-lg-7 well" align="center">User details</h1>
    <div class="col-lg-offset-2 col-lg-7 well">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table width="100%" class="display table table-striped table-bordered table-responsive" id="tblCustomer" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: auto;">Name</th>
                                <th style="width: auto;">Address</th>
                                <th style="width: auto;">Mobile number</th>
                                <th style="width: auto;">Email Id</th>
                                <th style="width: 30px;">Delete</th>

                            </tr>
                        </thead>
        </HeaderTemplate>
        <ItemTemplate>
             <tr>
                        <td>
                            <%# Eval("fname") %></td>
                  <td>
                            <%# Eval("lname") %></td>
                        <td>
                            <%# Eval("uemail") %></td>
                        <td>
                            <%# Eval("address") %></td>                     
                        <td>
                            <asp:ImageButton ImageUrl="~/Images/Logos/Delete.png" ID="imgDelete" runat="server" CommandName="edit" OnClick="imgDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "uid") %>'></asp:ImageButton></td>
                    </tr>
        </ItemTemplate>
         <FooterTemplate>
                    </table>
                </FooterTemplate>
    </asp:Repeater>
        </div>
</asp:Content>

