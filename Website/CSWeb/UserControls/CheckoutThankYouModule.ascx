<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutThankYouModule.ascx.cs" Inherits="CSWeb.UserControls.CheckoutThankYouModule" %>

<div id="receipt_content" style="height: auto; width: 819px; position:relative; padding: 40px 0; margin: 0 auto;">
    
    <h2>Thank you for your order!</h2>
<p>&nbsp;</p>
		<asp:HyperLink ID="hlPrinterFriendly" NavigateUrl="/Receipt-Friendly" Visible="false" runat="server" CssClass="printer" Target="_blank">
        	
            </asp:HyperLink>
        
        <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
<tr><td colspan="4"><div class="horizontal_dots"></div></td></tr>

<tr>
  <td width="17%" valign="top" style="padding-bottom: 20px; padding-right: 20px;">
                    <strong>Item</strong>
                </td>
                <td width="61%" valign="top" style="padding-bottom: 20px">
                    <strong>Description</strong>
                </td>
                <td width="11%" valign="top" align="center">
                    <strong>Qty</strong>
                </td>
                <td width="11%" valign="top">
                    <strong>Price</strong>
                </td>
            </tr>
                  <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <tr>
                             <td valign="top" style="padding-bottom: 20px; padding-right: 20px;">[backend - put image here]</td>
                                <td valign="top" style="padding-bottom: 20px">
                                <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                            </td>
                            <td valign="top" align="center">
                                <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                            </td>
                        
                             <td valign="top">
                                $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                            </td>
                          
                            </tr>
                          
                        </ItemTemplate>
                </asp:DataList>
                 
                 <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
           <tr><td colspan="4"><div class="horizontal_dots"></div></td></tr>
            <tr>
                <td valign="top" colspan="2">
                    
                </td>
                <td valign="top">
                    Subtotal:<br />
                    S &amp; H:
                    <br />
                     <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        Rush S &amp; H:<br />
                    </asp:Panel>
                    Tax:
                    <br />
            <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                Discount:<br />
            </asp:Panel>
                    Total:
                </td>
                <td valign="top">
                    <asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    <asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
                    </asp:Panel>
                    <asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
            <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
            </asp:Panel>
                    $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
                </td>
            </tr>
           <tr><td colspan="4"><div class="horizontal_dots"></div></td></tr>
        </table>
       <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
            <tr>
                <td colspan="2" valign="top" style="padding-bottom: 20px">
                    <strong>Shipping Information:</strong>
                </td>
                <td colspan="2" valign="top" style="padding-bottom: 20px">
                    <strong>Billing Information:</strong>
                </td>
            </tr>
            <tr>
                <td width="119" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:
                    <br />
                    Country:
                    <br />
                    Email Address:
                </td>
                <td width="310" valign="top">
                    <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal><br />
                </td>
                <td width="121" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:<br />
                    Country:
                </td>
                <td width="269" valign="top">
                    <asp:Literal ID="LiteralName_b" runat="server">
                    </asp:Literal><br />
                    <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal>
               </td>
            </tr>
            <tr><td colspan="4"></td></tr>
        </table>
        
</div>



