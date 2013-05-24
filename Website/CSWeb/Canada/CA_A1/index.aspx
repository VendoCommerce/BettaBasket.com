<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Canada.CA_A1.Root.Store.index" EnableSessionState="True" %>
<%@ Register TagPrefix="uc" TagName="ShippingForm" Src="~/UserControls/ShippingForm.ascx" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OFFICIAL Plug & Safe Home Security - Plug-in Home Safety Device</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="Plug and Safe Home Security is the latest technology to protect your home from burglers and intruders. ">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link href="/Styles/plugnsafeglobal.css" rel="stylesheet" type="text/css" media="all" />
<!-- add popup plugin -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
$(document).ready(function() {
			$('.fancybox').fancybox();
		});

</script>



</head>
<body>
<form runat="server">
<div id="Container">
	<uc:ShippingForm RedirectUrl="AddProduct.aspx" runat="server" />
</div>

</form>
<uc:TrackingPixels runat="server" />
</body>
</html>
