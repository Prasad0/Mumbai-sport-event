<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="orgl.aspx.cs" Inherits="orgl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
    <h1 class="col-lg-offset-2 col-lg-8 well" align="center">Organization Registration Form</h1>
	<div class="col-lg-offset-2 col-lg-8 well">
	<div class="row">
		
		<div class="col-sm-12">
			<div class="row">
                 <div class="alert alert-dismissible alert-success" id="Failed" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Successfull <i class="glyphicon glyphicon-thumbs-up"></i>You are registered now</strong>
                </div>

					<div class="col-sm-offset-1 col-sm-7 form-group">
					<label>Name of Company</label>
                        <asp:TextBox ID="cname" runat="server" placeholder="Enter Company Name Here.." class="form-control"></asp:TextBox>
					
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your Company name" Display="Dynamic" ForeColor="Red" ControlToValidate="cname"></asp:RequiredFieldValidator>
                </div>

		     				
		   <div class="col-sm-offset-1 col-sm-7 form-group">
					<label>Address of Company</label>
                     <asp:TextBox ID="addc" runat="server" TextMode="MultiLine" placeholder="Enter Company Address Here.." rows="3" class="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your Address" Display="Dynamic" ForeColor="Red" ControlToValidate="addc"></asp:RequiredFieldValidator>
		   </div>	
								
	      <div class="col-sm-offset-1 col-sm-7 form-group">
					<label>Contact Number</label>
					<asp:TextBox ID="lnum" runat="server" placeholder="Enter Phone number Here.." class="form-control"></asp:TextBox>

              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter your phone number" ControlToValidate="lnum" Display="Dynamic" ForeColor="Red" ValidationExpression='\d{10}'></asp:RegularExpressionValidator>
		  </div>		
		  <div class="col-sm-offset-1 col-sm-7 form-group">
					<label>Official Email ID</label>
					<asp:TextBox ID="oeid" runat="server" placeholder="Enter Email Address Here.." class="form-control"></asp:TextBox>
			</div>
            <div class="col-sm-offset-1 col-sm-7 form-group">
					<label>Password</label>
                     <asp:TextBox ID="pass" runat="server" placeholder="Enter Email Here.." class="form-control" TextMode="Password"></asp:TextBox>
              </div>
            <div class="col-sm-offset-1 col-sm-7 form-group">
                   <asp:Button ID="btn1" runat="server" Text="Submit" class="btn btn-lg btn-info" OnClick="btn1_Click" />
					</div>
               </div>
            </div>
         
			
				</div>
	</div>
	</div>
</asp:Content>

