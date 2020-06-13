<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="org.aspx.cs" Inherits="org" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
    <h3 class="col-lg-offset-2 col-lg-8 well" align="center">Login HERE AS ORGANIZATION</h3>
	<div class="col-lg-offset-2 col-lg-8 well">
	<div class="row">
			
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-offset-1 col-sm-7 form-group">
								<label>Email ID</label>
       <asp:TextBox ID="ename" runat="server" placeholder="Enter Organization Email Here.." class="form-control"></asp:TextBox>
							</div>
                 <div class="col-sm-offset-1 col-sm-7 form-group">
						<label>Password</label>
						 <asp:TextBox ID="pass" runat="server" placeholder="Enter Orgainzation Password Here.." class="form-control" TextMode="Password"></asp:TextBox>
				</div>
              <div class="col-sm-offset-1 col-sm-7">
                  <li>DON'T HAVE AN ACCOUNT?<a href="orgl.aspx">REGISTER HERE..</a></li>
                  <li><a href="forget.aspx">FORGET PASSWORD ?</a></li>
                            </div>
                 
                            </div>
                        <div class="col-sm-offset-1 col-sm-7 form-group">
                     <asp:Button ID="Btn" runat="server" Text="Login" class="btn btn-lg btn-info" OnClick="Btn_Click1" />
                            </div>
                        <div>
                        <asp:Label ID="Label1" runat="server" Text="login fail" Visible="False"></asp:Label>
					   </div>
                        </div>
            
        </div>
        </div>
           </div>
   
</asp:Content>

