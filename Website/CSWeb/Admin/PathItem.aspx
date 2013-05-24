<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PathItem.aspx.cs" Inherits="CSWeb.Admin.PathItem"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add New Path</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <span class="header"><font color="blue">Create or Modify Path</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />

    <table cellspacing="1" cellpadding="2" width="100%" border="0">
        <tr>
            <td colspan="2" class="tblhdr">
                <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Add/Edit Path</asp:Label>
            </td>
        </tr>
        <tr>
            <td width="15%" class="tblrowhdr" align="right">
                Title: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtTitle" runat="Server" Width="40%" MaxLength="100" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtTitle"
                    ID="valReqTitle" ValidationGroup="valError" ErrorMessage="* Title is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Weight: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtWeight" runat="Server" width="5%" MaxLength="4" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtWeight"
                    ID="valReqCode" ValidationGroup="valError" ErrorMessage="* Weight is required field.">*</asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtWeight"
                                    Type="Double" ErrorMessage="* Weight number must be an double." Operator="DataTypeCheck"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Version: <font color="red">*</font>
            </td>
            <td class="rowbody">
                 <asp:ListBox ID="lstVersion" runat="server" DataValueField="SkuId" SelectionMode="multiple"
                     Height="100" TabIndex="9"  />
            </td>
        </tr>   
        <tr>
            <td align="right" valign="top" algin="right">
                Templates: <font color="red">*</font>
            </td>
            <td class="rowbody" >
                <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
                    <tr class="header">
                        <td align="center" width="5%" class="ibn-sectionheader">
                            Active
                        </td>
                        <td align="left" width="40%" class="ibn-sectionheader">
                            Title
                        </td>
                        <td align="left"  width="55%" class="ibn-sectionheader">
                            Order
                        </td>
                    </tr>
                    <asp:DataList runat="server" ID="dlTemplateList" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlTemplateList_ItemDataBound">
                        <ItemTemplate>
                            <tr id="holderExpireDate" runat="server">
                                <td width="5%" align="center" class='CheckboxHolder'>
                                    <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Active") %>' />
                                </td>
                                <td align="left" width="40%">
                                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                </td>
                                <td align="left" width="55%">
                                    <asp:TextBox runat="server" ID="txtOrderNo" MaxLength="2" Width="30%" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNo") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtOrderNo"
                                    Type="Integer" ErrorMessage="* order number must be an integer." Operator="DataTypeCheck"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:DataList>
                </table>
            </td>
        </tr>
        <tr>
            <td>
               &nbsp;
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
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <br />
</asp:Content>
