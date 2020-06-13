<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="activeevent.aspx.cs" EnableEventValidation="false" Inherits="activeevent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <div class="col-lg-offset-2 col-lg-8 well">
            <div class="box">
                <div class="box-body" style="overflow-x: auto">


                    <asp:Repeater ID="Repeater1" runat="server"  >
                        <HeaderTemplate>
                            <table width="100%" class="display table table-striped table-bordered table-responsive" id="tblProduct" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="width: auto;">Event name</th>
                                        <th style="width: auto;">Start date</th>
                                        <th style="width: auto;">Description</th>
                                        <th style="width: auto;">end date</th>
                                     <th style="width: auto;">Image</th>
                                        <th style="width: 30px;"></th>
                                        <th style="width: 30px;"></th>

                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("ename") %></td>
                                <td>
                                    <%# Eval("estartdate") %></td>
                                <td>
                                    <%# Eval("description") %></td>
                                <td>
                                    <%# Eval("eenddate") %></td>
                                <td>
                                        <asp:Image id="image" CssClass="img-responsive" runat="server" Heigth="100" width="100" ImageUrl='<%#"~/Images/event/"+Eval("ephoto") %>' />
                                    </td>
                                <%--<td>
                                    <%# Eval("pqty") %></td>--%>
                                <td>
                                    <asp:LinkButton ID="lnkbView" runat="server" OnClick="lnkbView_Click" Text="view" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "eid") %>'></asp:LinkButton>
                                <td>
                                    <asp:ImageButton ImageUrl="~/Images/Logos/Delete.png" ID="imgDelete" runat="server" OnClick="imgDelete_Click1" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "eid") %>'></asp:ImageButton></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
   
       <script>
           $(document).ready(function () {
               $('#tblProduct').DataTable({
                   "lengthMenu": [[3, 50, -1], [25, 50, "All"]],
                   dom: 'Bfrtip',
                   buttons: [
                       'excel', 'pdf', 'print'
                   ]
               });
           });</script>
</asp:Content>

