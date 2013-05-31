<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.Store.index" EnableSessionState="True" %>
<%@ Register TagPrefix="uc" TagName="ShippingForm" Src="UserControls/ShippingForm.ascx" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Betta Basket - Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="Show Off Your New Green Thumb - with Betta Basket! Growing healthy flowers and plants is now easier than ever!">
<meta name="keywords" content="betta basket, gardening, green thumb, air streaming, flowers, plants, hanging baskets" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/scripts/global.js"></script>
<script type="text/javascript" src="/Scripts/jwplayer/jwplayer.js"></script>
<link href="styles/global.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
<form runat="server" id="fm1">
<!--#include file="popups.html"-->

<div class="container">
<uc:Header runat="server" />
<div class="home_left"><img src="Content/Images/home_leftside.png" width="622" height="898" usemap="#Mapleft" style="margin-left: -26px" />
  <map name="Mapleft">
    <area shape="rect" coords="7,464,564,530" href="#mbg" class="mbg">
  </map>

</div>
<div class="right">
<div class="home_video">
 <div id="ctavideo"></div>
<script type='text/javascript'>
  jwplayer('ctavideo').setup({
    flashplayer: '/Scripts/jwplayer/player.swf',
	file: '/content/flash/ctavideo.mp4',
	autostart: true,    
	controlbar: 'bottom',
	image: '/content/images/videostop.jpg',
    width: 298,
    height: 188,
	stretching: 'exactfit',
	skin: '/Scripts/jwplayer/glow.zip'
	});
	</script>
</div>
<uc:ShippingForm RedirectUrl="AddProduct.aspx" runat="server" />
</div>
<div class="clear"></div>
<div class="home_bottom"></div>
<!--#include file="bottomcta.html"-->
</div>

<uc:Footer runat="server" />
</form>
<uc:TrackingPixels runat="server" />
</body>
</html>
