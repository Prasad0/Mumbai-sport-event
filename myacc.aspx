<%@ Page Title="" Language="C#" MasterPageFile="~/orgmaster.master" AutoEventWireup="true" CodeFile="myacc.aspx.cs" Inherits="myacc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

        <div class="col-md-3">
                    <div class="row">
                        <asp:imagebutton ID="ImageBtn" class="avatar img-circle" style="height:250px;width:250px;" runat="server" AlternateText="profile picture" CausesValidation="False"  ToolTip="Click to update picture" ImageUrl="~/Images/userImage/5.PNG" OnClick="ImageButton1_Click"></asp:imagebutton>
                    </div>
            <br />
            <br />
            <br />
            </div>
                   <div class="col-md-9">
                    <div class="row">
                           <div class="col-md-10">
                                ID: <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                           </div>   
                     </div>
                    <div id="profileViews" class="row well" runat="server">
                        <p>Company Name:<asp:Label ID="lbname" runat="server" Text=""></asp:Label></p><br />
                        <p>Address:<asp:Label ID="lbadd" runat="server" Text=""></asp:Label></p><br />
                        <p>Mobile No:<asp:Label ID="lbnum" runat="server" Text=""></asp:Label></p><br />
                        <p>Email: <asp:Label ID="lbemail" runat="server" Text=""></asp:Label></p><br />
                        <p>About your Past games:<asp:Label ID="lbldesc" runat="server" Text=""></asp:Label></p><br />  
                       </div>
                       </div>

        <div id="editlogo" class="row" runat="server" visible="false">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                    <div class="col-md-12" style="text-align: center">
                                <div class="row">
                                    <div class="col-md-4"><asp:FileUpload ID="flogo" runat="server" /></div>
                                    <div class="col-md-4"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select an Image" ControlToValidate="flogo" Display="Dynamic" ForeColor="Red" ValidationGroup="imgsave"></asp:RequiredFieldValidator></div>
                                    <div class="col-md-4" style="padding-top:10px;">
                                     <asp:Button ID="btUpdateImage" class="btn btn-primary btn-sm" runat="server" Text="Save Image" CausesValidation="True" ValidationGroup="imgsave" OnClick="btUpdateImage_Click"/>
                                        &nbsp;
                                <asp:Button ID="btCancelImage" class="btn btn-warning btn-sm" runat="server" Text="Cancel" CausesValidation="False" OnClick="btCancelImage_Click" />
                                 </div>                             
                                    </div>
                               </div>
                                </div>
                        </div>
                    </div>
        <br />

        <div class="col-lg-1">
       &nbsp;<asp:Button ID="btedit" runat="server" Text="Edit Profile" OnClick="btedit_Click" class="btn btn-primary"/><br />
                        </div>
    </div>
</asp:Content>

