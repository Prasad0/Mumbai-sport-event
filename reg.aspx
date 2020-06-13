<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reg.aspx.cs" Inherits="reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container-fluid"> 
    <h1 class="col-lg-offset-1 col-lg-9 well" align="center">Registration Form</h1>
   
	 <div class="col-lg-offset-1 col-lg-9 well">
        <div class="col-md-3">
        <div class="text-center">
          <img src="/../placehold.it/100" class="avatar img-circle" alt="avatar"/>
          <h6>Upload your photo...</h6>
             <asp:FileUpload ID="fuImage" class="form-control" runat="server" />
         </div>
            </div>

         <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable"  id="div" runat="server" visible="true">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-exclamation-triangle"></i>
          Please<strong>.fill</strong>. the full detail
        </div>
             <div class="alert alert-dismissible alert-success" id="Failed" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Successfull <i class="glyphicon glyphicon-thumbs-up"></i>You are registered now</strong>
                </div>
        <h3>Personal info</h3>

	<div class="row">
				<div class="col-sm-12">
			<div class="row">
					<div class="col-sm-offset-1 col-sm-9 form-group">
					<label>First Name</label>
                        <asp:TextBox ID="fname" runat="server" placeholder="Enter First Name Here.." class="form-control" MaxLength="50"></asp:TextBox>
					
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your First name" Display="Dynamic" ForeColor="Red" ControlToValidate="fname"></asp:RequiredFieldValidator>
                </div>

		   <div class="col-sm-offset-1 col-sm-9 form-group">
			     	<label>Last Name</label>
                      <asp:TextBox ID="lname" runat="server" placeholder="Enter last Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your Last name"  Display="Dynamic" ForeColor="Red" ControlToValidate="lname"></asp:RequiredFieldValidator>
				</div>	   		
                
                 <div class="col-sm-offset-1 col-sm-9 form-group">
                    Gender&nbsp
                      <asp:RadioButton ID="rbMale" Text="Male" runat="server" GroupName="Gender" />&nbsp
                      <asp:RadioButton ID="rbFemale" Text="Female" runat="server" GroupName="Gender" />
                 </div>
                		
		   <div class="col-sm-offset-1 col-sm-9 form-group">
					<label>Address</label>
                     <asp:TextBox ID="add" runat="server" TextMode="MultiLine" placeholder="Enter Address Here.." rows="3" class="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your Address" Display="Dynamic" ForeColor="Red" ControlToValidate="add"></asp:RequiredFieldValidator>
		   </div>	
                            					
		  <div class="col-sm-offset-1 col-sm-9 form-group">
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                              <asp:TextBox ID="eadd" class="form-control" placeholder="Enter email" name="REmail" runat="server" AutoPostBack="True" OnTextChanged="eadd_TextChanged"></asp:TextBox>
                          </div>
                          <div class="col-md-4">
                              <asp:RequiredFieldValidator ID="RFVREmail" runat="server" ErrorMessage="Enter email address" ControlToValidate="eadd" Display="Dynamic" ValidationGroup="register" ForeColor="Red"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="REVREmail" runat="server" ErrorMessage="Enter valid email address" ControlToValidate="eadd" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register" ForeColor="Red"></asp:RegularExpressionValidator>
                              <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                         
                  </ContentTemplate>
              </asp:UpdatePanel>
              </div>
              <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                      <label>Email Address</label>
					<asp:TextBox ID="eadd" runat="server" OnTextChanged="eadd_TextChanged" placeholder="Enter Email Address Here.." class="form-control" AutoPostBack="true"></asp:TextBox>
                  
					
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="eadd" Display="Dynamic" ErrorMessage="Please enter your email" ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid email" ControlToValidate="eadd" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>
        <asp:Label ID="Label2" runat="server" Text="" ForeColor="#00CC66" Visible="False"></asp:Label>
                </ContentTemplate>
              </asp:UpdatePanel>--%>
		  <div class="col-sm-offset-1 col-sm-9 form-group">
					<label>Password</label>
                     <asp:TextBox ID="password" runat="server" placeholder="Enter password Here.." class="form-control" TextMode="Password"></asp:TextBox>
                    
              </div>
            <div class="col-sm-offset-1 col-sm-4 form-group">
                   <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-lg btn-info" OnClick="Button1_Click1" />
					</div>
                </div>
            </div>
            <asp:Label ID="Label1" runat="server" Text="Your registration was successful" ForeColor="#00CC66" Visible="False"></asp:Label>
				
				</div>
        </div>
	</div>
	</div>
</asp:Content>

