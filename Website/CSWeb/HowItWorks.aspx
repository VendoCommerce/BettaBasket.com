<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HowItWorks.aspx.cs" Inherits="CSWeb.HowItWorks" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="ShippingForm" Src="UserControls/ShippingForm.ascx" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Betta Basket - How It Works</title>
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
<h2>Betta Basket: Breakthough design for great-looking 
  flower displays! </h2>
  <div style="display: inline-block;">
<p style="color: #000"><img src="//d10yufw89ry03z.cloudfront.net/images/how_1.jpg" width="328" height="199" class="fright" />Betta Basket brings you more opportunities than ever to create and sustain your basket arrangements. The breakthrough design allows your plants to receive more nutrients, access to water, and unprecedented airflow that supercharges growth and looks great! <strong><a href="mailto:info@tmgtv.com"></a></strong></p>
</div>
  <h2 style="color: #555; font-size: 20px;">They'll wonder how you did it... but it's easy <br>
    with Betta Basket!</h2>
    <div class="how"><img src="//d10yufw89ry03z.cloudfront.net/images/how2.jpg" />
<p class="f15">You won't believe how quickly you'll finish your first amazing Betta Basket. Just put a little soil in the bottom of the basket for a base. This will be where the <strong>Wellspring Water Trough</strong> stores water to provide continuous moisture to your plants especially during hot, dry periods!</p>
</div>

   <div class="how"><img src="//d10yufw89ry03z.cloudfront.net/images/how3.jpg" />
<p class="f15">Next, simply place a few of your plants in  and throughout your Betta Basket. <strong>Twelve removable side panels show you where to put plants</strong>.  Plant from the outside in to avoid crushing the leaves. All the roots are centrally located so they get all the water they need!</p>
</div>
   <div class="how"><img src="//d10yufw89ry03z.cloudfront.net/images/how4.jpg" />
<p class="f15"><strong>Just snap in the Aeration Panels</strong> to hold in the soil and maintain the airflow that will help supercharge your plants. Place a little more soil in the basket, and complete the top of your basket with plants of 
  your choice!</p>
  </div>
     <div class="how"><img src="//d10yufw89ry03z.cloudfront.net/images/how5.jpg" />
<p class="f15">That's it! In just minutes, you've created a beautiful full hanging basket for your plants, herbs, tomatoes, even succulents or flowers! Betta Basket give you the freedom to choose which plants you'll use to create an amazing hanging garden! It is easy to hang with a four-piece galvanized steel chain which helps the basket hang evenly.</p>   
</div>
   <div class="how"><img src="//d10yufw89ry03z.cloudfront.net/images/how6.jpg" />
<p class="f15">Simply water your Betta Basket, and let the breakthrough design do its work! With constant airflow, a steady water supply, and access to nutrients, you''ll love how quickly <strong>your plants grow healthy, full, and vibrant!</strong></p>
</div>
<p class="f16 bold">Don't wait &ndash; get your Betta Basket now before this offer runs out!<br>
  <a href="#tryitnow" class="orange underline try">Get your Betta Basket for just $19.99 + S/H! </a></p>
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
