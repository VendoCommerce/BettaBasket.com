<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailList.aspx.cs" Inherits="CSWeb.Admin.EmailList" MasterPageFile="AdminSite.master"%>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define Email Templates</font> </span>
    <br />
    <br />

    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                 <asp:Image AlternateText="Add" ID="Image1" runat="server" ImageUrl="/Content/images/admin/add.gif"
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="hlAddEmail" runat="server" CssClass="link" NavigateUrl="EmailItem.aspx"
                    Text="Create Email"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Email List
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="20%" class="ibn-sectionheader">
                Title
            </td>
            <td align="left" width="20%" class="ibn-sectionheader">
                Subject
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                FromAddress
            </td>
            <td align="left" width="45%" class="ibn-sectionheader">
                Body
            </td>            
            <td align="center" width="5%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlEmailList" RepeatLayout="Flow" RepeatDirection="Horizontal"
            OnItemCommand="dlEmailList_ItemCommand"  OnItemDataBound="dlEmailList_ItemDataBound">
            <ItemTemplate>
                <tr>
                 
                    <td class="body" align="left" width="20%" valign="top">
                        <%# DataBinder.Eval(Container.DataItem, "Title")%>
                    </td>
                    <td class="body" align="left" width="20%" valign="top">
                        <%# DataBinder.Eval(Container.DataItem, "Subject")%>
                    </td>
                    <td class="body" align="center" width="10%" valign="top">
                         <%# DataBinder.Eval(Container.DataItem, "FromAddress")%>
                    </td>
                    <td class="body" align="left" width="45%" valign="top">
                         <asp:Label ID="lblBody" runat="server" />
                    </td>
                    
                    <td nowrap align="center" width="5%" valign="top">
                            <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Edit">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                        ToolTip='Edit' /></asp:LinkButton> &#160;
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
           
        </asp:DataList>
       
        <tr>
            <td colspan="5">
                <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnAction_Command" CommandName="Back" />
              
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
