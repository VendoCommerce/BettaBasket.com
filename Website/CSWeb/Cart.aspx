<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CSWeb.Cart" EnableSessionState="True" %>
<%@ Register TagPrefix="uc" TagName="BillingCreditForm" Src="UserControls/BillingCreditForm.ascx" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Betta Basket - Shopping Cart</title>
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
    <uc:BillingCreditForm runat="server" />

  </div>

<uc:Footer runat="server" />
</form>
<uc:TrackingPixels runat="server" />
</body>
</html>

