<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updateprofile.aspx.cs" Inherits="updateprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="col-offset-2 col-md-6">
                                ID: <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                           </div>  
        <div class="col-sm-offset-2">
        <h3>
            <asp:Label ID="lblwelcome" runat="server" Visible="false"></asp:Label></h3> 
        <div class="col-offset-3 col-md-7">
           <label>First Name</label> 
            <asp:TextBox ID="tfname" runat="server" CssClass="form-control" placeholder="Update your first name"></asp:TextBox>
        </div>
        <div class="col-offset-3 col-md-7">
            <label>Last Name</label>
            <asp:TextBox ID="tlname" runat="server" CssClass="form-control" placeholder="Update your last name"></asp:TextBox>
        </div>
        <div class="col-offset-3 col-md-7">
            <label>Mobile number</label>
            <asp:TextBox ID="txtnum" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid phone number" ValidationExpression='["0-9"]{10}' ControlToValidate="txtnum" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
        <div class="col-offset-3 col-md-7">
            <label>DOB</label>
            <asp:TextBox ID="txtdob" runat="server" type="date" CssClass="form-control"></asp:TextBox>
        </div>
            <div class="col-offset-3 col-md-7">
                <label>Address</label>
                <asp:TextBox ID="txtaddr" runat="server" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
            </div>
            <div class="col-offset-3 col-md-7">
                <label>State</label>
                <asp:DropDownList ID="txtstate" runat="server" CssClass="form-control">
                    <asp:ListItem>select</asp:ListItem>
                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                    <asp:ListItem>Assam</asp:ListItem>
                    <asp:ListItem>Bihar</asp:ListItem>
                    <asp:ListItem>Chhattisgarh</asp:ListItem>
                    <asp:ListItem>Goa</asp:ListItem>
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Haryana</asp:ListItem>
                    <asp:ListItem>Himachal  Pradesh</asp:ListItem>
                    <asp:ListItem>Jammu &amp; Kashmir</asp:ListItem>
                    <asp:ListItem>Jharkhand</asp:ListItem>
                    <asp:ListItem>Karnataka</asp:ListItem>
                    <asp:ListItem>Kerala</asp:ListItem>
                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Manipur</asp:ListItem>
                    <asp:ListItem>Meghalaya</asp:ListItem>
                    <asp:ListItem>Mizoram</asp:ListItem>
                    <asp:ListItem>Nagaland</asp:ListItem>
                    <asp:ListItem>Odisha</asp:ListItem>
                    <asp:ListItem>Punjab</asp:ListItem>
                    <asp:ListItem>Rajasthan</asp:ListItem>
                    <asp:ListItem>Sikkim</asp:ListItem>
                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                    <asp:ListItem>Telangana</asp:ListItem>
                    <asp:ListItem>Tripura</asp:ListItem>
                    <asp:ListItem>Uttarakhand</asp:ListItem>
                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                    <asp:ListItem>West Bengal</asp:ListItem>
                </asp:DropDownList>
            </div>
        <div class="col-offset-3 col-md-7">
            <label>About your Past Game</label>
            <asp:TextBox ID="txtabout" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter your detail about your last game"></asp:TextBox><br />
            </div>
        <div class="col-offset-3 col-md-7">
            <asp:Button ID="btnsub" runat="server" Text="Update" class="btn btn-primary"  OnClick="btnsub_Click" />
        </div>
        </div>
        </div>
</asp:Content>

