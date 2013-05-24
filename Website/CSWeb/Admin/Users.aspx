<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CSWeb.Admin.Users" MasterPageFile="AdminSite.master"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
    <asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    </asp:Content>

    

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <ajaxToolkit:RoundedCornersExtender ID="rce" runat="server"
    TargetControlID="pnlSearch"
    Radius="6"
    Corners="All" />
    <asp:Panel ID="pnlSearch" runat="server">
   <table width="600" cellpadding="2" cellspacing="1" border="0" class="ExampleA">
        <tr>
            <td class=text width="150">
                First Name:
            </td>
            <td class=text width="150">
                Last Name:
            </td>
            <td class=text width="150">
                Email:
            </td>
            
        </tr>
        <tr class="FieldValue">
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Columns="20" MaxLength="50" EnableViewState="True"
                    CssClass="FieldValue" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="lblSearch" runat="server" CommandName="Search" Text="Search" 
                    OnClick="lblCustomer_Search" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    <br />
        <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
        <td align="left">
       <asp:Image AlternateText="Add" ID="Image1" runat="server" ImageUrl="/Content/images/admin/add.gif"
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="hlAddUser" runat="server" CssClass="link" NavigateURL="UserEdit.aspx"
                     Text="Create NewUser"></asp:HyperLink>

        <td>

        <tr>
            <td class="context-menu" colspan="3">
                Admins
            </td>
        </tr>
         <tr class="context-menu">
            <td align="left" width="40%" class="ibn-sectionheader">
                Name
            </td>
            <td align="center" width="30%" class="ibn-sectionheader">
                Email
            </td>
            <td align="center" width="30%" class="ibn-sectionheader">
                Date Created
            </td>
              <td align="center" width="10%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
 
    <asp:DataList runat="server" ID="dlCustomerList" RepeatLayout="Flow" RepeatDirection="Horizontal">
           <ItemTemplate>
            <tr>
                <td class="body" align="left" width="40%">
                    <%# DataBinder.Eval(Container.DataItem, "FullName") %>
                </td>
                <td width="35%" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "Email") %>
                </td>
                <td width="25%" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "RegistrationDate") %>
                </td>
                <td>
                     <asp:HyperLink ID="hlEditCust" runat="server"  CausesValidation="False"
                            ImageURL="/Content/images/admin/edit.gif" NavigateURL='<%# "UserEdit.aspx?CustId=" + DataBinder.Eval(Container.DataItem, "CustomerId") %>' /></asp:HyperLink>
                      <asp:Image ID="lbMsg" runat="server" ToolTip='<%# DataBinder.Eval(Container.DataItem, "Password") %>' ImageUrl="/Content/images/admin/view_detail.gif"/>
             
                </td>
            </tr>
        </ItemTemplate>
    </asp:DataList>
    <br />
</asp:Content>
