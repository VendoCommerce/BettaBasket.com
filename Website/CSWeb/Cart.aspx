<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CSWeb.Cart" EnableSessionState="True" %>
<%@ Register TagPrefix="uc" TagName="BillingCreditForm" Src="~/UserControls/BillingCreditForm.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <uc:BillingCreditForm runat="server" />

    </div>
    </form>
</body>
</html>
