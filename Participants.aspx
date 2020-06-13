<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="Participants.aspx.cs" Inherits="Participants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:150px;">
        <div class="col-lg-8 col-lg-pull-1 ">
            <div class="box">
                <div class="box-body" style="overflow-x: auto">


                    <asp:Repeater ID="Repeater1" runat="server"  >
                        <HeaderTemplate>
                            <table width="100%" class="display table table-striped table-bordered table-responsive" id="tblProduct" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="width: auto;">Name</th>
                                        <th style="width: auto;">Email</th>
                                     <th style="width: auto;">Image</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("fname") %></td>
                                <td>
                                    <%# Eval("uemail") %></td>
                                <td>
                                        <asp:Image id="image" CssClass="img-responsive" runat="server" Heigth="100" width="100" ImageUrl='<%#"~/Images/userImages/"+Eval("photo") %>' />
                                    </td>
                                <%--<td>
                                    <%# Eval("pqty") %></td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

