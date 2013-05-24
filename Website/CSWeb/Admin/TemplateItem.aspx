<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateItem.aspx.cs" Inherits="CSWeb.Admin.TemplateItem"
    EnableViewState="true" MasterPageFile="AdminSite.master" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="HTMLEditor" %>

<%@ Register TagPrefix="usercontrols" TagName="DateControl" Src="../usercontrols/DateControl.ascx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add/Edit Templates</title>
    <script language="javascript" type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <span class="header"><font color="blue">Definte Templates</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />

    <table cellpadding="3" cellspacing="2" width="100%">
     <tr>
            <td colspan="2" class="tblhdr">
                <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Add/Edit Template</asp:Label>
            </td>
        </tr>
      <tr>
            <td align="right" class="tblrowhdr" valign="top">
               <asp:Label ID="lblTitle" runat="Server" AssociatedControlID="txtName" Text="Name" />: <font color="red">*</font>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="200" TabIndex="2" width="50%"/>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" Text="*" ErrorMessage="* Name is required field."
                    ControlToValidate="txtName" ValidationGroup="valError"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Sku(s)
            </td>
            <td>
                <asp:ListBox ID="lstSku" runat="server" DataTextField="Name" DataValueField="SkuId"
                    SelectionMode="multiple"  Width="500" Height="100"  TabIndex="1" />
                <asp:RequiredFieldValidator ID="rfvSku" runat="server" Text="*" ErrorMessage="* Sku is required field."
                    ControlToValidate="lstSku" InitialValue="" ValidationGroup="valError" />
            </td>
        </tr>      
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Description: <font color="red">*</font>
            </td>
            <td class="rowbody">

				<HTMLEditor:Editor ID="ftbShortDesc" runat="server" 
							Height="300px" 
							Width="70%"
							AutoFocus="true"
					/>
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="ftbShortDesc"
                    ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Description is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Script: 
            </td>
            <td class="rowbody">

                <asp:TextBox TextMode="MultiLine" ID="txtScript" runat="server" Width="500" Height="100" />
				
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Tags: <font color="red">*</font>
            </td>
            <td>
                <asp:TextBox ID="txtTag" runat="server" TextMode="MultiLine" Width="500" Height="100" TabIndex="4" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    ErrorMessage="* Tags is required field." ControlToValidate="txtName" ValidationGroup="valError" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                DatExpires
            </td>
            <td>
                <usercontrols:DateControl ID="dateControlStart" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Trigger Item(s)
            </td>
            <td>
                <asp:ListBox ID="lstTriggerItem" runat="server" DataValueField="SkuId" SelectionMode="multiple"
                    Width="500" Height="100" TabIndex="6" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Suppress Item(s)
            </td>
            <td>
                <asp:ListBox ID="lstSuppressItem" runat="server" DataValueField="SkuId" SelectionMode="multiple"
                    Width="500" Height="100" TabIndex="7"  />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Remove Item(s)
            </td>
            <td>
                <asp:ListBox ID="lstRemoveItems" runat="server" DataValueField="SkuId" SelectionMode="multiple"
                    Width="500" Height="100" TabIndex="8"  />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Add Item(s)
            </td>            
            <td>
                <asp:ListBox ID="lstAddItems" runat="server" DataValueField="SkuId" SelectionMode="multiple"
                    Width="500" Height="100" TabIndex="9"  />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Disable Shipping States
            </td>            
            <td>                
                <asp:ListBox ID="lstDisableStates" runat="server" SelectionMode="multiple"
                    Width="500" Height="100" />                
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                URI Label
            </td>            
            <td>
                <asp:TextBox ID="txtURILabel" runat="server" TabIndex="10" MaxLength="200" />
            </td>
        </tr>
         <tr>
            <td colspan="2">
                &#160;
            </td>
          
        </tr>
   
        <tr>
            <td>
                &#160;
            </td>
            <td>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                    OnCommand="btnAction_Command" TabIndex="10" />
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnAction_Command"
                    CausesValidation="true" ValidationGroup="valError" TabIndex="11"  />
            </td>
        </tr>
    </table>
</asp:Content>
