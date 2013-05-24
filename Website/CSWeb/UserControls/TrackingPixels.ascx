<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrackingPixels.ascx.cs" Inherits="CSWeb.UserControls.TrackingPixels" %>
<%@ Register Src="SiteCatalystPixel.ascx" TagName="SiteCatalystPixel" TagPrefix="uc" %>

<!-- All Pixels Here -->
<asp:Panel ID="pnlHomePage" runat="server" Visible="false"></asp:Panel>
<asp:Panel ID="pnlReceiptPage" runat="server" Visible="false">


</asp:Panel>
<asp:Panel ID="pnlContactPage" runat="server" Visible="false">


</asp:Panel>
<asp:Panel ID="PnlOrderNowPage" runat="server" Visible="false">

</asp:Panel>
<asp:Panel ID="PnlCartPage" runat="server" Visible="false">
</asp:Panel>
<asp:Panel ID="Pixel_GA" runat="server" Visible="false">
</asp:Panel>

<asp:Panel ID="Pixel_GA_Tracker" runat="server" Visible="false">


</asp:Panel>

<asp:Panel ID="Pixel_HitsLink" runat="server" Visible="false">

</asp:Panel>
<uc:SiteCatalystPixel ID="Pixel_SiteCatalyst" runat="server" Visible="false" />
