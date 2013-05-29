<%@Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartControl.ascx.cs" Inherits="CSWeb.UserControls.ShoppingCartControl" %>
<asp:LinkButton ID="refresh" runat="server" CausesValidation="false"></asp:LinkButton>
<asp:Repeater runat="server" ID="rptShoppingCart" OnItemDataBound="rptShoppingCart_OnItemDataBound"
    OnItemCommand="rptShoppingCart_OnItemCommand">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="cart_table clearfix">
            <div class="cart_image">
                <asp:Image runat="server" ID="imgProduct" />
            </div>
            <div class="cart_text">
                <p class="basket_title">
                    <asp:Label runat="server" ID="lblSkuCode"></asp:Label></p>
                <p class="basket_description">
                    <asp:Label runat="server" ID='lblSkuDescription'></asp:Label></p>
            </div>
            <div class="cart_select">
           
                <asp:TextBox runat="server" ID="txtQuantity" Font-Size="8pt" Text='1' MaxLength="3"
                    Columns="2" OnTextChanged="OnTextChanged_Changed" Visible="false"></asp:TextBox>
                <asp:Label runat="server" ID="lblQuantity" CssClass="cart_select">
                </asp:Label>
            </div>
            <div class="product_price" runat="server">
                <asp:Label runat="server" ID="lblSkuInitialPrice"></asp:Label>                
            </div>
            <div runat="server" width="1%" id='holderRemove' visible="false">
                <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                    Visible="" CssClass="ucRemoveButtonOverlay" ImageUrl="../Content/images/delete.gif" />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Panel ID="pnlTotal" runat="server">
    <asp:PlaceHolder runat="server" ID="holderTaxAndShipping">
        <div class="horizontal_dots">
        </div>
        <div class="cart_totals clearfix">
            <div class="cart_totals_left">
                Subtotal:<br />
                S&amp;H:<br />
                Tax:<br />                
                Total:
            </div>
            <div class="cart_totals_right">
                <asp:Literal runat="server" ID='lblSubtotal'></asp:Literal><br />
                <asp:Literal runat="server" ID="lblShipping"></asp:Literal><br />                                
                <asp:Literal runat="server" ID="lblTax"></asp:Literal><br />
                <asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal>

                <asp:Literal runat="server" ID="lblRushShipping" Visible="false"></asp:Literal>                
                <table>
                    <tr id='holderRushShippingTotal' runat="server" Visible="False">
                        <td class='cartSubtotalTitle' align="right" colspan="3">
                            Rush Shipping:
                        </td>
                        <td class='cartSubtotalValue' align="center">
                        </td>
                    </tr>
                    <tr id='holderRushShipping' runat="server" visible="false">
                        <td colspan="4" class="rushShipping">
                            <asp:CheckBox runat="server" ID="chkIncludeRushShipping" OnCheckedChanged="chkIncludeRushShipping_OnCheckedChanged"
                                AutoPostBack="true" Text="Rush Shipping" />
                        </td>
                    </tr>
                </table>
            </div>

            <div>
                <asp:CheckBox ID="chkAdditionItem" runat="server" AutoPostBack="true" OnCheckedChanged="chkAdditionItem_CheckChanged" /> Click here to get an additional Betta Basket
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Panel>
   <div class="cart_offer" style="padding: 30px 25px 10px 10px;">
   <strong>*OFFER DETAILS:</strong> As part of our Special TV Trial Offer you can try The ifocus System in the comfort of your own home for only $14.95 with FREE S&amp;H.  If you decide to keep the system, simply do nothing and beginning 30 days following your date of purchase you will be charged four easy monthly payments of $49.95, plus tax.  All orders are backed by our 6 month 100% money back guarantee.  Watch your child achieve their true potential &mdash; starting today and lasting into the future!
           </div>