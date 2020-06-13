<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="team.aspx.cs" Inherits="team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid"> 
    <h1 class="col-lg-offset-1 col-lg-9 well" align="center">Create Your Team</h1>

	 <div class="col-lg-offset-1 col-lg-9 well">
        <div class="col-md-3">
        <div class="text-center">
          <img src="/../placehold.it/100" class="avatar img-circle" alt="avatar"/>
          <h6>Upload your photo...</h6>
             <asp:FileUpload ID="fimg" class="form-control" runat="server" />
         </div>
            </div>
         
       <div class="col-md-9 personal-info">
        <div class="row">
				<div class="col-sm-12">
			<div class="row">
					<div class="col-sm-offset-2 col-sm-9 form-group">
					<label>Team Name</label>
                        <asp:TextBox ID="tname" runat="server" placeholder="Enter First Team Name Here.." class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your Team name" Display="Dynamic" ForeColor="Red" ControlToValidate="tname"></asp:RequiredFieldValidator>
                </div>

		   <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 1</label>
                      <asp:TextBox ID="m1" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m1"></asp:RequiredFieldValidator>
				</div>	   		
                
                  <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 2</label>
                      <asp:TextBox ID="m2" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m2"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 3</label>
                      <asp:TextBox ID="m3" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m3"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 4</label>
                      <asp:TextBox ID="m4" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m4"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 5</label>
                      <asp:TextBox ID="m5" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m5"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 6</label>
                      <asp:TextBox ID="m6" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m6"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 7</label>
                      <asp:TextBox ID="m7" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m7"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 8</label>
                      <asp:TextBox ID="m8" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m8"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 9</label>
                      <asp:TextBox ID="m9" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m9"></asp:RequiredFieldValidator>
				</div>	   

                 <div class="col-sm-offset-2 col-sm-9 form-group">
			     	<label>Member 10</label>
                      <asp:TextBox ID="m10" runat="server" placeholder="Enter memeber Name Here.." class="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please enter your member name"  Display="Dynamic" ForeColor="Red" ControlToValidate="m10"></asp:RequiredFieldValidator>
				</div>	  
                    
              </div>
            <div class="col-sm-offset-1 col-sm-4 form-group">
                   <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-lg btn-info"/>
					</div>
                </div>
            </div>
            </div>
    </div>
    </div>
</asp:Content>

