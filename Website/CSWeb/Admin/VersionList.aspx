<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VersionList.aspx.cs" Inherits="CSWeb.Admin.VersionList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define Versions</font> </span>
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
                    CommandName="AddNew" Text="Add Version"></asp:LinkButton>
                <asp:Image AlternateText="Add" ID="Image4" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="VersionCategoryList.aspx"
                    Text="View VersionCategory"></asp:HyperLink>&nbsp;&nbsp;
            </td>
        
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Version
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="40%" class="ibn-sectionheader">
                Title
            </td>
            <td align="left" width="30%" class="ibn-sectionheader">
                ShotName
            </td>
            <td align="left" width="20%" class="ibn-sectionheader">
                Category
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlVersionList" OnItemCommand="dlVersionList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlVersionList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
                    <td class="body" align="left" width="30%">
                        <asp:Literal runat="server" ID='lblShortName'></asp:Literal>
                    </td>
                    <td width="20%" align="left">
                        <asp:Literal runat="server" ID='lblCategoy'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:Literal runat="server" ID='lblStatus'></asp:Literal>
                    </td>
                    <td nowrap align="center" width="5%">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure your want to delete this Version?')">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                            ControlToValidate="txtEditTitle">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"title")%>'
                            CssClass="body" MaxLength="50" Width="50%"></asp:TextBox>
                    </td>
                    <td class="body" align="left" width="20%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="ShortName is required field" ControlToValidate="txtEditShortName">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditShortName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"shortName")%>'
                            CssClass="body" MaxLength="50" Width="50%"></asp:TextBox>
                    </td>
                    <td width="20%" align="left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="Category is required field" ControlToValidate="ddlEditCategory">*</asp:RequiredFieldValidator>
                        <asp:DropDownList runat="server" ID='ddlEditCategory' />
                    </td>
                    <td width="5%" align="center">
                        <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Visible") %>' />
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
                <td colspan="1" class="body" width="40%">
                    <asp:RequiredFieldValidator ID="valAddName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                        ControlToValidate="txtTitle">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTitle" runat="server" Width="30%" MaxLength="50" CssClass="body" />&#160;&#160;
                </td>
                <td class="body" align="left" width="20%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="ShortName is required field" ControlToValidate="txtShortName">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtShortName" runat="server"  CssClass="body" MaxLength="50" Width="30%"></asp:TextBox>
                </td>
                <td width="20%" align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="Category is required field" ControlToValidate="ddlCategory">*</asp:RequiredFieldValidator>
                    <asp:DropDownList runat="server" ID='ddlCategory' />
                </td>
                <td width="5%" align="center">
                    <asp:CheckBox ID="cbVisible" runat="server" />
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
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </tr>
    </table>
    <br />
</asp:Content>
