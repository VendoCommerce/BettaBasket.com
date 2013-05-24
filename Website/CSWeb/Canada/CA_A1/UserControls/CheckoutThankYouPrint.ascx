<%@Control Language="C#" Inherits="CSWeb.Canada.CA_A1.UserControls.CheckoutThankYouPrint" %>
<%@ Register Src="TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

        <h2 style="margin-bottom: 10px;">
            Order Confirmation</h2>

        <div class="shoppingmain clearfix">
            <h4>
                THANK YOU!
            </h4>
            <p style="font-size: 11px; line-height: 17px; padding-bottom: 15px;">
                Your order number is
                <%=orderId.ToString()%>, and an email confirmation will be sent to <span class="receiptgreen">
                    <%=LiteralEmail.Text%>.</span><br />
If you have any questions about your order, email us at or give us a call at (866) 677-3330.
</p>
            <div class="receipt_divider">
            </div>
            
            
            
            <table id="receipt_table_print">
                  <tr>
                    <th class="receipt_col_1">Description</th>
                    <th class="receipt_col_2">Quantity</th>
                    <th class="receipt_col_3">Price per item</th>
                  </tr>
                  
                  
                  <tr><td colspan="3"><div class="clear" style="height: 4px;"></div></td></tr>
                  <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <ItemTemplate>
                  <tr>
                              <td class="receipt_col_1"><%# DataBinder.Eval(Container.DataItem, "Title")%> </td>
                              <td class="receipt_col_2"><%# DataBinder.Eval(Container.DataItem, "Quantity")%></td>
                              <td class="receipt_col_3"><%# GetPrice(DataBinder.Eval(Container.DataItem, "InitialPrice"))%></td>
                            </tr>
                            <tr><td colspan="3"><div class="clear" style="height: 4px;"></div></td></tr>
				</ItemTemplate>
                </asp:DataList>
           </table>

           
                        
            <div class="receipt_row clearfix shaded2">
                <div class="receipt_row_totaldescription">
                    Subtotal: <asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                        Discount: <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                    </asp:Panel><br />
                    </asp:Panel>
                    Shipping: <asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        Rush S &amp; H: <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    </asp:Panel><br />
                    </asp:Panel>
                    Tax: <asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                    <span class="black">Total: <asp:Literal ID="LiteralTotal" runat="server"></asp:Literal></span></div>
               
            </div>

            <div class="receipt_divider">
            </div>

            <div class="billing_left">
                <h4 class="billinghead1" style="margin: 15px 0 5px 0;">
                    BILLING ADDRESS</h4>
                <p>
                    Name:
                    <asp:Literal ID="LiteralName_b" runat="server"></asp:Literal><br />
                    Address:
                    <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                    City:
                    <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                    State:
                    <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                    Zip/Postal Code:
                    <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                    Country:
                    <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal><br />
                    Email:
                    <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal></p>
            </div>
            <div class="billing_right">
                <h4 class="billinghead1" style="margin: 15px 0 5px 0;">
                    SHIPPING ADDRESS</h4>
                <p>
                    Name:
                    <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                    Address:
                    <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                    City:
                    <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                    State:
                    <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                    Zip/Postal Code:
                    <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                    Country:
                    <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal></p>
            </div>
            <div class="clear">
            </div>


</div>
<uc:TrackingPixels ID="TrackingPixels" runat="server" />
