<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorLog.aspx.cs" Inherits="CSWeb.Admin.ErrorLog"
    MasterPageFile="AdminSite.master" EnableViewState="True" %>

<%@ Register TagPrefix="usercontrols" TagName="RangeDateControl" Src="../UserControls/RangeDateControl.ascx" %>
<%@ Register TagPrefix="usercontrols" TagName="paging" Src="../UserControls/PageControl.ascx" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ValidationSummary ID="valSummary" runat="server" DisplayMode="List" Width="450"
        font-name="verdana, san-serif" Font-Size="7" CssClass="error"></asp:ValidationSummary>
    <table width="600" cellpadding="2" cellspacing="1" border="0" class="ibn-alternating">
        <tr>
            <td class="text" width="150">
                <usercontrols:RangeDateControl ID="rangeDateControlCriteria" LabelStyle="FieldName"
                    runat="server" DisplayDropDown="true" StartDateWidth="115" EndDateWidth="115"
                    LabelStartText="From" LabelEndText="To" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="lblSearch" runat="server" CommandName="Search" Text="Search" OnClick="lblOrder_Search" />
            </td>
        </tr>
    </table>
    <br />
    <div align="right">
        <asp:UpdatePanel ID="updPg" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <usercontrols:paging ID="pg" OnPageChanged="OnPaging" Mode="Links" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel ID="updList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr>
                    <td class="context-menu" colspan="3">
                        ErrorLog
                    </td>
                </tr>
                <tr class="context-menu">
                    <td width="15%" class="ibn-sectionheader">
                        EventDate
                    </td>
                    <td width="20%" class="ibn-sectionheader">
                        URL
                    </td>
                    <td width="65%" class="ibn-sectionheader">
                        Message
                    </td>
                </tr>
                <asp:DataList runat="server" ID="dlErrorList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <tr>
                            <td width="15%">
                                <%# DataBinder.Eval(Container.DataItem, "EventDate")%>
                            </td>
                            <td class="body" width="20%">
                                <%# DataBinder.Eval(Container.DataItem, "URL")%>
                            </td>
                            <td width="65%">
                                $<%#  DataBinder.Eval(Container.DataItem, "Message")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
                <tr>
                    <td colspan="3">
                        <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
