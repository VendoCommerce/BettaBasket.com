<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PageControl.ascx.cs" Inherits="CSWeb.Root.UserControls.PageControl" %>

<asp:PlaceHolder runat="server" ID="holderDropdownMode">
	<asp:linkbutton id="Prev" runat="server" CommandName="Prev" OnCommand="OnCommand" CssClass="link" CausesValidation="false"/>
	<span class="body">
		<asp:dropdownlist id="dl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="OnSelectedIndexChanged"></asp:dropdownlist>
	</span>
	<asp:linkbutton id="Next" runat="server" CssClass="link" OnCommand="OnCommand" CausesValidation="false"/>
</asp:PlaceHolder>
<asp:PlaceHolder runat="server" ID="holderLinksMode">
	<asp:Label ID="lblResults" runat="server" CssClass="FieldValue" Font-Italic="true" Visible="false"></asp:Label>
	<asp:PlaceHolder runat="server" id='holderHideOnOnePage'>
		<asp:PlaceHolder runat="server" ID="holderPrewLinks">
			<asp:ImageButton ID="firstPageLink" CausesValidation='<%# CausesValidation %>' CommandName="Firts" runat="server" CssClass="pagerNavigationLink" OnClick="OnNavigationClick" ImageUrl="/Content/images/move_frst.gif" ImageAlign="AbsMiddle" ToolTip="First" />
			<asp:ImageButton ID="previousPageLink" CausesValidation='<%# CausesValidation %>' CommandName="Previous" runat="server" CssClass="pagerNavigationLink" OnClick="OnNavigationClick" ImageUrl="/Content/images/move_lt.gif" ImageAlign="AbsMiddle" ToolTip="Previous" />
		</asp:PlaceHolder>
		<asp:Repeater ID="pagingLinksRepeater" runat="server" OnItemDataBound="pagingLinksRepeater_OnItemDataBound" OnItemCommand="pagingLinksRepeater_OnItemCommand">
			<ItemTemplate>
				<asp:LinkButton runat="server" ID="pageSelector" CssClass="pagerLink" CausesValidation='<%# CausesValidation %>' ></asp:LinkButton>
				<asp:Label runat="server" ID="lblCurrentPage" Visible="false" CssClass="pagerLinkActive" ></asp:Label>
			</ItemTemplate>
		</asp:Repeater>
		<asp:PlaceHolder runat="server" ID="holderNextLinks">
			<asp:ImageButton ID="nextPageLink" CausesValidation='<%# CausesValidation %>' CommandName="Next" runat="server" OnClick="OnNavigationClick" CssClass="pagerNavigationLink" ImageUrl="/Content/images/move_rt.gif" ImageAlign="AbsMiddle" ToolTip="Next" />
			<asp:ImageButton ID="lastPageLink" CausesValidation='<%# CausesValidation %>' CommandName="Last" runat="server" OnClick="OnNavigationClick" CssClass="pagerNavigationLink" ImageUrl="/Content/images/move_lst.gif" ImageAlign="AbsMiddle" ToolTip="Last" />
		</asp:PlaceHolder>
	</asp:PlaceHolder>
</asp:PlaceHolder>
