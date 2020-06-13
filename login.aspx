<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <h3 class="col-lg-offset-2 col-lg-8 well" align="center">Login HERE AS USER</h3>
	<div class="col-lg-offset-2 col-lg-8 well">
	<div class="row">
			
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-offset-1 col-sm-7 form-group">
								<label>Email ID</label>
       <asp:TextBox ID="ename" runat="server" placeholder="Enter Users Email Here.." class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your email address" ControlToValidate="ename" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
                 <div class="col-sm-offset-1 col-sm-7 form-group">
						<label>Password</label>
						 <asp:TextBox ID="pass" runat="server" placeholder="Enter Users Password Here.." class="form-control" TextMode="Password"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your password" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
                     	</div>
                            <div class="col-sm-offset-1 col-sm-7">
                                <li>DON'T HAVE AN ACCOUNT?<a href="reg.aspx">REGISTER HERE..</a></li> 
                                <li><a href="forget.aspx">FORGET PASSWORD ?</a></li>
                                     </div>
                   
                            </div>
                        <div class="col-sm-offset-1 col-sm-7 form-group">
                     <asp:Button ID="Btn" runat="server" Text="Login" class="btn btn-lg btn-info" OnClick="Btn_Click" />
                            
                            </div>
                        <asp:Label ID="Label1" runat="server" Text="Invalid password" Visible="False"></asp:Label>
					   </div>
     <div class="row">
                                    <div>
                                       <p style="text-align:center;font-size:medium">Or Login using</p>
                                    </div>
                                </div>
         <div class="form-group row">
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnGoogle" runat="server" class="form-control btn btn-success" Text="Google Login" CausesValidation="False" OnClick="btnGoogle_Click"  />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Button ID="btnFacebook" runat="server" class="form-control btn btn-primary" Text="Facebook Login" CausesValidation="False"/>
                                    </div>
                                </div>
                   </div>
                 </div>
                </div>
                 
</asp:Content>

