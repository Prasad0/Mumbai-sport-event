<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container well">
        <div class="alert alert-dismissible alert-success" id="Failed" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Successfull <i class="glyphicon glyphicon-thumbs-up"></i>You Added new</strong>
                </div>
        <div class="col-lg-offset-2 col-lg-8 ">
            <label>Subject about news</label>
            <asp:TextBox ID="Txt1" runat="server" CssClass="form-control"></asp:TextBox><br />
        </div>
        <div class="col-lg-offset-2 col-lg-8">
            <label>Content of news</label>
            <asp:TextBox ID="TextBox1" runat="server" Columns="50" Rows="20" TextMode="MultiLine" CssClass="form-control"></asp:TextBox><br />
        </div>
        <div class="col-lg-offset-2 col-lg-8">
            <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-primary" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>

