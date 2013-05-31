<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="CSWeb.Privacy" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="ShippingForm" Src="UserControls/ShippingForm.ascx" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Betta Basket - Privacy Policy</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="Show Off Your New Green Thumb - with Betta Basket! Growing healthy flowers and plants is now easier than ever!">
<meta name="keywords" content="betta basket, gardening, green thumb, air streaming, flowers, plants, hanging baskets" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/scripts/global.js"></script>
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<link href="styles/global.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
    <form id="form1" runat="server">
    <!--#include file="popups.html"-->
    <div class="container">
<uc:Header runat="server" />
<div class="left">

 <%= CSWebBase.SiteBasePage.GetPrivacyPolicy() %> 
</div>
<div class="right">

	<uc:ShippingForm RedirectUrl="AddProduct.aspx" runat="server" />
    <div class="right_basket">
    <p>Basket Measurements:<br />
Approx. 7-1-1/2" H x 15-1/4" Outer Diameter,<br />
Approx. 14" Inner Diameter,<br />
Approx. 22-1/2" H with chain extended</p>
    <p>Chain Measurements:<br />
      Approx. 15-1/2&quot; L</p>
    <p>Weight:<br />
      Approx. 1.3 lbs.</p>
    <p>Volume Capacity:<br />
      Approx. 3.17 gallons</p>
    <p>Material Composition:<br />
      Plastic and steel
    </p>
    </div>
</div>
<div class="clear"></div>

<!--#include file="bottomcta.html"-->
</div>

<uc:Footer runat="server" />
</form>
<uc:TrackingPixels runat="server" />
</body>
</html>

   

   