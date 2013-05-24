<%@Control Language="C#" AutoEventWireup="true" CodeBehind="SiteCatalystPixel.ascx.cs" Inherits="CSWeb.Canada.CA_A1.UserControls.SiteCatalystPixel" %>
<!-- All Pixels Here -->
<%--
<!-- SiteCatalyst code version: H.25.2.
Copyright 1996-2012 Adobe, Inc. All Rights Reserved
More info available at http://www.omniture.com -->
<script language="JavaScript" type="text/javascript" src="/Scripts/s_code.js"></script>
<script language="JavaScript" type="text/javascript">
<!--        /* You may give each page an identifying name, server, and channel on the next lines. */
        s.pageName = "<%=GetVersionName()%> - <%=GetPageName(HttpContext.Current)%>"
        s.server = ""
        s.channel = ""
        s.pageType = ""
        s.prop1 = ""
        s.prop2 = ""
        s.prop3 = ""
        s.prop4 = ""
        s.prop5 = ""
        /* Conversion Variables */
        s.campaign = ""
        s.state = "<%= State %>"
        s.zip = "<%= Zip %>"
        s.events = "<%=GetEvents(HttpContext.Current)%>"
        s.products = "<%=GetProductsDetails(HttpContext.Current)%>"
        s.purchaseID = "<%=GetPurchaseID(HttpContext.Current) %>"
        s.eVar1 = "<%= GetVersionId() %>"

        var dbgCSVersion = 1;

        if (typeof (s.eVar2) == 'undefined' || typeof (s.eVar3) == 'undefined' || typeof (cs) == 'undefined' || typeof (cs.getCompleteVersionId) == 'undefined')
            s.eVar4 = "<%= GetVersionName() %>";
        else
            s.eVar4 = cs.getCompleteVersionId("<%= GetVersionName() %>", s.eVar2, s.eVar3);

/************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
        var s_code = s.t(); if (s_code) document.write(s_code)//-->
</script>
<script language="JavaScript" type="text/javascript"><!--
    if (navigator.appVersion.indexOf('MSIE') >= 0) document.write(unescape('%3C') + '\!-' + '-')
//--></script><noscript><img src="https://conversionsystems1.112.2o7.net/b/ss/convairocide.com/1/H.25.3--NS/0"
height="1" width="1" border="0" alt="" /></noscript><!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.25.3. -->--%>