<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VersionCategoryList.aspx.cs" Inherits="CSWeb.Admin.VersionCategoryList"   MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define Version Category</font>
    </span>
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
                    CommandName="AddNew" Text="Add Version Category"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Version Category
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="80%" class="ibn-sectionheader">
                Title
            </td>

              <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlVersionList" OnItemCommand="dlVersionList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlVersionList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="90%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
       

                    <td nowrap align="center" width="10%">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td class="body" align="left" width="90%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                            ControlToValidate="txtEditCategory">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditCategory" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"title")%>'
                            CssClass="body" MaxLength="100" Width="90%"></asp:TextBox>
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
                <td colspan="1" class="body" width="70%">
                    <asp:RequiredFieldValidator ID="valAddName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                        ControlToValidate="txtCategory">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCategory" runat="server" Width="30%" MaxLength="100" CssClass="body" />&#160;&#160;
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
            <td colspan="3">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </tr>
    </table>
    <br />
</asp:Content>
