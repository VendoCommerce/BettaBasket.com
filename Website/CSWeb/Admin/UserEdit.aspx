<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CSWeb.Admin.UserEdit"  MasterPageFile="AdminSite.master" EnableViewState="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>UserEdit Page</title>
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="valError" DisplayMode="List" />
  <table cellspacing="1" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2" class="tblhdr">
                        <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Add/Edit User</asp:Label>
                    </td>
                </tr
                 <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        First Name: <font color="red">*</font>
                    </td>
                    <td class="rowbody">
                        <asp:TextBox ID="txtFirstName" runat="Server" Width="20%" MaxLength="200" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtFirstName"
                            ID="valReqFirstName" ValidationGroup="valError" ErrorMessage=" First Name is required field." >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        Last Name: <font color="red">*</font>
                    </td>
                    <td class="rowbody">
                        <asp:TextBox ID="txtLastName" runat="Server" Width="20%" MaxLength="200" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtLastName"
                            ID="valReqLastName" ValidationGroup="valError" ErrorMessage=" First Name is required field." >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        UserName: <font color="red">*</font>
                    </td>
                    <td class="rowbody">
                        <asp:TextBox ID="txtUserName" runat="Server" Width="20%" MaxLength="50" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtUserName"
                            ID="valReqTitle" ValidationGroup="valError" ErrorMessage="UserName is required field." >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        Email: <font color="red">*</font>
                    </td>
                    <td class="rowbody">
                        <asp:TextBox ID="txtEmail" runat="Server" Width="20%" MaxLength="100" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail"
                            ID="RequiredFieldValidator1" ValidationGroup="valError" ErrorMessage="Email is required field." >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        Password: <font color="red">*</font>
                    </td>
                    <td class="rowbody">
                        <asp:TextBox ID="txtPassword" runat="Server" Width="20%" MaxLength="20" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtPassword"
                            ID="RequiredFieldValidator2" ValidationGroup="valError" ErrorMessage="Password is required field." >*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        Admin Type: 
                    </td>
                    <td class="rowbody">
                        <asp:DropDownList ID="ddlAdminType" runat="Server" AutoPostBack="false" />
                      </td>
                </tr>
                <tr>
                    <td width="15%" class="tblrowhdr" align="right">
                        Account Disabled: 
                    </td>
                    <td class="rowbody">
                        <asp:CheckBox ID="cbAccount" runat="Server" AutoPostBack="false" />
                      </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image AlternateText="" runat="server" Width="100px" ID="blank1" Height="1px"
                            ImageUrl="/Content/images/admin/1pt.gif"></asp:Image>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" OnCommand="btnAction_Command"/>
                        &nbsp;
                        <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" 
                            OnCommand="btnAction_Command" CausesValidation="true" ValidationGroup="valError" />
                    </td>
                </tr>
                </table>
    </asp:Content>