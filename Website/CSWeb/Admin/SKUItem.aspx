<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUItem.aspx.cs" Inherits="CSWeb.Admin.SKUItem"
    EnableViewState="true" MasterPageFile="AdminSite.master" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="HTMLEditor" %>

<%@ Register TagPrefix="uc" TagName="attributes" Src="UserControls/Attributes.ascx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Add New SkuItem</title>
    <script language="javascript" type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">

        function setVisibilityTaxPanel(control) {
            var panel = document.getElementById('<%= rbListTaxable.ClientID %>');
            if (panel.checked) {
                alert(panel.value);
            }
            for (var i = 0; i < panel.length; i++) {

                if (panel[i].checked) {

                    alert(radio[i].value);

                }

            }


            if (control.value == 'Yes') {
                panel.style.visibility = 'visible';
            }
            else {
                panel.style.visibility = 'hidden';
            }

        }
    </script>
    <br>
    <span class="header"><font color="blue">Create or Modify SkuItems</font> </span>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <%--    <asp:UpdatePanel ID="udpInnerUpdatePanel" runat="Server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <table cellspacing="1" cellpadding="2" width="100%" border="0">
        <tr>
            <td colspan="2" class="tblhdr">
                <asp:Label ID="lblheader" runat="server" CssClass="tblhdr">Add/Edit SKU</asp:Label>
            </td>
        </tr>
        <tr>
            <td width="15%" class="tblrowhdr" align="right">
                Title: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtTitle" runat="Server" Width="40%" MaxLength="500" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtTitle"
                    ID="valReqTitle" ValidationGroup="valError" ErrorMessage="* Title is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                SkuCode: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtSkuCode" runat="Server" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtSkuCode"
                    ID="valReqCode" ValidationGroup="valError" ErrorMessage="* SkuCode is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Category:
            </td>
            <td class="rowbody">
                <asp:DropDownList ID="ddlCategory" runat="Server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                OfferCode:
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtOfferCode" runat="Server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Full Price: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtfullprice" runat="Server" Width="5%" MaxLength="7" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtfullprice"
                    ID="Requiredfieldvalidator2" ValidationGroup="valError" ErrorMessage="* Full Price is required field.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtfullprice"
                    Type="Double" ErrorMessage="* Full Price must be an double." Operator="DataTypeCheck"
                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Initial Price: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtinitialprice" runat="Server" Width="5%" MaxLength="7" />
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtinitialprice"
                    ID="Requiredfieldvalidator1" ValidationGroup="valError" ErrorMessage="* Initial Price is required field.">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtinitialprice"
                    Type="Double" ErrorMessage="* Initial Price must be an double." Operator="DataTypeCheck"
                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Weight:
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtWeight" runat="Server" Width="5%" MaxLength="5" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Stock Quantity:
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtStock" runat="Server" Width="5%" MaxLength="7" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Availability:
            </td>
            <td class="rowbody">
                <asp:CheckBox ID="cbAvailable" runat="Server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr">
                Is Taxable:
            </td>
            <td class="rowbody">
                <asp:RadioButtonList ID="rbListTaxable" runat="server" OnSelectedIndexChanged="rbListTaxable_SelectedIndexChanged"
                    AutoPostBack="true" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>                 
        <asp:Panel ID="pnlTaxableAmount" runat="server" Visible="false">
            <tr>
                <td align="right" class="tblrowhdr">
                    Taxable Amount: <font color="red">*</font>
                </td>
                <td class="rowbody">
                    <asp:TextBox ID="txtTaxAmount" runat="Server" Width="5%" MaxLength="7" />
                    <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtTaxAmount"
                        ID="valReqAmount" ValidationGroup="valError" ErrorMessage="* Taxable Amount is required field.">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtTaxAmount"
                    Type="Double" ErrorMessage="* Taxable Amount must be an double." Operator="DataTypeCheck"
                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                </td>
            </tr>
        </asp:Panel>
         <tr>
            <td width="15%" class="tblrowhdr" align="right">
                ImagePath: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <asp:TextBox ID="txtImagePath" runat="Server" Width="40%" MaxLength="200" />
             </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Cart Description: <font color="red">*</font>
            </td>
            <td class="rowbody">
                <HTMLEditor:Editor ID="ftbShortDesc" runat="server" 
							Height="200px" 
							Width="500px"
							AutoFocus="true"
					/>
         
                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="ftbShortDesc"
                    ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Cart Description is required field.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Long Description:
            </td>
            <td class="rowbody">
                <HTMLEditor:Editor ID="ftbLongDesc" runat="server" 
							Height="200px" 
							Width="500px"
							AutoFocus="true"
					/>
           
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Email Description:
            </td>
            <td class="rowbody">
             <HTMLEditor:Editor ID="ftbEmailDesc" runat="server" 
							Height="200px" 
							Width="500px"
							AutoFocus="true"
					/>
     
            </td>
        </tr>

        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td align="right" class="tblrowhdr" valign="top">
                Attributes:
            </td>
            <td class="rowbody">
                <uc:attributes id="ucAttributes" runat="server" WidthTotal="500" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Image AlternateText="" runat="server" Width="100px" ID="blank1" Height="1px"
                    ImageUrl="../../images/1pt.gif"></asp:Image>
            </td>
            <td>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false"
                    OnCommand="btnAction_Command" />
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnAction_Command"
                    CausesValidation="true" ValidationGroup="valError" />
            </td>
        </tr>
                 
    </table>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <br />
    
</asp:Content>
