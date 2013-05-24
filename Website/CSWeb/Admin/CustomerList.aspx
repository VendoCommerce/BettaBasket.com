<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="CSWeb.Admin.CustomerList"
    MasterPageFile="AdminSite.master" %>

<%@ Register TagPrefix="usercontrols" TagName="paging" Src="../UserControls/PageControl.ascx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script language="javascript">

        function PrintpopUp(url, width, height) {

            var newWindow;
            newWindow = window.open(url, "Categories", "height=300,width=800,resizable=yes,status=no,scrollbars=yes,dependent=yes,toolbar=no,menubar=yes,location=no,left=0,top=0");
            newWindow.focus();

        }
           
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="600" cellpadding="2" cellspacing="1" border="0" class="ExampleA">
        <tr>
            <td class="text" width="150">
                First Name:
            </td>
            <td class="text" width="150">
                Last Name:
            </td>
            <td class="text" width="150">
                Email:
            </td>
        </tr>
        <tr class="FieldValue">
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnSearch" runat="server" CommandName="Search" Text="Search" OnClick="btnSearch_Command" />
            </td>
        </tr>
    </table>
    <br />
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
            <td align="right" colspan="3">
                <asp:HyperLink ID="hlprint" Text="Print" runat="Server" NavigateUrl="javascript:PrintpopUp('CustomerPrint.aspx?print=1', 550,500)">
                    <img title="Print" src='/Content/images/admin/icon_print.gif' alt="Print" border="0" />Print</asp:HyperLink>&#160;
                <asp:HyperLink ID="hlexport" Text="Export to Excel" runat="Server" NavigateUrl="javascript:PrintpopUp('CustomerPrint.aspx?print=2', 550,500)">
                <img title="Export to Excel" src='/Content/images/admin/icon_excel.gif' alt="Export to Excel" border="0" />Excel</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="6">
                <asp:UpdatePanel ID="updPg" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <usercontrols:paging ID="pg" OnPageChanged="OnPaging" Mode="Links" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr>
                    <td class="context-menu" colspan="3">
                        Customers
                    </td>
                </tr>
                <tr class="context-menu">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <tr>
        <td colspan="3">
            <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </td>
    </tr>
    </table>
</asp:Content>
