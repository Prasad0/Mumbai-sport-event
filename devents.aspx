<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="devents.aspx.cs" Inherits="devents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container">
       <h1 class="col-lg-offset-2 col-lg-9 well" align="center">Create New Event</h1>
       

              <div class="col-lg-offset-2 col-lg-9 well">
         <div class="col-lg-offset-2 col-lg-6">
             <label>Select the category</label>
             <asp:DropDownList ID="ddl1" runat="server" CssClass="form-control" Width="80%" DataSourceID="SqlDataSource1" DataTextField="ctype" DataValueField="cid"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:regConnectionString2 %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select the category" ControlToValidate="ddl1" ForeColor="#FF3300"></asp:RequiredFieldValidator>
         </div>
        <div class="col-lg-offset-2 col-lg-6">
            <label>Event Name</label>
            <asp:TextBox ID="enames" runat="server" placeholder="Enter your event name" class="form-control"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must Enter the name of event" ControlToValidate="enames" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>   
                 </div>

        <div class="col-lg-offset-2 col-lg-6">
            <label>Organized By</label><br />
            <asp:TextBox ID="txtOrganizedBy" Enabled="false" runat="server" cssClass="form-control"></asp:TextBox><br />
        </div>
        
        <div class="col-lg-offset-2 col-lg-6">
            <label>Event Start Date</label><br />
            <asp:TextBox ID="estart" runat="server"  type="date" CssClass="form-control"></asp:TextBox><br />
            </div>

        <div class="col-lg-offset-2 col-lg-6">
            <label>Event End Date</label><br />
            <asp:TextBox ID="eend" runat="server"  type="date" CssClass="form-control"></asp:TextBox><br />
        </div>
                  <div class="col-lg-offset-2 col-lg-6">
                      <label>Event Venue</label>
                       <asp:TextBox ID="venu" runat="server" placeholder="name of venue" CssClass="form-control" TextMode="MultiLine"></asp:TextBox><br />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter venue" ControlToValidate="venu" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                  </div>
         
        <div class="col-lg-offset-2 col-lg-6">
            <label>Event Price</label>
            <asp:TextBox ID="txtprice" runat="server" placeholder="Enter ticket price" class="form-control"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid amount" Display="Dynamic" ControlToValidate="txtprice" ForeColor="Red" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator> 
                 </div>

                  <div class="col-lg-offset-2 col-lg-6">
                      <label>Event Description</label>
                       <asp:TextBox ID="Description" runat="server" placeholder="enter description" CssClass="form-control" TextMode="MultiLine" Rows="15" Columns="15"></asp:TextBox><br />

                  </div>
                  <div class="col-lg-offset-2 col-lg-6">
                      <label>Add Image</label>
                      <asp:FileUpload ID="eimage" cssClass="form-control" runat="server" />
                  </div>
       <div class="col-lg-offset-2 col-lg-6">
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-lg btn-info" OnClick="Button1_Click"/>
        </div>  
    </div>
    
         </div>
</asp:Content>

