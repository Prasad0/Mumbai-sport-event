<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forget.aspx.cs" Inherits="forget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" style="padding-top:30px;"> 
        <div class="col-lg-offset-2 col-lg-8 well"> 
       <h3 class="col-lg-offset-2 col-lg-8 well" align="center">Forgot Password</h3>
            </div>
        <div class="col-lg-offset-2 col-lg-8 well"> 
        <div class="col-sm-offset-1 col-sm-7 form-group" style="padding-top:30px;">
            <label>Enter your email</label>
            <asp:TextBox ID="txtbx1" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" />
        </div>
        <div class="col-sm-offset-1 col-sm-4">
            <asp:Button ID="butn" runat="server" class="btn btn-lg btn-info" Text="Submit" />
        </div>
            </div>
    </div>  
</asp:Content>

