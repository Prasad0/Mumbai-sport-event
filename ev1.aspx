<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ev1.aspx.cs" Inherits="ev1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <div class="col-xs-3" style="margin:20px; border: 1px solid grey; border-radius: 5px; box-shadow: 3px 3px 5px #d3d3d3; height: 300px; width:320px">
               <div style="margin:20px;">
                  <div class="row">
                     <asp:ImageButton ID="ImageButton1" runat="server" Height="180px" Width="270px"/>
                     <br />
                  </div>
                   <div class="row">
            <asp:Label ID="Label1" runat="server" Text='<%#Eval("estartdate") %>'></asp:Label>
            -<asp:Label ID="Label2" runat="server" Text='<%#Eval("eenddate") %>'></asp:Label>
                       </div>
              </div>
                </div>
        </ItemTemplate>
    </asp:DataList>--%>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-xs-4" style="margin:30px; border: 1px solid grey; border-radius: 5px; box-shadow: 3px 3px 5px #d3d3d3; height: 300px; width:320px">
                        <div class="col-item">
                             <div style="margin:20px;">
                            <div class="photo">
                               <img src='<%#"Images/event/"+ Eval("ephoto")%>' class="img-responsive" style=" height: 158px; width: 270px;" />
                                </div>
                            <div class="info">
                                <div class="row">
                                    <div class="price col-md-12">
                                        <h5 class="h5"><%#Eval("ename")%></h5>
                                        <h5 class="price-text-color">Date: <%#Eval("estartdate")%></h5>
                                    </div>
                                    </div>
                            </div>
                                 <div class="separator clear-left">
                                    
                                    <p class="btn-details">
                                        <i class="fa fa-list"></i>


                                        <asp:LinkButton ID="lnkViewPet"  runat="server" CommandName="select" OnClick="lnkViewPet_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "eid") %>'>More details</asp:LinkButton>

                                    </p>
                                </div>
                                 </div>
                </div>
                </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>



