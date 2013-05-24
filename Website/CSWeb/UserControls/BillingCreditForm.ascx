<%@Control Language="C#" AutoEventWireup="true" CodeBehind="BillingCreditForm.ascx.cs" Inherits="CSWeb.UserControls.BillingCreditForm" %>
    <%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl"
    TagPrefix="uc" %>
    <script type="text/javascript" src="/Scripts/autoTab.js"></script>
    
<script type="text/javascript">

    var pointerToMicrosoftValidator = ValidatorUpdateIsValid;
    ValidatorUpdateIsValid = function () {
        pointerToMicrosoftValidator();
    }
</script>
    <div class="cart_content_B clearfix">

    <div class="cart_left">
        <h2>Shopping Basket</h2>
        <div class="horizontal_dots">
        </div>
        
        <uc:ShoppingCartControl ID="ucShoppingCartControl" runat="server" OnUpdateShipping="Shipping_OnUpdateShipping"></uc:ShoppingCartControl>     
    </div>
     <div class="vertical_dots">
    </div>
<div class="cart_right">
<div class="cartB"> 
<h2 style="padding-bottom: 15px;">


                Order Information</h2>
                <div class="form_line clearfix">
                <div class="error-2">
                    </div>
                <label class="label-2" style="width: 170px;">
                    Billing information is same<br />
          as Shipping</label>
                <asp:CheckBox ID="cbBillingDifferent" runat="server" CssClass="checkbox-right" OnCheckedChanged="cbShippingDifferent_CheckedChanged"
                    AutoPostBack="true" Checked="true" />
            </div>                  
            
            <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvBillingFirstName" runat="server" Display="Dynamic"
                            ControlToValidate="txtBillingFirstName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
                        </asp:Label>
                    </div>
                    <label class="label-1">
                        First Name*</label>
                    <asp:TextBox ID="txtBillingFirstName" runat="server" MaxLength="60" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvBillingLastName" runat="server" Display="Dynamic" ControlToValidate="txtBillingLastName"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                    </div>
                    <label class="label-1">
                        Last Name*</label>
                    <asp:TextBox ID="txtBillingLastName" runat="server" MaxLength="60" CssClass="text-1"></asp:TextBox>
                </div>                
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvBillingAddress1" runat="server" Display="Dynamic"
                            ControlToValidate="txtBillingAddress1"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblBillingAddress1Error" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Billing Address*</label>
                    <asp:TextBox ID="txtBillingAddress1" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                    </div>
                    <label class="label-1">
                    </label>
                    <asp:TextBox ID="txtBillingAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvBillingCity" runat="server" Display="Dynamic"
                            ControlToValidate="txtBillingCity"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblBillingCityError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        City*</label>
                    <asp:TextBox ID="txtBillingCity" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblBillingCountryError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Country*</label>
                    <asp:DropDownList ID="ddlBillingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                        AutoPostBack="true" OnSelectedIndexChanged="BillingCountry_SelectedIndexChanged"
                        CssClass="text-1">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblBillingStateError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        State*</label>
                    <asp:DropDownList ID="ddlBillingState" runat="server" DataTextField="NAME" CssClass="text-1" size="1" 
                        OnSelectedIndexChanged="BillingState_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:RequiredFieldValidator ID="rfvBillingZipCode" runat="server" Display="Dynamic"
                            ControlToValidate="txtBillingZipCode"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblBillingZiPError" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Zip Code*</label>
                    <asp:TextBox ID="txtBillingZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
                </div>
            </asp:Panel>
            <div class="form_line clearfix">
                <label class="label-3">
                    Credit Card*</label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic"
                            ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-2">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Exp Date*</label>
                <div class="error-2">
                <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic"
                            ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic"
                    ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-3">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
                    <asp:ListItem Value="1">01</asp:ListItem>
                    <asp:ListItem Value="2">02</asp:ListItem>
                    <asp:ListItem Value="3">03</asp:ListItem>
                    <asp:ListItem Value="4">04</asp:ListItem>
                    <asp:ListItem Value="5">05</asp:ListItem>
                    <asp:ListItem Value="6">06</asp:ListItem>
                    <asp:ListItem Value="7">07</asp:ListItem>
                    <asp:ListItem Value="8">08</asp:ListItem>
                    <asp:ListItem Value="9">09</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-3">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
                        <asp:ListItem Value="2013">2013</asp:ListItem>
                        <asp:ListItem Value="2014">2014</asp:ListItem>
                        <asp:ListItem Value="2015">2015</asp:ListItem>
                        <asp:ListItem Value="2016">2016</asp:ListItem>
                        <asp:ListItem Value="2017">2017</asp:ListItem>
                        <asp:ListItem Value="2018">2018</asp:ListItem>
                        <asp:ListItem Value="2019">2019</asp:ListItem>
                        <asp:ListItem Value="2020">2020</asp:ListItem>
                        <asp:ListItem Value="2021">2021</asp:ListItem>
                        <asp:ListItem Value="2022">2022</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Number*</label>
                <div class="error-2">
                    <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label></div>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td><asp:TextBox ID="txtCCNumber1" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtCCNumber1" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber2" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtCCNumber2" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber3" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCCNumber3" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                        <td><asp:TextBox ID="txtCCNumber4" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtCCNumber4" runat="server" Display="Dynamic" ErrorMessage="*" /></td>
                    </tr>
                </table>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Card Verification #* <a class="cvv" href="#" style="display:none">what's this?</a>
                </label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                <asp:TextBox ID="txtCvv" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <asp:checkbox ID="chkboxOffers" runat="server" CssClass="checkbox-right" />
                <label class="label-2" style="width: 220px; text-transform: uppercase; font-weight: normal; font-size: 10px;">
                    Send me updates and special offers <br />
from focus education!</label>
                
            </div>
            
            <div class="form_line_btn">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/content/images/B2/btn_OrderNow.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
            <div class="form_line_guarantee" style="display:none"><a href="#">View 30-Day Guarantee</a></div>
           
        </div>
    <!-- end cartB -->
  
</div>
<!-- end checkout_right -->
</div>


    
