<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceList.aspx.cs" Inherits="CSWeb.Admin.ResourceList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define Resource information</font> </span>
    <br />
    <br />
    <asp:ValidationSummary CssClass="failureNotification" ID="valError" runat="server"
        ShowSummary="True" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" OnCommand="btnAction_Command"
                    CommandName="AddNew" Text="Add New Resource"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Resources
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="40%" class="ibn-sectionheader">
                Key
            </td>
            <td align="left" width="50%" class="ibn-sectionheader">
                Value
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlItemList" RepeatLayout="Flow" RepeatDirection="Horizontal"
            OnItemCommand="dlItem_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <%# DataBinder.Eval(Container.DataItem, "Key") %>
                    </td>
                    <td class="body" align="left" width="50%">
                        <%# DataBinder.Eval(Container.DataItem, "Value") %>
                    </td>
                    <td nowrap align="center" width="10%">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="* Key is required field"
                            ControlToValidate="txtEditKeyName">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditKeyName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Key")%>'
                            CssClass="body" MaxLength="100" Width="40%"></asp:TextBox>
                    </td>
                    <td class="body" align="left" width="50%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="* Value is required field" ControlToValidate="txtEditValueName">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditValueName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Value")%>'
                            CssClass="body" MaxLength="1000" Width="50%"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Update">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                                ToolTip='Save' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel">
                            <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                                ToolTip='Cancel' /></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
        </asp:DataList>
        <asp:PlaceHolder ID="pnlAddCategory" runat="server" Visible="False">
            <tr class="searchlegend">
                <td class="body" width="40%">
                    <asp:RequiredFieldValidator ID="valAddName" runat="server" Display="Dynamic" ErrorMessage="* Key is required field"
                        ControlToValidate="txtKeyName">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtKeyName" runat="server" Width="90%" MaxLength="100" CssClass="body" />&#160;&#160;
                </td>
                <td class="body" width="50%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="* Value is required field" ControlToValidate="txtValueName">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtValueName" runat="server" Width="90%" MaxLength="1000" CssClass="body" />&#160;&#160;
                </td>
                <td nowrap align="center" width="10%">
                    <asp:LinkButton ID="lbSave" runat="server" CommandName="Add" OnCommand="btnAction_Command"
                        CausesValidation="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                            ToolTip='Save' /></asp:LinkButton>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" OnCommand="btnAction_Command"
                        CausesValidation="False">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                            ToolTip='Cancel' /></asp:LinkButton>
                </td>
            </tr>
        </asp:PlaceHolder>
    </table>
    <br />
    <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnSave_OnClick" CommandName="Back" />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Reset Cache" ID="imgSave" OnCommand="btnSave_OnClick"
        CommandName="Save" runat="server" ValidationGroup="valError" />
    <br />
</asp:Content>
