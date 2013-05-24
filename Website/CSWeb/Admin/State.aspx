<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="State.aspx.cs" Inherits="CSWeb.Admin.State"
    MasterPageFile="AdminSite.master" %>

<%@ Import Namespace="CSBusiness" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Admin Page</title>
    <script src="../Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <span class="header"><font color="blue">Define State information</font> </span>
    <br />
    <br />
    <input type="checkbox" name='checkSelectAll' id='checkSelectAll' />
    <label for="checkSelectAll">
        Check All/Uncheck All</label>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="4">
                States
            </td>
        </tr>
        <tr class="header">
            <td align="center" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="left" class="ibn-sectionheader">
                Order
            </td>
            <td align="left" class="ibn-sectionheader"  width="30%">
                Title
            </td>
            <td align="left" class="ibn-sectionheader">
                Code
            </td>
            
        </tr>
        <asp:DataList runat="server" ID="dlStateList" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <tr>
                    <td width="5%" align="center" class='stateCheckboxHolder'>
                        <asp:CheckBox ID="cbVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Visible") %>' />
                    </td>
                     <td align="left" width="5%">
                        <asp:TextBox runat="server" ID='txtOrderNo' MaxLength="2" Width="30%" Text='<%# DataBinder.Eval(Container.DataItem, "DisplayOrder") %>'></asp:TextBox>
                    </td>
                    <td align="left" width="30%">
                        <asp:Label ID="lblTitle" runat="Server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />&#160;
                    </td>
                    <td align="left">
                        <asp:Label ID="lblCode" runat="Server" Text='<%# DataBinder.Eval(Container.DataItem, "Abbreviation") %>' />&#160;
                    </td>
                   
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" OnCommand="btnSave_Command" />
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnSave_Command" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(function () {
            $('#checkSelectAll').click(function () {
                var thisCheck = this.checked;
                $('.stateCheckboxHolder input:checkbox').each(function (a) { this.checked = thisCheck; });
            })
        })		
    </script>
</asp:Content>
