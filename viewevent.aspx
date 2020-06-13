<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewevent.aspx.cs" enableEventValidation="false" Inherits="viewevent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="fevent" runat="server" Font-Bold="True">
        <ItemTemplate>
                        <div class="col-item">
                             <div style="margin:20px;">
                            <div class="photo">
                               <img src='<%#"Images/event/"+ Eval("ephoto")%>' class="img-responsive" style=" height: 350px; width: 1500px;" />
                                </div>
         <div class="col-lg-offset-2 col-lg-9 well">                        
            <div class="col-sm-offset-2 col-sm-6">
            Event Name:
            <asp:Label ID="enameLabel" runat="server" Text='<%# Eval("ename") %>' />
            <br /><br />
             </div>
            <div class="col-sm-offset-2 col-sm-6">
                Event Startdate:
            <asp:Label ID="estartdateLabel" runat="server" Text='<%# Eval("estartdate") %>' />
            <br /><br /></div>
                                 <div class="col-sm-offset-2 col-sm-6">
            Event Enddate:
            <asp:Label ID="eenddateLabel" runat="server" Text='<%# Eval("eenddate") %>' />
            <br /><br /></div>
                                 <div class="col-sm-offset-2 col-sm-6">
            Location:
            <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            <br /><br /></div>
                                 <div class="col-sm-offset-2 col-sm-6">
            Description:
            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            <br />
            <br /></div>
<br />
                                 <div class="col-sm-offset-2 col-sm-6">
            Price of event: ₹
            <asp:Label ID="price" runat="server" Text='<%# Eval("price") %>' />
            <br />
            <br /></div>
                                 </div>
                            </div>
     
             <div class="col-lg-offset-5 col-lg-7">
                 <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="btn btn-primary" OnClick="btnBook_Click"/>
        </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:regConnectionString %>" SelectCommand="SELECT [ename], [estartdate], [eenddate], [location], [description], [ephoto] ,[price]FROM [event]"></asp:SqlDataSource>
</asp:Content>

