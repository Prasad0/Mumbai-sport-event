<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="upd.aspx.cs" Inherits="upd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="col-offset-2 col-md-6">
                                ID: <asp:Label ID="lbId" runat="server" Text=""></asp:Label>
                           </div>  
        <div class="col-sm-offset-2">
        <h3>
            <asp:Label ID="lblwelcome" runat="server" Visible="false"></asp:Label></h3> 
        <div class="col-offset-3 col-md-7">
           <label>Your company name</label> 
            <asp:TextBox ID="cname" runat="server" CssClass="form-control" placeholder="Update your Company name"></asp:TextBox>
        </div>

            <div class="col-offset-3 col-md-7">
                <label>Address</label>
                <asp:TextBox ID="txtaddr" runat="server" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
            </div>
        
        <div class="col-offset-3 col-md-7">
            <label>Mobile number</label>
            <asp:TextBox ID="txtnum" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid phone number" ValidationExpression='["0-9"]{10}' ControlToValidate="txtnum" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
        
            
        <div class="col-offset-3 col-md-7">
            <label>Enter Email</label>
            <asp:TextBox ID="txtem" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Enter your email Id"></asp:TextBox><br />
            </div>
        <div class="col-offset-3 col-md-7">
            <asp:Button ID="btnsub" runat="server" Text="Update" OnClick="btnsub_Click" class="btn btn-primary"/>
        </div>
        </div>
        </div>
</asp:Content>

