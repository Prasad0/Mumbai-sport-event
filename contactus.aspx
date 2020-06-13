<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="margin-top: 150px;margin-left:-10px;">
        <div class="container">
            <!-- Success message -->
            <div class="form-group">

                <div class="alert alert-dismissible alert-success" id="Failed" runat="server" visible="false">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Success <i class="glyphicon glyphicon-thumbs-up"></i>Thanks for contacting us, we will get back to you shortly.</strong>
                </div>
            </div>
            <asp:ValidationSummary ID="vsCndidate" runat="server" HeaderText="There was an error Processing your request." ToolTip="There was an error Processing your request." ValidationGroup="vgCandidate" ViewStateMode="Disabled" ForeColor="Red" CssClass="panel-primary" Font-Bold="True" Font-Size="Small" />
            <div class="well form-horizontal" id="contact_form">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Contact Us Today!</legend>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">First Name</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtFname" placeholder="First Name" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFname" ErrorMessage="First Name is mandatory" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Name is mandatory" ValidationGroup="vgCandidate">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Last Name</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtLname" placeholder="Last Name" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLname" ErrorMessage="Last Name is mandatory" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ToolTip="Enter Last Name is mandatory" ValidationGroup="vgCandidate">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">E-Mail</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" placeholder="Email Address" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email Address is mandatory" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Email is mandatory" ValidationGroup="vgCandidate">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reCEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" EnableTheming="True" SetFocusOnError="True" ToolTip="Enter Email is mandatory" ValidationGroup="vgCandidate">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>


                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Mobile No </label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                <asp:TextBox ID="txtPhone" placeholder="Mobile Number" CssClass="form-control" onkeydown="return allowNumOnly(event)" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Enter the Valid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(?:(?:\+|0{0,2})91(\s*[\ -]\s*)?|[0]?)?[789]\d{9}|(\d[ -]?){10}\d$" ValidationGroup="vgCandidate">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Mobile No is mandatory" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ToolTip="Enter Mobile No is mandatory" ValidationGroup="vgCandidate">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->







                    <!-- Text area -->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Your Query</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <asp:TextBox ID="txtQuery" placeholder="Enter Your Query" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>



                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">

                            <asp:Button ID="btnCSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnCSubmit_Click" ValidationGroup="vgCandidate" ViewStateMode="Disabled" />
                            <asp:Button ID="btnCCancel" CssClass="btn btn-default" OnClick="btnCCancel_Click" runat="server" Text="Cancel" />
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>
    </div>
    <!-- /.container -->
</asp:Content>

