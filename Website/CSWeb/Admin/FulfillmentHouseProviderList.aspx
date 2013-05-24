<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FulfillmentHouseProviderList.aspx.cs"
    Inherits="CSWeb.Admin.FulfillmentHouseProviderList" MasterPageFile="AdminSite.master"
    EnableViewState="true" %>

<%@ Register TagPrefix="Cs" Namespace="CSCore.Common" Assembly="CSCore" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define PaymentProvider</font> </span>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" OnCommand="btnAction_Command"
                    CommandName="AddNew" Text="Add Provider"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                ProviderList
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="left" width="20%" class="ibn-sectionheader">
                Title
            </td>
            <td align="center" width="50%" class="ibn-sectionheader">
                Configuration
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Default
            </td>
            <td align="center" width="15%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlProviderList" RepeatLayout="Flow" RepeatDirection="Horizontal"
            OnItemCommand="dlProviderList_ItemCommand"  OnItemDataBound="dlProviderList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td width="5%" align="left" valign="top">
                        <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Active") %>' />
                    </td>
                    <td class="body" align="left" width="20%" valign="top">
                        <%# DataBinder.Eval(Container.DataItem, "Title") %>
                    </td>
                    <td class="body" align="center" width="50%" valign="top">
                        <asp:TextBox ID="txtConfig" runat="server" TextMode="MultiLine" Columns="50" Rows="5"
                            ReadOnly="true" Text='<%#  DataBinder.Eval(Container.DataItem, "ProviderXML")%>' />
                    </td>
                    <td class="body" align="center" width="10%" valign="top">
                        <Cs:GroupRadioButton ID="rbAlign" runat="server" GroupName="Alignment" onclick='selectRow(this);' />
                    </td>
                    <td nowrap align="center" width="15%" valign="top">
                        <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure your want to delete this fulfillment house?')">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td width="5%" align="left" valign="top">
                        &nbsp;
                    </td>
                    <td class="body" align="left" width="20%" valign="top">
                        <asp:TextBox ID="txtEditTitle" runat="server" MaxLength="100" Width="50%" Text='<%#DataBinder.Eval(Container.DataItem,"Title")%>' />
                        <asp:RequiredFieldValidator ID="valEditName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                            ControlToValidate="txtEditTitle">*</asp:RequiredFieldValidator>
               
                    </td>
                    <td class="body" align="center" width="50%" valign="top">
                        <asp:TextBox ID="txtEditConfig" runat="server" TextMode="MultiLine" Columns="50"
                            Rows="5" Text='<%#  DataBinder.Eval(Container.DataItem, "ProviderXML")%>' />
                             <asp:RequiredFieldValidator ID="rfvEditConfig" runat="server" Display="Dynamic"
                        ErrorMessage="Configutation is required field" ControlToValidate="txtEditConfig">*</asp:RequiredFieldValidator>
                    </td>
                    <td width="10%" align="left" valign="top">
                        &nbsp;
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Update">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                                ToolTip='Save' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel">
                            <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                                ToolTip='Cancel' /></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
        </asp:DataList>
        <asp:PlaceHolder ID="pnlAddCategory" runat="server" Visible="False">
            <tr class="searchlegend">
                <td width="5%" align="left" valign="top">
                    &#160;
                </td>
                <td class="body" align="left" width="20%" valign="top">
                    <asp:RequiredFieldValidator ID="valAddName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                        ControlToValidate="txtTitle">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="100" CssClass="body" />&#160;&#160;
                </td>
                <td class="body" align="center" width="50%" valign="top">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="Configutation is required field" ControlToValidate="txtConfig">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtConfig" runat="server" TextMode="MultiLine" Columns="50" Rows="5" />
                </td>
                <td>
                    &#160;
                </td>
                <td nowrap align="center" width="10%">
                    <asp:LinkButton ID="lbSave" runat="server" CommandName="Add" OnCommand="btnAction_Command"
                        CausesValidation="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                            ToolTip='Save' /></asp:LinkButton>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" OnCommand="btnAction_Command"
                        CausesValidation="False">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif" BorderWidth="0"
                            ToolTip='Cancel' /></asp:LinkButton>
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr>
            <td colspan="5">
                <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnSave_OnClick" CommandName="Back" />
                <asp:Button Text="Save" ID="imgSave" OnCommand="btnSave_OnClick" CommandName="Save"
                    runat="server" ValidationGroup="valError" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
