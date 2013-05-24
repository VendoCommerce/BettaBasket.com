<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUList.aspx.cs" MasterPageFile="AdminSite.master"
    Inherits="CSWeb.Admin.SKUList" %>

<%@ Register TagPrefix="usercontrols" TagName="paging" Src="../UserControls/PageControl.ascx" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">SKU List</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary CssClass="error" ID="valError" runat="server" ShowSummary="True"
        DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="Image1" runat="server" ImageUrl="/Content/images/admin/add.gif"
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="hlAddSku" runat="server" CssClass="link" NavigateUrl="SKUItem.aspx"
                    Text="Create SKU"></asp:HyperLink>
            </td>
            <td align="right">
                <asp:UpdatePanel ID="updPg" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <usercontrols:paging ID="pg" OnPageChanged="OnPaging" Mode="Links" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
                <tr>
                    <td class="title" colspan="3">
                        SKUList
                    </td>
                </tr>
                <tr class="header">
                    <td align="left" width="70%">
                        <b>Title</b>
                    </td>
                      <td align="left" width="5%">
                        <b>Initial Price</b>
                    </td>
                    <td align="left" width="5%">
                        <b>Full Price</b>
                    </td>
                    <td align="center" width="5%">
                        <b>Active</b>
                    </td>
                    <td align="center" width="10%">
                        <b>Options</b>
                    </td>
                </tr>
                <asp:DataList runat="server" ID="dlSkuList" DataKeyField="SkuId" OnItemCommand="dlSKU_ItemCommand"
                    RepeatLayout="Flow" RepeatDirection="Horizontal" >
                    <ItemTemplate>
                        <tr>
                            <td class="body" align="left" width="70%">
                            <a href="SKUItem.aspx?skuid=<%# DataBinder.Eval(Container.DataItem, "skuid") %>">
                                <%# DataBinder.Eval(Container.DataItem, "title") %> - <%# DataBinder.Eval(Container.DataItem, "skuid") %>
                                </a>
                            </td>
                            <td class="body" align="left" width="5%">
                                $<%#   String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "InitialPrice"))%>
                            </td>
                            <td class="body" align="left" width="5%">
                                $<%#   String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "FullPrice")) %>
                            </td>
                            <td width="5%" align="center">
                                1
                            </td>
                            <td nowrap align="center" width="10%">
                              <asp:LinkButton ID="lbCopy" runat="server" CausesValidation="True" CommandName="Copy">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/copy.gif" BorderWidth="0"
                                        ToolTip='Copy' /></asp:LinkButton>&#160;

                                <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure your want to delete this SKU?')">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                        ToolTip='Delete' /></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
                <tr>
                    <td colspan="4">
                        <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
