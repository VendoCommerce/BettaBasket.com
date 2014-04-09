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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
<div class="home_left"><img src="//d10yufw89ry03z.cloudfront.net/images/home_leftside.png" width="622" height="898" usemap="#Mapleft" style="margin-left: -26px; display: block;" />
  <map name="Mapleft">
    <area shape="rect" coords="7,464,564,530" href="#mbg" class="mbg">
  </map>
<div class="homebullets">
<ul>
<li>Create stunning hanging baskets</li>
<li>Make your gardening even easier</li>
<li>Easy-to-plant &ndash; lift panels and pop in plants!</li>
</ul>
</div>

<div class="home2">
<p>Now it's easy to make sure your plants get what they need!</p>
</div>

<div class="homebullets2">
<ul>
<li>Access to moisture in-between watering</li>
<li>Improved airflow to increase growth</li>
<li>Get critical nutrients to the plant roots</li>
<li>Holds up to 16 plants: 12 on the sides 
and 4 on top</li>
</ul>
</div>

<div class="home3">
<p><a href="#tryitnow" class="orange f16 try">Try Betta Basket Today!</a></p>
<p>The easiest way to grow beautiful hanging baskets for just <strong>$19.99 + S/H!</strong></p>
</div>

</div>
<div class="right">
<div class="home_video">
 <div id="ctavideo"></div>
<script type='text/javascript'>
  jwplayer('ctavideo').setup({
    flashplayer: '/Scripts/jwplayer/player.swf',
	file: 'https://d10yufw89ry03z.cloudfront.net/flash/ctavideo.mp4',
	autostart: true,    
	controlbar: 'bottom',
	image: '//d10yufw89ry03z.cloudfront.net/images/videostop.jpg',
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
<div class="home_bottom">
<img src="//d10yufw89ry03z.cloudfront.net/images/home_bottom.jpg" width="904" height="1350" style="display: block;" />
<div class="homeb1">Bring in the beauty of flowers and herbs in wonderful displays of color to your home and garden. Not only is Betta Basket easy to plant, but flowers thrive when they are planted in Betta Basket. 
Try a whole new world of plant possibilities in your Betta Basket! </div>
<div class="homeb2"><strong>Tomatoes</strong><br>
Right off the vine! Nothing is fresher than homegrown produce! With your Betta Basket, you're growing your own legendary tomatoes in no time!
</div>
<div class="homeb3"><strong>Peppers</strong><br>
Colorful and nutritious!<br>

Liven up your meals with your very own colorful, healthy peppers grown in your own home with your Betta Basket! 
</div>
<div class="homeb4"><strong>Herbs</strong><br>
  A Basket Full of Flavor!<br>

Herbs are a great way to kick the flavor up a notch – grown right at home with Betta Basket! You'll wow your family!

</div>
<div class="homeb5">Wellspring Water Trough</div>
<div class="homeb6">Air streaming Technology</div>
<div class="homeb7">Center Source Design</div>
<div class="homeb8">A Green Thumb is Easier Than Ever!</div>
<div class="homeb9">Plants get just the right amount of water with your Betta Basket's Wellspring Water Trough design.</div>
<div class="homeb10">Betta Basket's Air Streaming Technology maintains proper airflow so your plants can breath and grow healthy 
and strong!</div>
<div class="homeb11">All of your plants' roots are centered for optimal nutrient and water distribution with Betta Basket's Center 
Source Design.</div>
<div class="homeb12"><a href="#tryitnow" class="orange f17 bold underline try">Try Betta Basket Today!</a></div>
<div class="homeb13"><p class="homebhead">Stop Killing Your Plants!</p><p>Don't deprive your <br>
  plants of water, <br>
  nutrients, and the<br>
  airflow they need! </p></div>
<div class="homeb14"><p class="homebhead">Grow Beautiful Flowers!</p><p>You can forget buying plants over and over after they die in a conventional hanging basket! Get a Betta Basket now!</p></div>
<div class="homeb15"><p class="homebhead">Stop Overpaying!</p><p style="margin-left: 150px">Pricey hanging baskets use the same tired technology. Get smart and start saving now with Betta Basket!</p></div>
<div class="homeb16"><a href="#tryitnow" class="orange f16 bold underline try">Get Betta Basket and Create Stunning Hanging Baskets!  </a></div>
 <div class="right_basket homeb17">
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
<!--#include file="bottomcta.html"-->
</div>

<uc:Footer runat="server" />
</form>
<uc:TrackingPixels runat="server" />
</body>
</html>
