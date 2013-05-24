<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CouponItem.aspx.cs" Inherits="CSWeb.Admin.CouponItem"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add New Coupon</title>
    <script language="javascript" type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <table cellspacing="1" cellpadding="2" width="100%" border="0">
        <tr>
            <td width="15%" align="right" class="rowheader">
                Discount Code: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                    ControlToValidate="txtDiscountTitle">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDiscountTitle" runat="server" Width="40%" MaxLength="50" CssClass="body" />&#160;&#160;
            </td>
        </tr>
        <tr>
            <td align="right" class="rowheader">
                DiscountType: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:RequiredFieldValidator ID="rfqDicountType" runat="server" Display="Dynamic"
                    ErrorMessage="DiscountType is required field" ControlToValidate="ddlDiscountType">*</asp:RequiredFieldValidator>
                <asp:DropDownList runat="server" ID='ddlDiscountType' AutoPostBack="true" OnSelectedIndexChanged="ddlDiscountType_OnSelectedIndexChanged" />
            </td>
        </tr>
        <tr>
            <td align="right" class="rowheader">
                Discount(% or amount):
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtPercentage" runat="Server" Width="5%" MaxLength="7" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtPercentage"
                    ID="rfvPercentage" ValidationGroup="valError" ErrorMessage="* Discount is required field.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cmpPercentage" runat="server" ControlToValidate="txtPercentage"
                    Type="Double" ErrorMessage="* Discount must be an double." Operator="DataTypeCheck"
                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="rowheader">
                TotalAmount:
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txttotalAmount" runat="Server" Width="5%" MaxLength="7" />
            </td>
        </tr>
        <tr>
            <td align="right" class="rowheader">
                IncludeShipping:(For % only)
            </td>
            <td class="rowbody">
                <asp:CheckBox ID="cbIncludeShipping" runat="server" />                
            </td>
        </tr>
        <asp:Panel ID="pnlItem" runat="server" Visible="false">
        <asp:DataList runat="server" ID="dlSkuCouponList" OnItemCommand="dlSkuCouponList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlSkuCouponList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="30%">                        
                        <asp:DropDownList ID="ddlSkuList" runat="server">
                        </asp:DropDownList>

                    </td>
                    <td width="20%" align="center">
                        <asp:DropDownList runat="server" ID='ddlRelatedSkuList' />
                    </td>
                    <td width="20%" align="center">
                        <asp:DropDownList runat="server" ID='ddlItemDiscountType' />
                    </td>
                    <td width="10%" align="center">
                        <asp:TextBox ID="txtItemDiscount" runat="Server" Width="30%" MaxLength="7" />
                    </td>
                    <td nowrap align="center" width="5%">
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif"
                                BorderWidth="0" ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
            <tr>
                <td align="right" class="rowheader">
                    Item Promotion:
                </td>
                <td class="rowbody">
                    <table cellspacing="1" cellpadding="2" width="100%" border="0">
                        <tr>
                            <td>
                                Item
                            </td>
                            <td>
                                RelatedItem
                            </td>
                            <td>
                                DiscountType
                            </td>
                            <td>
                                DiscountAmount
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList runat="server" ID='ddlSkuList' />
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID='ddlRelatedSkuList' />
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID='ddlItemDiscountType' />
                            </td>
                            <td>
                                <asp:TextBox ID="txtItemDiscount" runat="Server" Width="30%" MaxLength="7" />
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtItemDiscount"
                                    ID="Requiredfieldvalidator1" ValidationGroup="valError" ErrorMessage="* Item Discount Amount is required field.">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtItemDiscount"
                                    Type="Double" ErrorMessage="*  Item Discount Amount must be an double." Operator="DataTypeCheck"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td colspan="2">
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
