<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" MasterPageFile="AdminSite.master"
    Inherits="CSWeb.Admin.CategoryList" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define basic category parameters</font>
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
                    CommandName="AddNew" Text="Create Category"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Category
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="80%" class="ibn-sectionheader">
                Title
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Order
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlCategoryList" OnItemCommand="dlCategory_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlCategoryList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="80%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:Literal runat="server" ID='lblStatus'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:Literal runat="server" ID='lblOrder'></asp:Literal>
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
                    <td class="body" align="left" width="70%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                            ControlToValidate="txtEditCategory">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditCategory" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"title")%>'
                            CssClass="body" MaxLength="100" Width="90%"></asp:TextBox>
                    </td>
                    <td width="5%" align="center">
                        <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Visible") %>' />
                    </td>
                    <td width="5%" align="center">
                        <asp:TextBox ID="txEdittorder" runat="server" MaxLength="2" Width="50%" Text='<%#DataBinder.Eval(Container.DataItem,"orderNo")%>' />
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
                    <asp:TextBox ID="txtCategory" runat="server" Width="90%" MaxLength="100" CssClass="body" />&#160;&#160;
                </td>
                <td>
                </td>
                <td align="center">
                  <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtorder"
                                    Type="Integer" ErrorMessage="* Order number must be an integer." Operator="DataTypeCheck"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                    <asp:TextBox ID="txtorder" runat="server" MaxLength="2" Width="20%" />
                </td>
                <td nowrap align="center" width="10%">
                    <asp:LinkButton ID="lbSave" runat="server" CommandName="Add" OnCommand="btnAction_Command"
                        CausesValidation="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/save.gif" BorderWidth="0"
                            ToolTip='Save' /></asp:LinkButton>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" OnCommand="btnAction_Command"
                        CausesValidation="False">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/cancel.gif" BorderWidth="0"
                            ToolTip='Cancel' /></asp:LinkButton>
                </td>
               
            </tr>
        </asp:PlaceHolder>
     
        <tr>
            <td colspan="4">    <asp:button runat="server" id="btnCancel" text="Back" commandname="Back" OnCommand="btnAction_Command"/>
              
        </tr>
    </table>
   
    <br />
</asp:Content>
