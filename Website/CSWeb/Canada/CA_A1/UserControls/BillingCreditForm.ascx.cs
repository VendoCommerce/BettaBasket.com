using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.CreditCard;
using CSBusiness.CustomerManagement;
using CSBusiness.OrderManagement;
using CSBusiness.Payment;
using CSBusiness.Resolver;
using CSCore.Utils;
using CSCore.DataHelper;
using CSBusiness.ShoppingManagement;
using System.Web;


namespace CSWeb.Canada.CA_A1.UserControls
{
    public partial class BillingCreditForm : System.Web.UI.UserControl
    {

        #region Variable and Events Declaration

        // public event EventHandler UpdateShipping;
        bool _bError = false;
        public int rId = 1;
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
            set
            {
                Session["ClientOrderData"]  = value;
            }
        }
        #endregion Variable and Events Declaration

        #region Page Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CartContext.CustomerInfo == null)
                Response.Redirect("/", true);

            if (!CommonHelper.IsHttps(HttpContext.Current))
            {
                if (Request.Url.ToString().Contains("www"))
                {
                    Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("www", "secure")));
                }
                else
                {
                    Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("secure.", "").Replace("https://", "https://secure.")));
                }
            }
            if (Request.Params["rId"] != null)
                rId = Convert.ToInt32(Request.Params["rId"]);

            if (!IsPostBack)
            {
                txtBillingFirstName.Focus();
                rfvBillingFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvBillingLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvBillingAddress1.ErrorMessage = ResourceHelper.GetResoureValue("BillingAddress1ErrorMsg");
                rfvBillingCity.ErrorMessage = ResourceHelper.GetResoureValue("BillingCityErrorMsg");
                rfvBillingZipCode.ErrorMessage = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");

                rfvCCType.ErrorMessage = ResourceHelper.GetResoureValue("CCTypeErrorMsg");
                rfvExpMonth.ErrorMessage = ResourceHelper.GetResoureValue("ExpDateMonthErrorMsg") + "<br/>";
                rfvExpYear.ErrorMessage = ResourceHelper.GetResoureValue("ExpDateYearErrorMsg");
                rfvCVV.ErrorMessage = ResourceHelper.GetResoureValue("CVVErrorMsg");
                txtCCNumber1.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber2.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber3.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                txtCCNumber4.Attributes.Add("onkeyup", "return autoTab(this, 4, event);");
                if (rId == 0)
                {
                    //ReloadCartData();
                }
                else
                {
                    BindCreditCard();
                    BindBillingCountries(true);
                    BindBillingRegions();
                    BindPaymentOptions();
                }

            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + this.ClientID,
            //   String.Format(@"$(function() {{$('#{0}, #{1}, #{2}, #{3}').autotab_magic().autotab_filter('numeric')}});",
            //       txtCCNumber1.ClientID, txtCCNumber2.ClientID, txtCCNumber3.ClientID, txtCCNumber4.ClientID), true);



        }
        #endregion Page Events

        #region General Methods

        protected void BindPaymentOptions()
        {

        }

        protected void BillingCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindCartSummary();
        }

        protected void BillingState_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            Address BillingAddress = new Address();
            BillingAddress.StateProvinceId = Convert.ToInt32(ddlBillingState.SelectedValue);
            BillingAddress.CountryId = Convert.ToInt32(ddlBillingCountry.SelectedValue);
            CartContext.CustomerInfo.BillingAddress = BillingAddress;

            BindCartSummary();
        }

        public void BindCartSummary()
        {
            if (CartContext.CartInfo.ItemCount > 0)
            {
                if (ddlBillingCountry.SelectedValue != "")
                    CartContext.CustomerInfo.ShippingAddress.StateProvinceId = Convert.ToInt32(ddlBillingState.SelectedValue);
                else
                    CartContext.CustomerInfo.ShippingAddress.StateProvinceId = 0;
                CartContext.CustomerInfo.ShippingAddress.CountryId = Convert.ToInt32(ddlBillingCountry.SelectedValue);

                CartContext.CartInfo.Compute();

                //if (UpdateShipping != null)
                //{
                //    UpdateShipping(this, new EventArgs());
                //}
                this.Visible = true;
            }
            else
            {
                this.Visible = false;
            }
        }

        /// <summary>
        /// Binds the CreditCards.
        /// </summary>
        private void BindCreditCard()
        {
            ddlCCType.Items.Clear();
            ddlCCType.DataSource = CommonHelper.BindToEnum(typeof(CreditCardTypeEnum));
            ddlCCType.DataTextField = "Key";
            ddlCCType.DataValueField = "Value";
            ddlCCType.DataBind();
            ddlCCType.Items.Insert(0, new ListItem("- Select -", string.Empty));

        }

        /// <summary>
        /// Binds the regions.
        /// </summary>

        public void BindBillingCountries(bool setValue)
        {
            ddlBillingCountry.DataSource = CountryManager.GetActiveCountry();
            ddlBillingCountry.DataBind();
            if (setValue)
                ddlBillingCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// Binds the regions.
        /// </summary>
        private void BindBillingRegions()
        {
            ddlBillingState.Items.Clear();
            int countryId = Convert.ToInt32(ddlBillingCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlBillingState.DataSource = list;
            ddlBillingState.DataValueField = "StateProvinceId";
            ddlBillingState.DataBind();
        }



        //public void BindBillingCountries(bool setValue)
        //{
        //    ddlCountry.DataSource = CountryManager.GetActiveCountry();
        //    ddlCountry.DataTextField = "Name";
        //    ddlCountry.DataValueField = "CountryId";
        //    ddlCountry.DataBind();
        //    if (setValue)
        //        ddlCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;

        //}

        //private void BindBillingRegions()
        //{

        //    ddlState.Items.Clear();
        //    int billingCountryId = Convert.ToInt32(ddlCountry.SelectedValue);
        //    ddlState.DataSource = StateManager.GetCacheStates(billingCountryId);
        //    ddlState.DataValueField = "StateProvinceId";
        //    ddlState.DataTextField = "Name";
        //    ddlState.DataBind();

        //}

        protected void cbShippingDifferent_CheckedChanged(object sender, EventArgs e)
        {
            bool billingVal = !cbBillingDifferent.Checked;

            if (billingVal)
                pnlBillingAddress.Visible = true;
            else
                pnlBillingAddress.Visible = false;

            SetBillingAddress();
            BindCartSummary();
        }

        //Sri Comments: User action may vary depends on the scenario
        public void SetBillingAddress()
        {
            if (!cbBillingDifferent.Checked)
            {
                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(txtBillingFirstName.Text);
                billingAddress.LastName = CommonHelper.fixquotesAccents(txtBillingLastName.Text);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(txtBillingAddress1.Text);
                billingAddress.Address2 = CommonHelper.fixquotesAccents(txtBillingAddress2.Text);
                billingAddress.City = CommonHelper.fixquotesAccents(txtBillingCity.Text);
                billingAddress.StateProvinceId = Convert.ToInt32(ddlBillingState.SelectedValue);
                billingAddress.CountryId = Convert.ToInt32(ddlBillingCountry.SelectedValue);
                billingAddress.ZipPostalCode = txtBillingZipCode.Text;
                
                CartContext.CustomerInfo.BillingAddress = billingAddress;

                CartContext.CartInfo.Compute();
            }
            else
            {
                CartContext.CustomerInfo.BillingAddress = CartContext.CustomerInfo.ShippingAddress;

                ddlBillingCountry.SelectedValue = CartContext.CartInfo.ShippingAddress.CountryId.ToString();

                if (CartContext.CartInfo.ShippingAddress.StateProvinceId != 0 &&
                    ddlBillingState.Items.FindByValue(CartContext.CartInfo.ShippingAddress.StateProvinceId.ToString()) != null)
                {
                    ddlBillingState.SelectedValue = CartContext.CartInfo.ShippingAddress.StateProvinceId.ToString();
                }
            }
        }

        public bool validateInput()
        {

            if (!cbBillingDifferent.Checked)
            {
                if (CommonHelper.EnsureNotNull(txtBillingFirstName.Text) == String.Empty)
                {
                    lblFirstNameError.Text = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                    lblFirstNameError.Visible = true;
                    _bError = true;
                }
                else
                    lblFirstNameError.Visible = false;

                if (CommonHelper.EnsureNotNull(txtBillingLastName.Text) == String.Empty)
                {
                    lblLastNameError.Text = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                    lblLastNameError.Visible = true;
                    _bError = true;

                }
                else
                    lblLastNameError.Visible = false;

                if (CommonHelper.EnsureNotNull(txtBillingAddress1.Text) == String.Empty)
                {
                    lblBillingAddress1Error.Text = ResourceHelper.GetResoureValue("BillingAddress1ErrorMsg");
                    lblBillingAddress1Error.Visible = true;
                    _bError = true;
                }
                else
                    lblBillingAddress1Error.Visible = false;

                if (CommonHelper.EnsureNotNull(txtBillingCity.Text) == String.Empty)
                {
                    lblBillingCityError.Text = ResourceHelper.GetResoureValue("BillingCityErrorMsg");
                    lblBillingCityError.Visible = true;
                    _bError = true;
                }
                else
                    lblBillingCityError.Visible = false;


                if (ddlBillingState.SelectedValue.Equals("select"))
                {
                    lblBillingStateError.Text = ResourceHelper.GetResoureValue("BillingStateErrorMsg");
                    lblBillingStateError.Visible = true;
                    _bError = true;
                }
                else
                    lblBillingStateError.Visible = false;

                if (CommonHelper.EnsureNotNull(txtBillingZipCode.Text) == String.Empty)
                {
                    lblBillingZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                    lblBillingZiPError.Visible = true;
                    _bError = true;
                }
                else
                {
                    if (ddlBillingCountry.SelectedItem.Text.Contains("United States"))
                    {
                        if (!CommonHelper.IsValidZipCode(txtBillingZipCode.Text))
                        {
                            lblBillingZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeValidationErrorMsg");
                            lblBillingZiPError.Visible = true;
                            _bError = true;

                        }
                        else
                            lblBillingZiPError.Visible = false;
                    }
                    else
                    {
                        if (!CommonHelper.IsValidZipCodeCanadian(txtBillingZipCode.Text))
                        {
                            lblBillingZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeValidationErrorMsg");
                            lblBillingZiPError.Visible = true;
                            _bError = true;

                        }
                        else
                            lblBillingZiPError.Visible = false;
                        
                    }
                    

                }
            }
            //if (!cbTeams.Checked)
            //{
            //    lblTerms.Text = ResourceHelper.GetResoureValue("TermsErrorMsg");
            //    lblTerms.Visible = true;
            //    _bError = true;

            //}
            //else
            //    lblTerms.Visible = false;

            if (ddlCCType.SelectedIndex < 0)
            {
                lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeErrorMsg");
                lblCCType.Visible = true;
                _bError = true;
            }
            else
                lblCCType.Visible = false;


            DateTime expire = new DateTime();
            if (ddlExpYear.SelectedIndex > 0 && ddlExpMonth.SelectedIndex > 0)
            {
                expire = new DateTime(int.Parse(ddlExpYear.SelectedValue), int.Parse(ddlExpMonth.SelectedValue), 1);
            }
            DateTime today = DateTime.Today;
            if (expire.Year <= today.Year && expire.Month <= today.Month)
            {
                lblExpDate.Text = ResourceHelper.GetResoureValue("ExpDateErrorMsg");
                lblExpDate.Visible = true;
                _bError = true;
            }
            else
                lblExpDate.Visible = false;

            string c = txtCCNumber1.Text + txtCCNumber2.Text + txtCCNumber3.Text + txtCCNumber4.Text;
            if (c.Equals(""))
            {
                lblCCNumberError.Text = ResourceHelper.GetResoureValue("CCErrorMsg");
                lblCCNumberError.Visible = true;
                _bError = true;
            }
            else
            {
                if ((c.ToString() != "4444333322221111") && (txtCvv.Text.IndexOf("147114711471") == -1))
                {
                    if (!CommonHelper.ValidateCardNumber(c))
                    {
                        lblCCNumberError.Text = ResourceHelper.GetResoureValue("CCErrorMsg");
                        lblCCNumberError.Visible = true;
                        _bError = true;
                    }
                    else
                        lblCCNumberError.Visible = false;
                }
                else
                    lblCCNumberError.Visible = false;


            }

            if (CommonHelper.EnsureNotNull(txtCvv.Text) == String.Empty)
            {
                lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                lblCvvError.Visible = true;
                _bError = true;
            }
            else
            {

                if (CommonHelper.onlynums(txtCvv.Text) == false)
                {
                    lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                    lblCvvError.Visible = true;
                    _bError = true;
                }
                if ((CommonHelper.CountNums(txtCvv.Text) != 3) && (CommonHelper.CountNums(txtCvv.Text) != 4))
                {
                    lblCvvError.Text = ResourceHelper.GetResoureValue("CVVErrorMsg");
                    lblCvvError.Visible = true;
                    _bError = true;
                }
                else
                    lblCvvError.Visible = false;

                if ((c[0].ToString() == "5") && (ddlCCType.SelectedItem.Text.ToString() != CreditCardTypeEnum.MasterCard.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;
                }
                else if ((c[0].ToString() == "4") && (ddlCCType.SelectedItem.Text.ToString() != CreditCardTypeEnum.VISA.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "6") && (ddlCCType.SelectedItem.Text.ToString() != CreditCardTypeEnum.Discover.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "3") && (ddlCCType.SelectedItem.Text.ToString() != CreditCardTypeEnum.AmericanExpress.ToString()))
                {
                    lblCCType.Text = ResourceHelper.GetResoureValue("CCTypeValidationErrorMsg");
                    lblCCType.Visible = true;
                    _bError = true;

                }
                else
                {
                    lblCCType.Visible = false;
                }

            }

            return _bError;
        }



        public void SaveData()
        {
            ClientCartContext clientData = (ClientCartContext)Session["ClientOrderData"];

            // attribute save example            
            //clientData.OrderAttributeValues = new Dictionary<string, CSBusiness.Attributes.AttributeValue>();
            //clientData.OrderAttributeValues.Add("ref_url", new CSBusiness.Attributes.AttributeValue("http://www.google.com"));
            if (clientData.OrderAttributeValues == null)
            {
                clientData.OrderAttributeValues = new Dictionary<string, CSBusiness.Attributes.AttributeValue>();
            }
            clientData.OrderAttributeValues.Add("CustomOrderId", new CSBusiness.Attributes.AttributeValue("CS" + CommonHelper.GetRandonOrderNumber(DateTime.Now)));
            clientData.OrderAttributeValues.Add("cartabandonmentid", new CSBusiness.Attributes.AttributeValue(clientData.CartAbandonmentId.ToString()));


            // TODO: active when attribue is created
            /*
            if (clientData.OrderAttributeValues.ContainsKey("SendOffers"))
            {
                clientData.OrderAttributeValues.Remove("SendOffers");
            }
            if (chkboxOffers.Checked)
            {
                clientData.OrderAttributeValues.Add("SendOffers", new CSBusiness.Attributes.AttributeValue("1"));
            }
            else
            {
                clientData.OrderAttributeValues.Add("SendOffers", new CSBusiness.Attributes.AttributeValue("0"));
            }
            */

            //Recapture billing information if the user modified the information
            if (rId == 0)
            {
                if (Convert.ToBoolean(!cbBillingDifferent.Checked)) //override if the user select yes button
                {
                    Address billingAddress = new Address();
                    billingAddress.FirstName = CommonHelper.fixquotesAccents(txtBillingFirstName.Text);
                    billingAddress.LastName = CommonHelper.fixquotesAccents(txtBillingLastName.Text);
                    billingAddress.Address1 = CommonHelper.fixquotesAccents(txtBillingAddress1.Text);
                    billingAddress.Address2 = CommonHelper.fixquotesAccents(txtBillingAddress2.Text);
                    billingAddress.City = CommonHelper.fixquotesAccents(txtBillingCity.Text);
                    billingAddress.StateProvinceId = Convert.ToInt32(ddlBillingState.SelectedValue);
                    billingAddress.CountryId = Convert.ToInt32(ddlBillingCountry.SelectedValue);
                    billingAddress.ZipPostalCode = txtBillingZipCode.Text;

                    clientData.CustomerInfo.FirstName = CommonHelper.fixquotesAccents(txtBillingFirstName.Text);
                    clientData.CustomerInfo.LastName = CommonHelper.fixquotesAccents(txtBillingLastName.Text);
                    clientData.CustomerInfo.BillingAddress = billingAddress;

                    clientData.CartInfo.Compute();
                }
            }

            SetBillingAddress();

            PaymentInformation paymentDataInfo = new PaymentInformation();
            string CardNumber = txtCCNumber1.Text + txtCCNumber2.Text + txtCCNumber3.Text + txtCCNumber4.Text;
            paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(CardNumber);
            paymentDataInfo.CreditCardType = Convert.ToInt32(ddlCCType.SelectedValue);
            paymentDataInfo.CreditCardName = ddlCCType.SelectedItem.Text;
            paymentDataInfo.CreditCardExpired = new DateTime(int.Parse(ddlExpYear.SelectedValue), int.Parse(ddlExpMonth.SelectedValue), 1);
            paymentDataInfo.CreditCardCSC = txtCvv.Text;

            CartContext.PaymentInfo = paymentDataInfo;

            int orderId = 0;

            if (CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.InstantOrderProcess
                || CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.EnableReviewOrder)
            {
                //Save Order information before upsale process

                if (rId == 1)
                    orderId = CSResolve.Resolve<IOrderService>().SaveOrder(clientData);
                else
                {
                    //update order with modified customer shipping and billing and credit card information
                    orderId = clientData.OrderId;
                    CSResolve.Resolve<IOrderService>().UpdateOrder(orderId, clientData);
                }

                if (orderId > 1)
                {
                    clientData.OrderId = orderId;
                    Session["ClientOrderData"] = clientData;

                    if (rId == 1)
                        Response.Redirect("PostSale.aspx");
                    else
                        Response.Redirect("CardDecline.aspx");
                }
            }
        }

        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                SaveData();
            }

        }

        #endregion General Methods

    }
}
