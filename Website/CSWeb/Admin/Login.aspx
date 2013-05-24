<%@ Page Title="Log In" Language="C#" AutoEventWireup="true" EnableViewState="true"
    CodeBehind="Login.aspx.cs" Inherits="CSWeb.Account.Login" EnableSessionState="True" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
        <%=siteName %>
        | Admin Login</title>
    <link href="/Styles/admin.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
    <form runat="server" id="form1">
    <div class="admin_top_line">
        [<%=siteName %>] - (<%=siteUrl %>)</div>
    <div class="admin_top_border">
    </div>
    <div class="admin_site_header clearfix">
        <div class="admin_logo">
            <asp:Image ID="imgLogo" runat="server" /></div>
        <div class="admin_title_info">
            <h2>
                <%=siteName %> Admin Access</h2>
            <p>
                <%=siteTitle %></p>
        </div>
    </div>
    <div class="admin_login_form">                
        <div class="formline clearfix">
            <label>
                Username</label>
            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" ReadOnly="false" TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                CssClass="failureNotification" ErrorMessage="* Username is required." ToolTip="Username is required."
                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
        </div>
        <div class="formline clearfix">
            <label>
                Password</label>
            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"
                ReadOnly="false" TabIndex="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                CssClass="failureNotification" ErrorMessage="* Password is required." ToolTip="Password is required."
                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
        </div>
        <div class="formline clearfix">
            <input type="checkbox" /><label class="remember">Remember me next time.</label>
        </div>
        <div class="formline clearfix">
        <asp:Literal id="liErrorMessage" runat="server" />
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                OnCommand="btnAction_Command" TabIndex="3" />
        </div>
    </div>
    </form>
</body>
</html>
