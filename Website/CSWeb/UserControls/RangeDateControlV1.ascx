<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.UserControls.RangeDateControl" EnableViewState="True"%>

<%@ Register TagPrefix="usercontrols" TagName="DateControl" Src="DateControl.ascx" %>

    <table width="600" cellpadding="2" cellspacing="1" border="0" class="ExampleA">
        <tr>
            <td class="text" width="150">
                <asp:Label ID="labelStart" runat="Server" />
            </td>
            <td class="text" width="150">
                <asp:Label ID="labelEnd" runat="Server" />
            </td>
            <td class="text" width="150">
                
            </td>
        </tr>
        <tr class="FieldValue">
            <td>
                <usercontrols:datecontrol id="dateControlStart" runat="server" />            
            </td>
            <td>
                <usercontrols:datecontrol id="dateControlEnd" runat="server" />
                <asp:CompareValidator ID="compareValidatorDateFields" runat="server" ControlToValidate="dateControlEnd"
                    ControlToCompare="dateControlStart" Operator="GreaterThanEqual" Type="Date" ErrorMessage="* To date must be a greater than from date."
                    Display="Dynamic">*</asp:CompareValidator>
            </td>
            <td>
                <asp:PlaceHolder ID="placeHolderDropDown" runat="server">
                    <asp:DropDownList ID="dropDownListDate" runat="server" CssClass="FieldValue">
                    </asp:DropDownList>&nbsp;&nbsp;<asp:Label ID="labelDropDownSelectionSuffix" runat="server"></asp:Label>
                </asp:PlaceHolder>            
            </td>
        </tr>
    </table>







