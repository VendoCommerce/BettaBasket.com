<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptFriendly.aspx.cs" Inherits="CSWeb.ReceiptFriendly" EnableSessionState="True" MasterPageFile="~/Site_PrintReceipt.Master" %>

<%@ Register Src="UserControls/CheckoutThankYouPrint.ascx" TagName="Form"
    TagPrefix="uc1" %>
    <%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Airocide</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:Form ID="Form1" runat="server" />

    <uc:TrackingPixels runat="server" />
</asp:Content>