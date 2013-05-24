<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CouponList.aspx.cs" Inherits="CSWeb.Admin.CouponList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define Coupons</font> </span>
    <br />
    <br />
    <asp:ValidationSummary CssClass="failureNotification" ID="valError" runat="server"
        ShowSummary="True" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="hlItem" runat="server" CssClass="link" NavigateUrl="CouponItem.aspx"
                    Text="Add Promotion"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Coupons
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="30%" class="ibn-sectionheader">
                Code
            </td>
            <td align="center" width="20%" class="ibn-sectionheader">
                Discount
            </td>
            <td align="center" width="20%" class="ibn-sectionheader">
                Total Amount
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Type
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlCouponList" OnItemCommand="dlCouponList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlCouponList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="30%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
                    <td width="20%" align="center">
                        <asp:Literal runat="server" ID='lblDiscount'></asp:Literal>
                    </td>
                    <td width="20%" align="center">
                        <asp:Literal runat="server" ID='lblTotalAmount'></asp:Literal>
                    </td>
                    <td width="10%" align="center">
                        <asp:Literal runat="server" ID='lblDiscountType'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:Literal runat="server" ID='lblStatus'></asp:Literal>
                    </td>
                    <td nowrap align="center" width="5%">
                        <asp:HyperLink ID="hlEditLink" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="/Content/images/admin/edit.gif">
                        </asp:HyperLink>
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif"
                                BorderWidth="0" ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </tr>
    </table>
    <br />
</asp:Content>
