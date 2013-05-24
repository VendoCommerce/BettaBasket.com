<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryList.aspx.cs" Inherits="CSWeb.Admin.CountryList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define Country information</font> </span>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="lbItemAdd" runat="server" CssClass="link" NavigateUrl="Country.aspx"
                    Text="Add Country"></asp:HyperLink>
            </td>
        </tr>
    </table>
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
                Active
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Order
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlCountryList" RepeatLayout="Flow" RepeatDirection="Horizontal"
            OnItemDataBound="dlCountryList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="80%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:CheckBox ID="cbVisible" runat="server" AutoPostBack="false" />
                    </td>
                    <td width="5%" align="center">
                        <asp:TextBox runat="server" ID='txtOrderNo' MaxLength="2" Width="50%"></asp:TextBox>
                        <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtOrderNo"
                            Type="Integer" ErrorMessage="* order number must be an integer." Operator="DataTypeCheck"
                            ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                    <td nowrap align="center" width="10%">
                        <asp:HyperLink ID="hlAddState" runat="Server"><img title='Add States' src='/Content/images/admin/edit.gif' alt="Add States" border="0"></asp:HyperLink>&#160;
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td colspan="4">
                <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnSave_OnClick" CommandName="Back" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Save" ID="imgSave" OnCommand="btnSave_OnClick"
                    CommandName="Save" runat="server" ValidationGroup="valError" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
