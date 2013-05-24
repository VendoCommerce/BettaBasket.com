<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackingPixels.ascx.cs" Inherits="CSWeb.UserControls.TrackingPixels" %>
<%@ Register Src="SiteCatalystPixel.ascx" TagName="SiteCatalystPixel" TagPrefix="uc" %>

<!-- All Pixels Here -->
<asp:Panel ID="pnlHomePage" runat="server" Visible="false"></asp:Panel>
<asp:Panel ID="pnlReceiptPage" runat="server" Visible="false">

<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
    var pageTracker = _gat._getTracker('UA-39958787-1');
    pageTracker._trackPageview();
    
    <asp:Literal ID="litGAReceiptPixel" runat="server" />

    pageTracker._trackTrans();
</script>

</asp:Panel>
<asp:Panel ID="pnlContactPage" runat="server" Visible="false">


</asp:Panel>
<asp:Panel ID="PnlOrderNowPage" runat="server" Visible="false">

</asp:Panel>
<asp:Panel ID="PnlCartPage" runat="server" Visible="false">
</asp:Panel>

<script type="text/javascript">
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-308725-23', 'bettabasket.com');
    ga('send', 'pageview');

</script>

<!-- www.hitslink.com/ web tools statistics hit counter code -->
<script type="text/javascript" id="wa_u"></script>
<script type="text/javascript">//<![CDATA[
    // Begin Variable Declarations
    wa_account = "9D9A8B8B9E9D9E8C949A8B"; wa_location = 1;
    wa_pageName = location.pathname;  // you can customize the page name here
    wa_MultivariateKey = '<%= GetVersionName() %>';    //  Set this variable to perform multivariate testing
    // End Variable Declarations
    document.cookie = '__support_check=1;path=/'; wa_hp = 'http';
    wa_rf = document.referrer; wa_sr = window.location.search;
    wa_tz = new Date(); if (location.href.substr(0, 6).toLowerCase() == 'https:')
        wa_hp = 'https'; wa_data = '&an=' + escape(navigator.appName) +
'&sr=' + escape(wa_sr) + '&ck=' + document.cookie.length +
'&rf=' + escape(wa_rf) + '&sl=' + escape(navigator.systemLanguage) +
'&av=' + escape(navigator.appVersion) + '&l=' + escape(navigator.language) +
'&pf=' + escape(navigator.platform) + '&pg=' + escape(wa_pageName);
    wa_data = wa_data + '&cd=' +
screen.colorDepth + '&rs=' + escape(screen.width + ' x ' + screen.height) +
'&tz=' + wa_tz.getTimezoneOffset() + '&je=' + navigator.javaEnabled();
    wa_img = new Image(); wa_img.src = wa_hp + '://counter.hitslink.com/statistics.asp' +
'?v=1&s=' + wa_location + '&eacct=' + wa_account + wa_data + '&tks=' + wa_tz.getTime() + '&mvk=' + wa_MultivariateKey;
    document.cookie = '__support_check=1;path=/;expires=Thu, 01-Jan-1970 00:00:01 GMT';
    document.getElementById('wa_u').src = wa_hp + '://counter.hitslink.com/track.js';
 //]]>
</script>
<!-- End www.hitslink.com/ statistics web tools hit counter code -->

<uc:SiteCatalystPixel ID="Pixel_SiteCatalyst" runat="server" Visible="false" />
