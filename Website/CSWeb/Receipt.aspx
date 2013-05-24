<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="CSWeb.Receipt" EnableSessionState="True" MasterPageFile="~/Site.Master" %>

<%@ Register Src="UserControls/CheckoutThankYouModule.ascx" TagName="Form"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Airocide - Revolutionary Air Purification Technology - Receipt</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
        
    <uc1:Form ID="Form1" runat="server" />
    
</asp:Content>