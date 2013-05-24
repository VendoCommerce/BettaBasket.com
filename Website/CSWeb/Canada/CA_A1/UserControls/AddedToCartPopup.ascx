<%@Control Language="C#" AutoEventWireup="true" CodeBehind="AddedToCartPopup.ascx.cs" Inherits="CSWeb.Canada.CA_A1.UserControls.AddedToCartPopup" %>

<a id="addedToCart" name="addedToCart"></a>
<div id="added_to_cart">
	<div style="padding-top: 5px; width: 26px; height: 26px;float:left; cursor: pointer;" onclick="closeAddToCart('added_to_cart');"><img src="/content/images/spacer.gif" width="26" height="26" /></div>

	<h3 style="height: 57px; visibility: hidden;">ITEM ADDED TO YOUR CART</h3>
    <div align="center"><a href="/cart"><img src="/content/images/btn_cart_checkout.png" alt="GO TO CART AND CHECK OUT" /></a></div>
</div>