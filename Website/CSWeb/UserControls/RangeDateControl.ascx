<%@ Control Language="C#" AutoEventWireup="true" 
    Inherits="CSWeb.Root.UserControls.RangeDateControl" EnableViewState="True"%>
<%@ Register TagPrefix="usercontrols" TagName="DateControl" Src="DateControl.ascx" %>

<asp:PlaceHolder ID="placeHolderDropDown" runat="server">
    <asp:DropDownList ID="dropDownListDate" runat="server" CssClass="day_range">
    </asp:DropDownList>&nbsp;&nbsp;<asp:Label ID="labelDropDownSelectionSuffix" runat="server"></asp:Label>
<p class="or">OR:</p>
</asp:PlaceHolder>
<p><asp:Label ID="labelStart" runat="Server" /></p>
<usercontrols:datecontrol id="dateControlStart" runat="server" DisplayCalenderImage="true" />
<div class="clear"></div>
<p>&nbsp;</p>
<p><asp:Label ID="labelEnd" runat="Server" /></p>
<usercontrols:datecontrol id="dateControlEnd" runat="server" DisplayCalenderImage="true" />
<asp:CompareValidator ID="compareValidatorDateFields" runat="server" ControlToValidate="dateControlEnd"
    ControlToCompare="dateControlStart" Operator="GreaterThanEqual" Type="Date" ErrorMessage="* To date must be a greater than from date."
    Display="Dynamic">*</asp:CompareValidator>