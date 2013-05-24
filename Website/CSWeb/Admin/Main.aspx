<%@ Page Language="c#" CodeBehind="Main.aspx.cs" MasterPageFile="AdminSite.master"
    Inherits="CSWeb.Admin.Main" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Admin Page</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table cellpadding="2" cellspacing="1" border="0" width="100%">
        <tr>
            <asp:Panel ID="pnlHeader" runat="server" Visible="false">
                <td valign="bottom" class="ibn-sectionheader" width="25%">
                    <b>Catalog Management</b>
                </td>
                <td valign="bottom" class="ibn-sectionheader" width="25%">
                    <b>Customer Management</b>
                </td>
                <td valign="bottom" class="ibn-sectionheader" width="25%">
                    <b>Order Management</b>
                </td>
            </asp:Panel>
            <td valign="bottom" class="ibn-sectionheader" width="25%">
                <b>Report Management</b>
            </td>
        </tr>
        <tr>
            <asp:Panel ID="pnlBody" runat="server" Visible="false">
                <td>
                    <table>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="SitePrefItem.aspx">Site Preferences</a><br>
                                <span class="body">Preferences Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="VersionList.aspx">Version</a><br>
                                <span class="body">Version Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="categoryList.aspx">Category</a><br>
                                <span class="body">Category Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="SKUList.aspx">SKUs</a><br>
                                <span class="body">SKUs Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="Shipping.aspx">Site Shipping</a><br>
                                <span class="body">Site Shipping Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="CountryList.aspx">Country</a><br>
                                <span class="body">Country Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="TaxList.aspx">Tax</a><br>
                                <span class="body">Tax Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="PathList.aspx">Post Sale</a><br>
                                <span class="body">Post Sale Description
                                    <br>
                                </span>
                        </tr>
                         <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="CouponList.aspx">Coupons</a><br>
                                <span class="body">Coupon Description
                                    <br>
                                </span>
                        </tr>
                         <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="EmailList.aspx">Email Management</a><br>
                                <span class="body">Email Management Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="PaymentProviderList.aspx">Payment Provider</a><br>
                                <span class="body">Payment Provider Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="FulfillmentHouseProviderList.aspx">Fulfillment House</a><br>
                                <span class="body">Click here to check fulfillment house config.
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="ErrorLog.aspx">Error Log</a><br>
                                <span class="body">Error Log Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="ResourceList.aspx">Resource</a><br>
                                <span class="body">Resource Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="Attributes.aspx">Attributes Management</a><br>
                                <span class="body">Attributes Management
                                    <br>
                                </span>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="customerList.aspx">Customer</a><br>
                                <span class="body">Customer Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="users.aspx">Administrators</a><br>
                                <span class="body">Administrators Description
                                    <br>
                                </span>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="OrderList.aspx">Orders</a><br>
                                <span class="body">Orders Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="CustomFieldList.aspx">Custom Fields</a><br>
                                <span class="body">Custom Fields Description
                                    <br>
                                </span>
                        </tr>
                        <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="customerorders.aspx">CustomerOrders</a><br>
                                <span class="body">CustomerOrders Description
                                    <br>
                                </span>
                        </tr>
                          <tr>
                            <td valign="top" align="right" width="1%">
                                <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                            </td>
                            <td valign="top" width="100%" width="49%">
                                <a class="link" href="Reports.aspx">Client Custom Reports</a><br>
                                <span class="body">Client Custom Reports
                                    <br>
                                </span>
                        </tr>
                    </table>
                </td>
            </asp:Panel>
            <td valign="top">
                <table>
                    <tr>
                        <td valign="top" align="right" width="1%">
                            <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                        </td>
                        <td valign="top" width="100%" width="49%">
                            <a class="link" href="VersionReport.aspx">Version Report</a><br>
                            <span class="body">Version Report Description
                                <br>
                            </span>
                    </tr>
                    <tr>
                        <td valign="top" align="right" width="1%">
                            <img hspace="0" src="/Content/images/admin/rect.gif" vspace="2" border="0"><br>
                        </td>
                        <td valign="top" width="100%" width="49%">
                            <a class="link" href="Reports.aspx">Order Summary Report</a><br>
                            <span class="body">Order Summary Report Description
                                <br>
                            </span>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
