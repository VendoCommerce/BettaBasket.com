<%@Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutThankYouModule.ascx.cs" Inherits="CSWeb.Canada.CA_A1.UserControls.CheckoutThankYouModule" %>

<div id="content">
    
    	<h1 id="hdr_order_confirmation">Order Confirmation</h1>
		<p id="print_link" style="text-align: right; padding: 0 30px 9px 0;"><asp:HyperLink ID="hlPrinterFriendly" NavigateUrl="/Receipt-Friendly" runat="server" CssClass="printer" Target="_blank">
        		<span>Printer Friendly Version</span>
            </asp:HyperLink></p>    
        
        
        <div id="receipt_thanks">
        	<h2 style="height: 65px; visibility: hidden;">Thank you!</h2>
        	 <p class="thanks_text">Your Airocide order number is <%=orderId.ToString()%>, and an email confirmation will be sent to <span style="color: #2864b5;"><%=LiteralEmail.Text%></span>.</p>
            
            <div class="hr_fade" style="margin-bottom: 11px;"></div>
            
            <div style="margin-left: 40px;">
            	<table id="receipt_table">
                  <tr>
                    <th class="receipt_col_1 bg_gray"><div class="receipt_col_1_pad">Description</div></th>
                    <th class="receipt_col_2 bg_gray">Quantity</th>
                    <th class="receipt_col_3 bg_gray">Price per item</th>
                    <th class="receipt_col_4 bg_gray">S&amp;H</th>
                    <th class="receipt_col_5 bg_gray"><div class="receipt_col_5_pad">Total</div></th>
                  </tr>
                  
                  <tr><td colspan="5"><div class="clear" style="height: 4px;"></div></td></tr>
                  <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <tr>
                              <td class="receipt_col_1"><div class="receipt_col_1_pad"><%# DataBinder.Eval(Container.DataItem, "Title")%> </div></td>
                              <td class="receipt_col_2"><%# DataBinder.Eval(Container.DataItem, "Quantity")%></td>
                              <td class="receipt_col_3"><%# GetPrice(DataBinder.Eval(Container.DataItem, "InitialPrice"))%></td>
                              <td class="receipt_col_4"></td>
                              <td class="receipt_col_5"><div class="receipt_col_5_pad"></div></td>
                            </tr>
                            </tr>
                            <tr><td colspan="5"><div class="clear" style="height: 4px;"></div></td></tr>
                        </ItemTemplate>
                </asp:DataList>
                 
                  <tr>
                  	<td colspan="5" class="bg_gray" style="padding: 8px;">
                    	<div class="subtotal_text">Subtotal:</div>
                        <div class="subtotal_amt receipt_col_5_pad"><asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal></div>
                        <div class="clear">
                        </div>
                        
                        
                        <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                        	<div class="subtotal_text">Discount:</div>
                    	</asp:Panel>
                        
                        <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        	<div class="subtotal_amt receipt_col_5_pad"><asp:Label runat="server" ID="lblPromotionPrice"></asp:Label></div>
                            <div class="clear">
                        	</div>
                    	</asp:Panel>
                        
                        
                        
                        <div class="subtotal_text">Shipping:</div>
                        <div class="subtotal_amt receipt_col_5_pad"><asp:Literal ID="LiteralShipping" runat="server"></asp:Literal></div>
                        <div class="clear">
                        </div>
                        
                        <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        	<div class="subtotal_text">Rush S &amp; H:</div>
                    	</asp:Panel>
                        
                        <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    		<div class="subtotal_amt receipt_col_5_pad"><asp:Literal ID="LiteralExpeditedShipping" runat="server"></asp:Literal></div>
                            <div class="clear">
                        </div>
                    	</asp:Panel>
                        
                        <div class="subtotal_text">Est. Tax:</div>
                        <div class="subtotal_amt receipt_col_5_pad"><asp:Literal ID="LiteralTax" runat="server"></asp:Literal></div>
                        <div class="clear">
                        </div>
                        <div class="subtotal_text" style="color: #262626;">Total:</div>
                        <div class="subtotal_amt receipt_col_5_pad"><asp:Literal ID="LiteralTotal" runat="server"></asp:Literal></div>
                        <div class="clear">
                        </div>
                    </td>
                  </tr>
                </table>
            
            </div>
            
            <div class="hr_fade" style="margin: 11px 0 22px 0;"></div>
            
            <div class="receipt_summary_col_1">
            	<h3>Shipping Address</h3>
                Name: <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                Address: <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2" runat="server"> <br /></asp:Literal>
                City: <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                State: <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                Zip/Postal Code: <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                Country: <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
            </div>
            
            <div class="receipt_summary_col_2">
            	<h3>Billing Address</h3>
                Name: <asp:Literal ID="LiteralName_b" runat="server"></asp:Literal><br />
                Address: <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                	<asp:Literal ID="LiteralAddress2_b" runat="server"> <br /></asp:Literal>
                City: <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                State: <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                Zip/Postal Code: <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                Country: <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal><br />
                Email: <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal>
                
            </div>
        



</div>

<div class="clear" style="height: 45px;">
</div>
</div><!-- END content -->