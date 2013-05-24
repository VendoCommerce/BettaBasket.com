<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailItem.aspx.cs" Inherits="CSWeb.Admin.EmailItem"  EnableViewState="true" MasterPageFile="AdminSite.master"%>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="HTMLEditor" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add New Email</title>
    <script language="javascript" type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <br>
    <span class="header"><font color="blue">Create or Modify Emails</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />

    <table cellspacing="1" cellpadding="2" width="100%" border="0">
        <tr>
            <td colspan="2" class="tblhdr">
                <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Add/Edit Email</asp:Label>
            </td>
        </tr>
        <tr>
            <td width="15%" class="tblrowhdr" align="right">
                Name: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtName" runat="Server" Width="40%" MaxLength="100" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtName"
                    ID="valReqTitle" ValidationGroup="valError" ErrorMessage="* Name is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                From Address: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtfromAddress" runat="Server" MaxLength="100" Width="40%"/>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtfromAddress"
                    ID="RequiredFieldValidator1" ValidationGroup="valError" ErrorMessage="* From Address is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                To Address: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtToAddress" runat="Server" MaxLength="100" Width="40%"/>
         
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Subject: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtSubject" runat="Server" MaxLength="200" Width="40%"/>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtSubject"
                    ID="valReqCode" ValidationGroup="valError" ErrorMessage="* Subject is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Body: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <HTMLEditor:Editor ID="EmailBodyDesc" runat="server" 
							Height="300px" 
							Width="70%"
							AutoFocus="true"
					/>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="EmailBodyDesc"
                    ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Body is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Image AlternateText="" runat="server" Width="100px" ID="blank1" Height="1px"
                    ImageUrl="../../images/1pt.gif"></asp:Image>
            </td>
            <td>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                    OnCommand="btnAction_Command" />
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnAction_Command"
                    CausesValidation="true" ValidationGroup="valError" />
            </td>
        </tr>
    </table>

    <br />
</asp:Content>
