<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaxList.aspx.cs" Inherits="CSWeb.Admin.TaxList"
    MasterPageFile="AdminSite.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Country Page</title>
    <script type="text/javascript" language="javascript">
        function isNumberKey(evt) {

            var key = window.event ? evt.keyCode : evt.which;
            if (key > 31 && (key < 48 || key > 57))
                return false;
            return true;
        }
    </script>
    <style type="text/css">
        .numericText
        {
            text-align: right;
            width: 30px;
        }
        .modalBackground
        {
            background-color: transparent;
            background-position: center;
            padding: 0;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 1px;
            border-style: solid;
            border-color: #CCCCCC;
            padding: 1px;
            width: 300px;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <span class="header"><font color="blue">Conversion System utilizes a hierachical tax
        rate system. You can configure tax rates at any level of the hierarchy.<br />
        <b>Country<br>
            &nbsp;&nbsp;&nbsp;&nbsp;State<br>
            <br></font></span>
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" Text="Add Country"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UPCountryList" runat="Server" UpdateMode="Always">
        <ContentTemplate>
            <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
                <tr>
                    <td class="title" colspan="3">
                        Country
                    </td>
                </tr>
                <tr class="header">
                    <td align="left" width="80%" class="ibn-sectionheader">
                        Title
                    </td>
                    <td align="center" width="5%" class="ibn-sectionheader">
                        Tax
                    </td>
                    <td align="center" width="10%" class="ibn-sectionheader">
                        Options
                    </td>
                </tr>
                <asp:DataList runat="server" ID="dlCountryList" RepeatLayout="Flow" RepeatDirection="Horizontal"
                    OnItemDataBound="dlCountryList_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td  align="left" width="80%">
                                <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                            </td>
                            <td width="5%" align="center">
                                <asp:TextBox runat="server" ID='txtOrderNo' MaxLength="5" CssClass="numericText"></asp:TextBox>%
                                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtOrderNo"
                                    ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Tax percentage is required field.">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtOrderNo"
                                    Type="Double" ErrorMessage="* Tax percentage must be Double format." Operator="GreaterThanEqual"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                            </td>
                            <td nowrap align="center" width="10%">
                                <asp:HyperLink ID="hlAddState" runat="Server"><img title='Add States' src='../Content/images/edit.gif' alt="Add States" border="0"></asp:HyperLink>&#160;
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <ajaxToolkit:ModalPopupExtender runat="server" ID="mpeThePopup" TargetControlID="lbItemAdd"
        PopupControlID="pnlModalPopUpPanel" BackgroundCssClass="modalBackground" CancelControlID="btnCancelModalPopup"
        PopupDragHandleControlID="pnlModalPopUpPanel" DropShadow="true" />
    <!-- Panel ID should match with ModalPopupExtender PopupControlID and Dummy Button should match with TargetControlID -->
	<asp:Panel ID="pnlModalPopUpPanel" runat="server" CssClass="modalPopup" Style='display: none;'>
                <asp:Literal ID="litHeader" Text="Add Country Tax" runat="server" />
		<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification"
			ValidationGroup="valErrorPopup" DisplayMode="List" />
                <table>
                    <tr>
                        <td>
                            Country:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="false">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tax:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPercentage" runat="server" CausesValidation="true" Width="30%"
                                MaxLength="5" />%
					<asp:RequiredFieldValidator ID="reqValPercentage" runat="server" ControlToValidate="txtPercentage"
						ErrorMessage="Percentage is required" ValidationGroup="valErrorPopup" CssClass="failureNotification">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtPercentage"
                                Type="Double" ErrorMessage="Percentage must be Double format" Operator="GreaterThanEqual"
						ValidationGroup="valErrorPopup" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
					<asp:Button ID="btnCancelModalPopup" runat="server" Text="Cancel" CausesValidation="false" />&nbsp;
					<asp:Button ID="btnChooseProduct" runat="server" Text="Save" OnClick="btnAdd_Country"
						ValidationGroup="valErrorPopup" />
                        </td>
                    </tr>
                </table>
                <br />
     </asp:Panel>
    <br />
    <br />
    <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnSave_OnClick" CommandName="Back" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button Text="Save" ID="imgSave" OnCommand="btnSave_OnClick" CommandName="Save"
        CausesValidation ="True" runat="server" ValidationGroup="valError" />
    </table>
    <br />
</asp:Content>
