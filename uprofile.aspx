<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="uprofile.aspx.cs" Inherits="uprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
    
       <div class="col-md-3">
                    <div class="row">
                        <asp:imagebutton ID="ImageButton1" class="avatar img-circle" style="height:250px;width:250px;" runat="server" AlternateText="profile picture" CausesValidation="False" OnClick="ImageButton1_Click" ToolTip="Click to update picture" ImageUrl="~/Images/userImage/5.PNG"></asp:imagebutton>
                    </div>
                    <div class="row">
                       <p style="text-align: center; font-size:large;padding-top:10px;"><asp:label runat="server" text="Label" ID="lblfname"></asp:label></p>
                         <p style="text-align: center; font-size:large;padding-top:10px;"><asp:label runat="server" text="Label" ID="lbllname"></asp:label></p>
                    </div>
           </div>
                <div class="col-md-9">
                    <div class="row">
                           <div class="col-md-10">
                                ID: <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                           </div>   
                     </div>
                    <div id="profileView" class="row well" runat="server">
                        <p>Age : <asp:Label ID="lblage" runat="server" Text=""></asp:Label></p><br />
                        <p>Gender : <asp:Label ID="lblgender" runat="server" Text=""></asp:Label></p><br />
                        <p>Email:<asp:Label ID="lblemail" runat="server" Text=""></asp:Label></p><br />
                        <p>Address:<asp:Label ID="lbladd" runat="server" Text=""></asp:Label></p><br />
                        <p>Mobile No:<asp:Label ID="lblnum" runat="server" Text=""></asp:Label></p><br />
                        <p>State : <asp:Label ID="lblstate" runat="server" Text=""></asp:Label></p><br />
                        <p>About your Past games:<asp:Label ID="lbldesc" runat="server" Text=""></asp:Label></p><br />  
                       </div>

                     <div id="editImage" class="row" runat="server" visible="false">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                    <div class="col-md-12" style="text-align: center">
                                <div class="row">
                                    <div class="col-md-4"><asp:FileUpload ID="fuphoto" runat="server" /></div>
                                    <div class="col-md-4"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select an Image" ControlToValidate="fuphoto" Display="Dynamic" ForeColor="Red" ValidationGroup="imgsave"></asp:RequiredFieldValidator></div>
                                    <div class="col-md-4" style="padding-top:10px;">
                                     <asp:Button ID="btnUpdateImage" class="btn btn-primary btn-sm" runat="server" Text="Save Image" CausesValidation="True" ValidationGroup="imgsave" OnClick="btnUpdateImage_Click"/>
                                        &nbsp;
                                <asp:Button ID="btnCancelImage" class="btn btn-warning btn-sm" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancelImage_Click"/>
                                 </div>                             
                                    </div>
                               </div>
                                </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-1">
                    <asp:Button ID="btnUpdatePwd" runat="server" Text="Edit Profile" class="btn btn-primary" OnClick="btnedit_Click" /><br />
                        </div>
                </div>
    </div>	
</asp:Content>

