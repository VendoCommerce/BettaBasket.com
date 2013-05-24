<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPrint.aspx.cs" Inherits="CSWeb.Admin.CustomerPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
  
        <tr>
            <td class="title" colspan="3">
                Customers
            </td>
        </tr>
         <tr class="header">
            <td align="left" width="40%" class="ibn-sectionheader">
                Name
            </td>
            <td align="center" width="30%" class="ibn-sectionheader">
                Email
            </td>
            <td align="center" width="30%" class="ibn-sectionheader">
                Date Created
            </td>

        </tr>
 
    <asp:DataList runat="server" ID="dlCustomerList" RepeatLayout="Flow" RepeatDirection="Horizontal">
           <ItemTemplate>
            <tr>
                <td class="body" align="left" width="40%">
                    <%# DataBinder.Eval(Container.DataItem, "FullName") %>
                </td>
                <td width="35%" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "Email") %>
                </td>
                <td width="25%" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "RegistrationDate") %>
                </td>
            </tr>
        </ItemTemplate>
    </asp:DataList>
    </table>
    <br />
    </form>
</body>
</html>
