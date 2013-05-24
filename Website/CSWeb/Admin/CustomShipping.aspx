<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomShipping.aspx.cs"
    Inherits="CSWeb.Admin.CustomShipping" MasterPageFile="AdminSite.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Admin Page</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <br />
    <span class="header"><font color="blue">Define Custom Shipping Preferences</font>
    </span>
    <br />
    <br />
    <asp:ValidationSummary ID="valErrorSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="valError" DisplayMode="List" />
    <br />
    <table border="0" cellpadding="2" cellspacing="1">
        <tr>
            <td>
                <asp:DropDownList ID="DropDownListCountry" DataTextField="NAME" DataValueField="COUNTRYID"
                    Width="145px" TabIndex="102" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Country_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList runat="server" DataTextField="NAME" Width="145px" TabIndex="106"
                    ID="DropDownListState" size="1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="cbRushShippingOption" runat="server" AutoPostBack="True" Text="Include Rush shippingcost."
                    OnCheckedChanged="cbRushShippingOption_OnCheckedChanged" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table border="0" cellpadding="2" cellspacing="1">
        <tr>
            <td class="context-menu" colspan="2">
                <b>Shipping Options</b>
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:RadioButton ID="cbOrderSubTotal" runat="server" AutoPostBack="true" Text="Based upon the order subtotal"
                    OnCheckedChanged="OnCheckChanged_OrderVal" GroupName="ShippingItems" />
            </td>
        </tr>
        <!--<div id="dvOption1" style="display: none; visibility: hidden;"> </div> -->
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:Panel ID="pnlOrderVal" runat="Server" Visible="False">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image
                        AlternateText="Add" ID="Image1" runat="server" ImageUrl='/Content/images/admin/add.gif' BorderStyle="None">
                    </asp:Image>
                    <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" OnCommand="btnAction_Command"
                        CommandName="AddOrderVal" Text="Add New Item"></asp:LinkButton>
                    <asp:Repeater ID="rptItems" runat="server">
                        <HeaderTemplate>
                            <table border="0" cellpadding="2" cellspacing="1">
                                <tr>
                                    <td width="15%">
                                        &nbsp;
                                    </td>
                                    <td>
                                        Minimum Order Subtotal
                                    </td>
                                    <td>
                                        Shipping Charge
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td width="15%">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblShippingId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShippingId") %>'
                                        Visible="False" />
                                    <asp:TextBox ID="txtOrderItem" runat="server" Width="30%" MaxLength="4" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "OrderTotal")) %>' />
                                </td>
                                <td>
                                    $<asp:TextBox ID="txtCostItem" runat="server" Width="30%" MaxLength="6" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Cost")) %>' />
                                    <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtCostItem"
                                        ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtCostItem"
                                        Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                        ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:RadioButton ID="cbOrderWeight" runat="server" AutoPostBack="true" Text="Based upon the order weight"
                    OnCheckedChanged="OnCheckChanged_Weight" GroupName="ShippingItems" />
            </td>
        </tr>
        <!--<div id="dvOption1" style="display: none; visibility: hidden;"> </div> -->
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:Panel ID="pnlWeight" runat="Server" Visible="False">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image
                        AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                        BorderStyle="None"></asp:Image>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="link" OnCommand="btnAction_Command"
                        CommandName="OrderWeight" Text="Add New Item"></asp:LinkButton>
                    <asp:Repeater ID="rptOrderWeight" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td width="15%">
                                        &nbsp;
                                    </td>
                                    <td>
                                        Minimum Order Weigh
                                    </td>
                                    <td>
                                        Shipping Charge
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td width="15%">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblShippingId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShippingId") %>'
                                        Visible="False" />
                                    <asp:TextBox ID="txtOrderItem" runat="server" Width="30%" MaxLength="4" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "OrderTotal")) %>' />
                                </td>
                                <td>
                                    $<asp:TextBox ID="txtCostItem" runat="server" Width="30%" MaxLength="6" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Cost")) %>' />
                                    <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtCostItem"
                                        ID="RequiredFieldValidator2" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtCostItem"
                                        Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                        ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:RadioButton ID="cbSkuItem" runat="server" AutoPostBack="true" Text="Based upon item"
                    OnCheckedChanged="OnCheckChanged_Sku" GroupName="ShippingItems" />
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:Panel ID="pnlSkuItem" runat="Server" Visible="False">
                    <asp:Repeater ID="rptSkuItem" runat="server" OnItemDataBound="rptSkuItem_ItemDataBound">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td width="15%">
                                        &nbsp;
                                    </td>
                                    <td width="25%">
                                        SkuTitle
                                    </td>
                                    <td>
                                        Shipping Charge
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td width="15%">
                                    &nbsp;
                                </td>
                                <td class="body" align="left" width="25%">
                                    <asp:Label ID="lblSkuId" runat="server" Visible="False" />
                                    <asp:Label ID="lblSkuTitle" runat="server" />
                                </td>
                                <td align="left">
                                    $<asp:TextBox ID="txtPercentage" runat="server" Width="10%" MaxLength="6" />
                                    <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtPercentage"
                                        ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtPercentage"
                                        Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                        ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:RadioButton ID="cbFlat" runat="server" AutoPostBack="true" Text="Flat Shipping Rate"
                    OnCheckedChanged="OnCheckChanged_Flat" GroupName="ShippingItems" />
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:Panel ID="pnlFlat" runat="Server" Visible="False">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Flat Rate:</b> $<asp:TextBox
                        ID="txtFlat" runat="server" MaxLength="6" Width="20%" />
                    <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtFlat"
                        ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Flat rate is required field.">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtFlat"
                        Type="Double" ErrorMessage="* Flat rate must be Double format." Operator="GreaterThanEqual"
                        ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td width="15%">
            </td>
            <td>
                <asp:RadioButton ID="cbSitePref" runat="server" AutoPostBack="true" Text="Based upon the Site Preferences"
                    GroupName="ShippingItems" />
            </td>
        </tr>
    </table>
    <br />
    <asp:UpdatePanel runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="cbRushShippingOption" />
        </Triggers>
        <ContentTemplate>
            <table border="0" cellpadding="2" cellspacing="1" runat="server" id='rushShippingSettings'>
                <tr>
                    <td class="context-menu" colspan="2">
                        <b>Rush Shipping Options</b>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:RadioButton ID="cbRushOrderTotal" runat="server" AutoPostBack="true" Text="Based upon the order subtotal"
                            OnCheckedChanged="OnCheckChanged_RushOrderVal" GroupName="RushShippingItems" />
                    </td>
                </tr>
                <!--<div id="dvOption1" style="display: none; visibility: hidden;"> </div> -->
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:Panel ID="pnlRushOrderTotal" runat="Server" Visible="False">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image
                                AlternateText="Add" ID="Image2" runat="server" ImageUrl='/Content/images/admin/add.gif' BorderStyle="None">
                            </asp:Image>
                            <asp:LinkButton ID="lbRushItemAdd" runat="server" CssClass="link" OnCommand="btnRushAction_Command"
                                CommandName="AddRushOrderVal" Text="Add New Item"></asp:LinkButton>
                            <asp:Repeater ID="rptRushOrderTotal" runat="server">
                                <HeaderTemplate>
                                    <table border="0" cellpadding="2" cellspacing="1">
                                        <tr>
                                            <td width="15%">
                                                &nbsp;
                                            </td>
                                            <td>
                                                Minimum Order Subtotal
                                            </td>
                                            <td>
                                                Rush Shipping Charge
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="15%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblShippingId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShippingId") %>'
                                                Visible="False" />
                                            <asp:TextBox ID="txtOrderItem" runat="server" Width="30%" MaxLength="4" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "OrderTotal")) %>' />
                                        </td>
                                        <td>
                                            $<asp:TextBox ID="txtCostItem" runat="server" Width="30%" MaxLength="6" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Cost")) %>' />
                                            <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtCostItem"
                                                ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtCostItem"
                                                Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                                ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:RadioButton ID="cbRushOrderweight" runat="server" AutoPostBack="true" Text="Based upon the order weight"
                            OnCheckedChanged="OnCheckChanged_RushWeight" GroupName="RushShippingItems" />
                    </td>
                </tr>
                <!--<div id="dvOption1" style="display: none; visibility: hidden;"> </div> -->
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:Panel ID="pnlRushOrderweight" runat="Server" Visible="False">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image
                                AlternateText="Add" ID="Image3" runat="server" ImageUrl='/Content/images/admin/add.gif' BorderStyle="None">
                            </asp:Image>
                            <asp:LinkButton ID="lbRushWeightItemAdd" runat="server" CssClass="link" OnCommand="btnRushAction_Command"
                                CommandName="RushOrderWeight" Text="Add New Item"></asp:LinkButton>
                            <asp:Repeater ID="rptRushOrderWeight" runat="server">
                                <HeaderTemplate>
                                    <table>
                                        <tr>
                                            <td width="15%">
                                                &nbsp;
                                            </td>
                                            <td>
                                                Minimum Order Weigh
                                            </td>
                                            <td>
                                                Rush Shipping Charge
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="15%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblShippingId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShippingId") %>'
                                                Visible="False" />
                                            <asp:TextBox ID="txtOrderItem" runat="server" Width="30%" MaxLength="4" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "OrderTotal")) %>' />
                                        </td>
                                        <td>
                                            $<asp:TextBox ID="txtCostItem" runat="server" Width="30%" MaxLength="6" Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Cost")) %>' />
                                            <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtCostItem"
                                                ID="RequiredFieldValidator2" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtCostItem"
                                                Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                                ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:RadioButton ID="cbRushSkuItem" runat="server" AutoPostBack="true" Text="Based upon item"
                            OnCheckedChanged="OnCheckChanged_RushSku" GroupName="RushShippingItems" />
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:Panel ID="pnlRushSkuItem" runat="Server" Visible="False">
                            <asp:Repeater ID="rptRushSkuItem" runat="server" OnItemDataBound="rptRushSkuItem_ItemDataBound">
                                <HeaderTemplate>
                                    <table>
                                        <tr>
                                            <td width="15%">
                                                &nbsp;
                                            </td>
                                            <td width="25%">
                                                SkuTitle
                                            </td>
                                            <td>
                                                Rush Shipping Charge
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="15%">
                                            &nbsp;
                                        </td>
                                        <td class="body" align="left" width="25%">
                                            <asp:Label ID="lblSkuId" runat="server" Visible="False" />
                                            <asp:Label ID="lblSkuTitle" runat="server" />
                                        </td>
                                        <td align="left">
                                            $<asp:TextBox ID="txtPercentage" runat="server" Width="10%" MaxLength="6" />
                                            <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtPercentage"
                                                ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtPercentage"
                                                Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                                ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:RadioButton ID="cbRushFlat" runat="server" AutoPostBack="true" Text="Flat Shipping Rate"
                            OnCheckedChanged="OnCheckChanged_RushFlat" GroupName="RushShippingItems" />
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:Panel ID="pnlRushFlat" runat="Server" Visible="False">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Flat Rate:</b> $<asp:TextBox
                                ID="txtRushFlat" runat="server" MaxLength="6" Width="20%" />
                            <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtRushFlat"
                                ID="RequiredFieldValidator1" ValidationGroup="valError" ErrorMessage="* Flat rate is required field.">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtRushFlat"
                                Type="Double" ErrorMessage="* Flat rate must be Double format." Operator="GreaterThanEqual"
                                ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                    </td>
                    <td>
                        <asp:RadioButton ID="cbRushSitePref" runat="server" AutoPostBack="true" Text="Based upon the Site Preferences"
                            GroupName="RushShippingItems"  OnCheckedChanged="OnCheckChanged_RushSitePref" />
                    </td>
                </tr>
            </table>

            <!-- Additional shipping charges -->
            <table border="0" cellpadding="2" cellspacing="1">
                <tr>
                    <td class="context-menu">
                        <b>Additional Shipping Charges</b>
                    </td>
                </tr>
                <tr>                    
                    <td>                     
                        <img src="/Content/images/admin/add.gif" />
                        <asp:LinkButton ID="lbAddShippingCharge" runat="server" CssClass="link" OnCommand="lbAddShippingCharge_Command"
                            CommandName="AddShippingCharge" Text="Add New Shipping Charge"></asp:LinkButton>   
                        <asp:Repeater ID="rptShippingCharges" runat="server">
                            <HeaderTemplate>
                                <table border="0" cellpadding="2" cellspacing="1" width="100%">
                                    <tr>                                        
                                        <td width="15%">&nbsp;</td>
                                        <td>
                                            Key
                                        </td>
                                        <td>
                                            Cost
                                        </td>
                                        <td>
                                            Label
                                        </td>
                                        <td>
                                            Delete
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>                       
                                <td width="15%">&nbsp;</td>             
                                    <td>      
                                        <asp:HiddenField ID="hidShippingChargeId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "ShippingChargeId") %>' />                                  
                                        <asp:TextBox ID="txtKey" runat="server" Width="80%" MaxLength="32" Text='<%# DataBinder.Eval(Container.DataItem, "Key") %>' />
                                    </td>
                                    <td>
                                        $<asp:TextBox ID="txtCost" runat="server" Width="30%" MaxLength="6" 
                                            Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Cost")) %>' />
                                        <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtCost"
                                            ID="valReqCartDesc" ValidationGroup="valError" ErrorMessage="* Shipping charge is required field.">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtCost"
                                            Type="Double" ErrorMessage="* Shipping charge must be Double format." Operator="GreaterThanEqual"
                                            ValidationGroup="valError" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLabel" runat="server" MaxLength="50" Value='<%# DataBinder.Eval(Container.DataItem, "FriendlyLabel") %>' />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkDelete" runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div align="center" style="width: 20%">
        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CommandName="Cancel" OnCommand="btnSave_Command" />
        &nbsp;
        <asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Save" OnCommand="btnSave_Command"
            ValidationGroup="valError" />
    </div>
</asp:Content>
