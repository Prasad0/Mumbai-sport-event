<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="orgdetails.aspx.cs" Inherits="orgdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="col-lg-offset-2 col-lg-8 well" style="font-family: 'Poor Richard'; font-size: x-large; font-weight: bold; font-style: normal; color: #000000;" align="center">Organization details</h1>
    <div class="col-lg-offset-2 col-lg-8 well">
    <asp:Repeater ID="rptorg" runat="server">
         <HeaderTemplate>
                    <table width="100%" class="display table table-striped table-bordered table-responsive" id="tblCustomer" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: auto;">Organization Name</th>
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
                            <%# Eval("comp") %></td>
                        <td>
                            <%# Eval("addc") %></td>
                        <td>
                            <%# Eval("landline") %></td>
                        <td>
                            <%# Eval("email") %></td> 
                   
                        <td>
                            <asp:ImageButton ImageUrl="~/Images/Logos/Delete.png" ID="imgDelete" runat="server" CommandName="edit" OnClick="imgDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "org_id") %>'></asp:ImageButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
    </asp:Repeater>
        </div>
            <script>
                $(document).ready(function () {
                    $('#tblCustomer').DataTable({
                        "lengthMenu": [[5, 50, -1], [25, 50, "All"]],
                        dom: 'Bfrtip',
                        buttons: [
                            'excel', 'pdf', 'print'
                        ]
                    });
                });</script>
               
            
    </asp:Content>

