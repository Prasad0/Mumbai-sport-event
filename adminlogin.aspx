<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            <h3 class="col-lg-offset-2 col-lg-8 well" align="center">Admin Login</h3>
	   <div class="col-lg-offset-2 col-lg-8 well">
	       <div class="row">

                 <div class="col-sm-12">
						<div class="row">
							<div class="col-sm-offset-1 col-sm-7 form-group">
                                Username
                        <asp:TextBox placeholder="Enter Email" CssClass="form-control" ID="txtUsername" runat="server"></asp:TextBox>
                           <br />
                    <div class="form-group">
                        Password
                        <asp:TextBox placeholder="Enter Password" CssClass="form-control" ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                                
                    <%--<div class="form-group" style="text-align:right">

                        <asp:LinkButton ID="lnkForgotPass" CssClass="text-danger"  href="ForgotPassword.aspx" runat="server">Forgot Password?</asp:LinkButton>

                    </div>--%>
                    <br />
                    <div class="form-group" style="margin-top: -10px;">
                        <asp:Button ID="btnLogin" CssClass="btn btn-primary" OnClick="btnLogin_Click" runat="server" Text="Login" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-default" OnClick="btnCancel_Click" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
                     </div>
               </div>
            </div>
        </div>
   
</asp:Content>

