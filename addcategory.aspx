<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="col-md-offset-1 col-md-10 well" align="center">Add Category Here</h1>
 <div class="container" style="margin-top: 100px;">
      
        <div class="row" id="form" runat="server">
           

            <div class="col-md-4 well">
                <div role="form" class="box" style="width: 100%">
                    <div class="box-body">
                        <br />
                        <div class="form - group">
                            <label for="txtName">Category Name</label><br />


                            <asp:TextBox ID="txtCategoryName" CssClass="form-control" Width="80% " runat="server" placeholder="Enter category Name"></asp:TextBox>
                        </div>


                        <br />
                        <div class="form - group">
                            <label for="txtDescription">Description</label><br />
                            <asp:TextBox ID="TextBox1" runat="server" Columns="15" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Description is mandatory" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Price is mandatory" ValidationGroup="vgBusinessEntities">*</asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="box-footer" style="width: 100%">
                            <asp:Button runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" ID="btnSubmit" />
                            <asp:Button ID="btnReset" CssClass="btn btn-default" runat="server" Text="Cancel" OnClick="btnReset_Click" />
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-7 well">
                <div class="box">
                    <div class="box-body" style="">


                        <asp:Repeater ID="rptCategory" runat="server">
                            <HeaderTemplate>
                                <table width="100%" class="display table table-striped table-bordered table-responsive" id="tblCategory" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: auto;">Category Name</th>
                                            <th style="width: auto;">Category Description</th>

                                            <th style="width: 30px;"></th>
                                            <th style="width: 30px;"></th>

                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("ctype") %></td>
                                    <td>
                                        <%# Eval("ctag") %></td>
                                    <td>
                                        <asp:ImageButton ImageUrl="~/Images/Logos/Edit.png" ID="imgEdit" runat="server" CommandName="edit" OnClick="imgEdit_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cid") %>'></asp:ImageButton></td>
                                    <td>
                                        <asp:ImageButton ImageUrl="~/Images/Logos/Delete.png" ID="imgDelete" runat="server" CommandName="edit" OnClick="imgDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cid") %>'></asp:ImageButton></td>
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


    </div>
</asp:Content>

