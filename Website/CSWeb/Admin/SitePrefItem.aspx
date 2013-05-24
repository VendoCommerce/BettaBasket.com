<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SitePrefItem.aspx.cs" Inherits="CSWeb.Admin.SitePrefItem"
    MasterPageFile="AdminSite.master" %>

<%@ Register TagPrefix="usercontrols" TagName="DateControl" Src="../usercontrols/DateControl.ascx" %>
<%@ Register TagPrefix="uc" TagName="attributes" Src="UserControls/Attributes.ascx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Definte Site Preferences</title>
    <script language="javascript" type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <span class="header"><font color="blue">Definte Site Preferences</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link" NavigateUrl="Shipping.aspx"
                    Text="View Shipping"></asp:HyperLink>&nbsp;&nbsp;
                <asp:Image AlternateText="Add" ID="Image4" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="CountryList.aspx"
                    Text="View CountryList"></asp:HyperLink>&nbsp;&nbsp;
                <asp:Image AlternateText="Add" ID="Image1" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="link" NavigateUrl="TaxList.aspx"
                    Text="View TaxList"></asp:HyperLink>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td colspan="2" class="tblhdr">
                <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Options</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Site Name:
            </td>
            <td>
                <asp:TextBox ID="txtSiteName" runat="server" Width="60%" Text="Default."  MaxLength="200"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Site Url:
            </td>
            <td>
                <asp:TextBox ID="txtSiteUrl" runat="server" Width="60%" Text="Default."  MaxLength="200"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Site Description:
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="60%" Text="Default."  MaxLength="200"/>
            </td>
        </tr>
        <tr>
            <td width="15%" class="tblrowhdr" align="right">
                Site Logo: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtImagePath" runat="Server" Width="40%" MaxLength="200" />
             </td>
        </tr>

        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                OrderProcess Option:
            </td>
            <td>
                 <asp:DropDownList runat="server" ID="ddlOrderProcessList" runat="server" />
        
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Shipping Option:
            </td>
            <td>
                <asp:CheckBox ID="CbShippingOption" runat="server" AutoPostBack="false" Text="Include shippingcost in tax calculation." />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                GeoTargeting Option:
            </td>
            <td>
                <asp:CheckBox ID="cbGeoTarget" runat="server" AutoPostBack="false" Text="Turn on GeoTargeting Service."
                     />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Payment Gateway:
            </td>
            <td>
                <asp:CheckBox ID="cbPaymentGateway" runat="server" AutoPostBack="false" Text="Turn on Payment Gateway Service."
                     />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Fulfillment House:
            </td>
            <td>
                <asp:CheckBox ID="cbFulfillmentHouse" runat="server" AutoPostBack="false" Text="Turn on Payment Fulfillment House Service."
                     />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                PathOrderCalculationDate:
            </td>
            <td>
                <usercontrols:DateControl ID="dateControlStart" runat="server" IsRequired="true"
                    ErrorMessage="Please Enter a valid date" ValidationEnabled="true" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                ArchiveData:
            </td>
            <td>
                <asp:TextBox ID="txtDays" runat="Server" Width="10%" MaxLength="3" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtDays"
                    ID="Requiredfieldvalidator1" ValidationGroup="valError" ErrorMessage="* ArChiveData is required field.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtDays"
                    Type="integer" ErrorMessage="* ArChiveData must be an interger." Operator="DataTypeCheck"
                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
             <td align="right" class="tblrowhdr" valign="top">
                Attributes:
            </td>
            <td>
                <uc:attributes ID="ucAttributes" runat="server" />
            </td>
        </tr>

        <tr runat="server" visible="false">
            <td align="right" class="tblrowhdr" valign="top">
                Currency:
            </td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="tblCurrency" runat="server" Width="30%" MaxLength="2" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &#160;
            </td>
        <tr>
            <td>
                &#160;
            </td>
            <td>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                    OnCommand="btnAction_Command" TabIndex="10" />
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnAction_Command"
                    CausesValidation="true" TabIndex="11" />
            </td>
        </tr>
    </table>
</asp:Content>
