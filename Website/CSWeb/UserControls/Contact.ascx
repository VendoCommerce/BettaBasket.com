<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="CSWeb.UserControls.Contact" %>
<div id="testimonial_form" style="margin: 0;">
    <asp:Panel ID="pnlSubmitSuccessMsg" runat="server" Visible="false">
        <div style="color: #449015; font-weight: bold;">
            Thank you!</div>
    </asp:Panel>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
            </asp:Label>
        </span>
        <label for="txtFirstName">
            *First Name</label>
        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="14" CssClass="input_1"></asp:TextBox>
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
        </span>
        <label for="txtLastName">
            *Last Name</label>
        <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="input_1"></asp:TextBox>
    </div>
    <div class="clear" style="height: 10px;">
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
            <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label>
        </span>
        <label for="txtEmail">
            *Email Address</label>
        <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="input_1"></asp:TextBox>
    </div>
    <div class="input_wrap">
        <span class="error-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ControlToValidate="txtEmailConfirm" ControlToCompare="txtEmail"
                ID="CompareValidator" ErrorMessage="*Email Address does not match" EnableClientScript="true"
                Display="Dynamic" Text="Email does not match"></asp:CompareValidator>
        </span>
        <label for="txtEmailConfirm">
            *Confirm Email Address</label>
        <asp:TextBox ID="txtEmailConfirm" runat="server" MaxLength="100" CssClass="input_1"></asp:TextBox>
    </div>
    <div class="clear" style="height: 10px;">
    </div>
    <div class="input_wrap">
        <label for="phone">
            Phone Number</label>
        <asp:TextBox ID="txtPhone" runat="server" MaxLength="14" CssClass="input_1"></asp:TextBox>
    </div>
    <div class="clear" style="height: 10px;">
    </div>
    <span class="error-1">
        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" Display="Dynamic" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
        <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
    </span>
    <label for="txtMessage">
        *Message</label>
    <asp:TextBox ID="txtMessage" runat="server" MaxLength="2000" CssClass="textarea_2"
        Rows="5" TextMode="MultiLine"></asp:TextBox>
    <div class="clear">
    </div>
    <p style="padding-top: 8px; float: left; width: 160px;">
        *denotes required field</p>
    <p style="padding-top: 6px; float: left; width: 234px; text-align: right;">
        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/content/images/btn_submit_2.png"
            OnClick="imgBtn_OnClick" /></p>
    <div class="clear" style="height: 200px;">
    </div>
</div>
<!-- END testimonial_form, or in this case, a contact form -->
