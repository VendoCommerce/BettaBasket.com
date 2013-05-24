<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="CSWeb.Admin.OrderList"
    MasterPageFile="AdminSite.master" EnableViewState="True" %>

<%@ Register TagPrefix="usercontrols" TagName="RangeDateControl" Src="../usercontrols/RangeDateControlV1.ascx" %>
<%@ Register TagPrefix="usercontrols" TagName="paging" Src="../UserControls/PageControl.ascx" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ValidationSummary ID="valSummary" runat="server" DisplayMode="List" Width="450"
        font-name="verdana, san-serif" Font-Size="7" CssClass="error"></asp:ValidationSummary>
    <table width="100%" cellpadding="2" cellspacing="1" border="0" class="ExampleA">
        <tr>
            <td class="text" width="40%">
                <usercontrols:RangeDateControl ID="rangeDateControlCriteria" LabelStyle="FieldName"
                    runat="server" DisplayDropDown="true" StartDateWidth="115" EndDateWidth="115"
                    LabelStartText="From:" LabelEndText="To:" />
                    <br />
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
    </table>
            </td>
            <td width="15%"><asp:CheckBox AutoPostBack="false" ID="cbArchive" runat="server" Text="IncludeArchiveData" /></td>
            <td>
                <asp:Button ID="lblSearch" runat="server" CommandName="Search" Text="Search" OnClick="lblOrder_Search" />
            </td>
        </tr>
    </table>
    <br />
    <div align="right">
        <asp:Literal ID="FCLiteral" runat="server"></asp:Literal>
        <br />
    </div>
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
            <td>
                <asp:CheckBox ID="CbInCludeFullAmount" runat="server" Text="Include FullAmount" AutoPostBack="True"
                    OnCheckedChanged="CbInCludeFullAmount_CheckedChanged" />
            </td>
            <td align="right" colspan="5">
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
                        Orders
                    </td>
                </tr>
                <tr class="context-menu">
                    <td align="left" class="ibn-sectionheader">
                        OrderId
                    </td>
                    <td align="left" class="ibn-sectionheader">
                        Email
                    </td>
                    <td align="center" class="ibn-sectionheader">
                        OrderDate
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        <asp:Label ID="lblHeader" runat="server" Text="Sub Total" />
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        Shipping Amount
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        Tax Amount
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        Total Amount
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        First Name
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        Last Name
                    </td>
                    <td>
                        Delete
                    </td>
                     
                </tr>
                <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal"
                    OnItemDataBound="dlOrderList_ItemDataBound" OnItemCommand="dlOrderList_ItemCommand">
                    <ItemTemplate>
                        <tr><td>
                        <asp:HyperLink ID="hlDetail" runat="server" ToolTip="Click here to view order details"> <%# DataBinder.Eval(Container.DataItem, "OrderId")%></asp:HyperLink>
                        </td>
                            <td class="body" align="left">
                                <%# DataBinder.Eval(Container.DataItem, "Email")%>
                            </td>
                            <td width="20%" align="center">
                                <%# DataBinder.Eval(Container.DataItem, "CreatedDate")%>
                            </td>
                            <td width="10%" align="center">
                                <asp:Label ID="lblSubTotal" runat="server" />
                            </td>
                            <td width="10%" align="center">
                                $<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "ShippingCost"))%></td>
                            <td width="10%" align="center">
                                $<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Tax"))%></td>
                            <td width="10%" align="center">
                                <asp:Label ID="lblTotal" runat="server" />
                            </td>
                            <td width="10%" align="center">
                                <%# DataBinder.Eval(Container.DataItem, "customerInfo.FirstName")%>
                            </td>
                            <td width="10%" align="center">
                                <%# DataBinder.Eval(Container.DataItem, "customerInfo.LastName")%>
                            </td>
                          <td>
                    <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure your want to delete this order?')"
                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "OrderId") %>'>
                        <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                            ToolTip='Delete' /></asp:LinkButton>
                </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
