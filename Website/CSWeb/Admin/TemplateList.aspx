<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateList.aspx.cs" Inherits="CSWeb.Admin.TemplateList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define Templates information</font> </span>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="lbItemAdd" runat="server" CssClass="link" NavigateUrl="TemplateItem.aspx"
                    Text="Add Template"></asp:HyperLink>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <asp:DataList runat="server" ID="dlTemplateList" RepeatLayout="Flow" RepeatDirection="Horizontal"
        OnItemCommand="dlTemplateList_ItemCommand" OnItemDataBound="dlTemplateList_ItemDataBound">
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr>
                    <td class="title" colspan="4">
                        Template List
                    </td>
                </tr>
                <tr class="header">
                    <td align="left" width="40%" class="ibn-sectionheader">                    
                        Title                        
                    </td>
                    <td align="center" width="20%" class="ibn-sectionheader">
                        CreateDate
                    </td>
                    <td align="center" width="25%" class="ibn-sectionheader">
                        ExpireDate
                    </td>
                    <td align="left" width="15%" class="ibn-sectionheader">
                        Options
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr id="holderExpireDate" runat="server">
                <td class="body" align="left" width="40%">
                <a href="TemplateItem.aspx?templateId=<%# DataBinder.Eval(Container.DataItem, "TemplateId") %>">
                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                    </a>
                </td>
                <td class="body" align="center" width="20%">
                    <%# DataBinder.Eval(Container.DataItem, "CreateDate")%>
                </td>
                <td align="center" width="25%">
                    <asp:Label ID="lblExpireDate" runat="server" />
                </td>
                <td nowrap align="left" width="15%">
                    <asp:LinkButton ID="lbCopy" runat="server" CausesValidation="True" CommandName="Copy">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/copy.gif" BorderWidth="0"
                            ToolTip='Copy' /></asp:LinkButton>&#160;                    
                    <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                        <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                            ToolTip='Delete' /></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
         </table>
        </FooterTemplate>
    </asp:DataList>

    <table>
    <tr>
        <td colspan="4">
            <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnAction_Command"
                CommandName="Back" />
            &nbsp;&nbsp;&nbsp;&nbsp;
        </td>
    </tr>
    </table>
    <br />
</asp:Content>
