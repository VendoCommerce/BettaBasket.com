<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.UserControls.DateControl"
	EnableViewState="True" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:TextBox ID="textboxDate" runat="server" CssClass="text" MaxLength="10"
    Columns="12" autocomplete="off" Style="border: 1px solid #567890; width: 75px; float:left;" />
    &nbsp; <asp:Image runat="server" ID="calendericon" ToolTip="Calendar" ImageUrl="/Content/Images/admin/calendar.gif" />
<ajaxToolkit:CalendarExtender ID="calendarExtenderDate" runat="server" TargetControlID="textboxDate"
    PopupButtonID="textboxDate" />
<asp:RequiredFieldValidator runat="server" Enabled="false" ControlToValidate="textboxDate"
    ID="valRequired" ErrorMessage="* This field is required" EnableClientScript="true"
    Display="Dynamic" Text="*" />
<asp:CompareValidator runat="server" CssClass="error" ControlToValidate="textboxDate"
    Operator="DataTypeCheck" Display="Dynamic" Type="Date" ID="valValidDate" ErrorMessage="* Date is in an incorrect format"
	Text="*" EnableClientScript="true" />
<asp:CustomValidator CssClass="error" Text="*" runat="server" ID="rangeVal" Display="dynamic"
	OnServerValidate="rangeVal_Validate" />
<asp:RangeValidator CssClass="error" Text="*" ID="rangeValidatorMinMax" Type="Date"
	Display="dynamic" ControlToValidate="textboxDate" runat="server" EnableClientScript="true"/>
