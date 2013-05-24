<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Country.aspx.cs" Inherits="CSWeb.Admin.Country"
    MasterPageFile="AdminSite.master" EnableSessionState="True" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Country Page</title>
    <style type="text/css">
        .modalBackground
        {
            background-color: #333333;
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
      <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="ddlProducts"
                    ID="valReqTitle" ValidationGroup="valError" ErrorMessage="* Country is required field.">*</asp:RequiredFieldValidator>
    <asp:DropDownList ID="ddlProducts" runat="server">
    </asp:DropDownList>
    <asp:Button ID="btnAddCountry" runat="server" Text="Add Country" OnClick="btn_AddCountry" CausesValidation="true" ValidationGroup="valError" />
    <asp:Repeater ID="rptItems" runat="server" OnItemCommand="dlrepeater_ItemCommand">
        <HeaderTemplate>
            <table width="100%" cellpadding="0" cellspacing="0" id="tblOptions" style='margin-bottom: 20px;'>
                <tr>
                    <th align="left" runat="server" id="holderOrderHeader" width="5%">
                        Option
                    </th>
                    <th align="left">
                        Name
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Delete"
                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "CountryId") %>'>
                        <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                            ToolTip='Delete' /></asp:LinkButton>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Name") %>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
    <br />
    <br />
    <table>
        <tr>
            <td>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" OnCommand="btnSave_Command" CausesValidation="false" ValidationGroup="valError"/>
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnSave_Command" />
            </td>
        </tr>
    </table>
</asp:Content>
