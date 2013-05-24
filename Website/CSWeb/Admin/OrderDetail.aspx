<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="CSWeb.Admin.OrderDetail"
    MasterPageFile="AdminSite.master" EnableViewState="True" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc" TagName="attributes" Src="UserControls/Attributes.ascx" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .modalBackground
        {
            background-color: transparent;
            background-position: center;
            padding: 0;
        }
        .modalPopup
        {
            position: relative;            
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: #CCCCCC;
            padding: 1px;
            width: 720px;
            height: auto;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <span class="header"><font color="blue">Order Details</font> </span>
    <br />
    <br />
    <table width="200" border="0" cellspacing="0" cellpadding="0" id="Table3">
        <tr>
            <td style="width: 66px;">
                <strong>Version:</strong>
            </td>
            <td>
                <%= Version %>
            </td>
        </tr>
    </table>
    <br />
    <table width="683" border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
        <tr>
            <td colspan="4">
                <asp:LinkButton ID="lbEditOrder" runat="server" CssClass="link" Text="Edit Shipping/Billing Addresses"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <strong>Shipping Information:</strong>
            </td>
            <td colspan="2" valign="top">
                <strong>Billing Information:</strong>
            </td>
        </tr>
        <tr>
            <td width="132" valign="top">
                Name:
                <br />
                Address:
                <br />
                Address 2:
                <br />
                City:
                <br />
                State:
                <br />
                Zip Code:
                <br />
                Country:
                <br />
                Email Address:
            </td>
            <td width="198" valign="top">
                <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal><br />
            </td>
            <td width="132" valign="top">
                Name:
                <br />
                Address:
                <br />
                Address 2:
                <br />
                City:
                <br />
                State:
                <br />
                Zip Code:<br />
                Country:
            </td>
            <td width="221" valign="top">
                <asp:Literal ID="LiteralName_b" runat="server">
                </asp:Literal><br />
                <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <br />
    <table width="300" border="0" cellspacing="0" cellpadding="0" id="Table2">
        <tr>
            <td colspan="2">
                <strong>Payment Information</strong>
            </td>
        </tr>
        <tr>
            <td>
                Authorization Code
            </td>
            <td>
                <%= AuthorizationCode%>
            </td>
        </tr>
        <tr>
            <td>
                Transaction Code
            </td>
            <td>
                <%= TransactionCode%>
            </td>
        </tr>
        <tr>
            <td>
                Credit Card Name
            </td>
            <td>
                <%= CreditCardName%>
            </td>
        </tr>
        <tr>
            <td>
                Credit Card Number (Last 4)
            </td>
            <td>
                <%= CreditCardLast4 %>
            </td>
        </tr>
        <tr>
            <td>
                Credit Card CSC
            </td>
            <td>
                <%= CreditCardCSC %>
            </td>
        </tr>
        <tr>
            <td>
                Credit Card Expiration Date
            </td>
            <td>
                <%= CreditCardExpireDate %>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
        <tr>
            <td width="76%" valign="top" style="padding-bottom: 20px">
                <strong>Description</strong>
            </td>
            <td width="12%" valign="top">
                <strong>Quantity</strong>
            </td>
            <td width="12%" valign="top">
                <strong>Total</strong>
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <tr>
                    <td width="76%" valign="top" style="padding-bottom: 20px">
                        <%# DataBinder.Eval(Container.DataItem, "Title")%>
                        -
                        <%# DataBinder.Eval(Container.DataItem, "SkuId")%>
                    </td>
                    <td width="12%" valign="top">
                        <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                    </td>
                    <td width="12%" valign="top">
                        $<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "FullPrice"))%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td valign="top">
                &nbsp;
            </td>
            <td valign="top">
                <strong>Subtotal:</strong><br />
                <strong>S &amp; H:</strong>
                <br />
                <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                    <strong>Rush S &amp; H:</strong><br />
                </asp:Panel>
                <strong>Tax:</strong>
                <br />
                <strong>Total:</strong>
            </td>
            <td valign="top">
                $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                <asp:Panel ID="pnlRush" runat="server" Visible="false">
                    $<asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
                </asp:Panel>
                $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnAction_Command"
                    CommandName="Back" />
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeThePopup" TargetControlID="lbEditOrder"
        PopupControlID="pnlModalPopUpPanel" BackgroundCssClass="modalBackground" CancelControlID="btnCancelModalPopup"
        PopupDragHandleControlID="pnlModalPopUpPanel" DropShadow="true" />
    <asp:Panel ID="pnlModalPopUpPanel" runat="server" CssClass="modalPopup" Style='display: none;'>
        <asp:Literal ID="litHeader" Text="Edit Order Information" runat="server" />
        <table width="700" border="0" cellspacing="0" cellpadding="0" id="Table1" style="position: relative;
            float: left; left: 10px; top: 10px;">
            <tr>
                <td colspan="2" valign="top">
                    <strong>Shipping Information:</strong>
                </td>
                <td colspan="2" valign="top">
                    <strong>Billing Information:</strong>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="UpdateValidationGroup"
                        runat="server" CssClass="failureNotification" DisplayMode="List" ShowSummary="true"
                        HeaderText="Please correct the following fields and try again." />
                </td>
            </tr>
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingFirstName" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtShippingFirstName"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingFirstName" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtBillingFirstName"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingLastName" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtShippingLastName"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingLastName" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtBillingLastName"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingAddress" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtShippingAddress"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    Address:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingAddress" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtBillingAddress"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address 2:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingAddress2" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtShippingAddress2"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    Address 2:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingAddress2" MaxLength="100" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtBillingAddress2"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingCity" MaxLength="50" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtShippingCity"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingCity" MaxLength="50" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtBillingCity"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    State:
                </td>
                <td>
                    <asp:DropDownList ID="ddlShippingState" AutoPostBack="false" DataTextField="Name"
                        DataValueField="StateProvinceId" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ddlShippingState"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    State:
                </td>
                <td>
                    <asp:DropDownList ID="ddlBillingState" AutoPostBack="false" DataTextField="Name"
                        DataValueField="StateProvinceId" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ddlBillingState"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Zip Code:
                </td>
                <td>
                    <asp:TextBox ID="txtShippingZipCode" MaxLength="10" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="txtShippingZipCode"
                        runat="server" ValidationGroup="UpdateValidationGroup" Display="Dynamic" SetFocusOnError="true"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtShippingZipCode"
                        runat="server" OnServerValidate="ZipCode_ServerValidate" ValidationGroup="UpdateValidationGroup"
                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red">*</asp:CustomValidator>
                </td>
                <td>
                    Zip Code:
                </td>
                <td>
                    <asp:TextBox ID="txtBillingZipCode" MaxLength="10" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtBillingZipCode"
                        runat="server" ValidationGroup="UpdateValidationGroup" Display="Dynamic" SetFocusOnError="true"
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator3" ControlToValidate="txtBillingZipCode"
                        runat="server" OnServerValidate="ZipCode_ServerValidate" ValidationGroup="UpdateValidationGroup"
                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Country:
                </td>
                <td>
                    <asp:DropDownList ID="ddlShippingCountry" AutoPostBack="true" OnSelectedIndexChanged="ddlShippingCountry_SelectedIndexChanged"
                        runat="server" DataTextField="Name" DataValueField="CountryId" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="ddlShippingCountry"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    Country:
                </td>
                <td>
                    <asp:DropDownList ID="ddlBillingCountry" AutoPostBack="true" OnSelectedIndexChanged="ddlBillingCountry_SelectedIndexChanged"
                        runat="server" DataTextField="Name" DataValueField="CountryId" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="ddlBillingCountry"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" MaxLength="250" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtEmail"
                        runat="server" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="UpdateValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtEmail" runat="server"
                        OnServerValidate="txtEmail_ServerValidate" ValidationGroup="UpdateValidationGroup"
                        Display="Dynamic" SetFocusOnError="true" ForeColor="Red">*</asp:CustomValidator>
                </td>
                <td colspan="2">
                </td>
            </tr>

            <tr>
                <td valign="top">
                    Attributes:
                </td>
                <td colspan="3">
                    <uc:attributes ID="ucAttributes" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    &nbsp;
                    <br />
                    <asp:Button ID="btnCancelModalPopup" runat="server" Text="Cancel" CausesValidation="false" />&nbsp;
                    <asp:Button ID="btnSaveOrder" runat="server" Text="Save" OnClick="btnSaveOrder_Click"
                        ValidationGroup="UpdateValidationGroup" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
