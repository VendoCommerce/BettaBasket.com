<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PathList.aspx.cs" Inherits="CSWeb.Admin.PathList"
    MasterPageFile="AdminSite.master" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define Path information</font> </span>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
            <asp:CustomValidator ID="cvTemplateStep" runat="server" ValidationGroup="valError"
        ErrorMessage='* Please make sure that the total of all Weight fields is 100%' >&nbsp;</asp:CustomValidator>
        <p>
        <ul>
        <li>This page list's all the active upsell paths for all version.</li>
        <li>You can only update the weight(%) for selected version.</li>
        <li>If an upsell A/B test needs to be conducted, select the version and enter the weight for each path and hit save.</li>
        </ul>
        </p>
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="lbItemAdd" runat="server" CssClass="link" NavigateUrl="PathItem.aspx"
                    Text="Add Path"></asp:HyperLink>&nbsp;&nbsp;

                     <asp:Image AlternateText="Add" ID="Image3" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="TemplateList.aspx"
                    Text="View Templates"></asp:HyperLink>&nbsp;&nbsp;

                    <asp:Image AlternateText="Add" ID="Image4" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>Select Version:                 
                 
                 &nbsp;&nbsp;<asp:DropDownList ID="ddlVersion" runat="server" AutoPostBack="true"
                    onselectedindexchanged="ddlVersion_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
   
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                PathList
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="10%" class="ibn-sectionheader">
                Active
            </td>
            <td align="left" width="30%" class="ibn-sectionheader">
                Title
            </td>
            <td align="center" width="20%" class="ibn-sectionheader">
                Weight
            </td>
            <td align="center" width="30%" class="ibn-sectionheader">
                CreateDate
            </td>
            <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlPathList" RepeatLayout="Flow" RepeatDirection="Horizontal"
            OnItemCommand="dlPathList_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td width="10%" align="left" >
                        <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Active") %>' />
                    </td>
                    <td class="body" align="left" width="30%">
                        <%# DataBinder.Eval(Container.DataItem, "Title") %>
                    </td>
                    <td class="body" align="center" width="20%">
                        <asp:TextBox ID="txtWeight" runat="server" Width="30%" MaxLength="4" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Weight")) %>' />
                    <asp:CompareValidator ID="cmpValorderNo" runat="server" ControlToValidate="txtWeight"
                                    Type="Double" ErrorMessage="* Weight number must be an double." Operator="DataTypeCheck"
                                    ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                    <td class="body" align="center" width="30%">
                        <%# DataBinder.Eval(Container.DataItem, "CreateDate")%>
                    </td>
                    <td nowrap align="center" width="20%">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure your want to delete this Path?')">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td colspan="5">
                <asp:Button ID="imgBack" Text="Back" runat="server" OnCommand="btnSave_OnClick" CommandName="Back" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Save" ID="imgSave" OnCommand="btnSave_OnClick"
                    CommandName="Save" runat="server" ValidationGroup="valError" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
