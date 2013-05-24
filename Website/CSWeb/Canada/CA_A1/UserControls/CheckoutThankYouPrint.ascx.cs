using System;
using System.Web;
using System.Web.UI;
using CSBusiness.Resolver;
using CSBusiness.OrderManagement;
using CSBusiness.Cache;
using System.Collections.Generic;
using CSBusiness;
using System.Web.UI.WebControls;
using System.Text;
using CSWebBase;
using System.Linq;
using CSBusiness.Preference;

namespace CSWeb.Canada.CA_A1.UserControls
{
    /// <summary>
    /// 
    /// </summary>
    public partial class CheckoutThankYouPrint : System.Web.UI.UserControl
    {
        public int orderId = 0;

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["oId"] != null)
                orderId = Convert.ToInt32(Request.Params["oId"]);
            else
                orderId = CartContext.OrderId;
            if (!this.IsPostBack)
            {
                BindData();                
            }
        }


        private void BindData()
        {
            if (orderId > 0)
            {
                Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId);

                dlordersList.DataSource = orderData.SkuItems;
                dlordersList.DataBind();

                LiteralSubTotal.Text = orderData.SubTotal.ToString("C");
                LiteralShipping.Text = orderData.ShippingCost.ToString("C");
                LiteralTax.Text = orderData.Tax.ToString("C");
                LiteralTotal.Text = orderData.Total.ToString("C");

                if (orderData.RushShippingCost > 0)
                {
                    pnlRushLabel.Visible = true;
                    pnlRush.Visible = true;
                }

                if (orderData.DiscountCode.Length > 0)
                {
                    pnlPromotionLabel.Visible = true;
                    pnlPromotionalAmount.Visible = true;

                    lblPromotionPrice.Text = String.Format("(${0:0.00})", orderData.DiscountAmount);
                }

                LiteralName.Text = String.Format("{0} {1}", orderData.CustomerInfo.ShippingAddress.FirstName, orderData.CustomerInfo.ShippingAddress.LastName);
                LiteralEmail.Text = orderData.CustomerInfo.Email;
                LiteralAddress.Text = orderData.CustomerInfo.ShippingAddress.Address1;
                LiteralAddress2.Text = orderData.CustomerInfo.ShippingAddress.Address2;
                LiteralCity.Text = orderData.CustomerInfo.ShippingAddress.City;
                LiteralZip.Text = orderData.CustomerInfo.ShippingAddress.ZipPostalCode;
                LiteralState.Text = StateManager.GetStateName(orderData.CustomerInfo.ShippingAddress.StateProvinceId);
                LiteralCountry.Text = CountryManager.CountryName(orderData.CustomerInfo.ShippingAddress.CountryId);

                LiteralName_b.Text = String.Format("{0} {1}", orderData.CustomerInfo.BillingAddress.FirstName, orderData.CustomerInfo.BillingAddress.LastName);
                LiteralAddress_b.Text = orderData.CustomerInfo.BillingAddress.Address1;
                LiteralAddress2_b.Text = orderData.CustomerInfo.BillingAddress.Address2;
                LiteralCity_b.Text = orderData.CustomerInfo.BillingAddress.City;
                LiteralZip_b.Text = orderData.CustomerInfo.BillingAddress.ZipPostalCode;
                LiteralState_b.Text = StateManager.GetStateName(orderData.CustomerInfo.BillingAddress.StateProvinceId);
                LiteralCountry_b.Text = CountryManager.CountryName(orderData.CustomerInfo.BillingAddress.CountryId);

            }

        }

        public string GetPrice(object value)
        {
            decimal price;
            if (decimal.TryParse(Convert.ToString(value), out price))
            {
                if (price == 0m)
                    return "FREE";

                return price.ToString("C");
            }

            return Convert.ToString(value);
        }

        public string GetOrderId()
        {
            if (CartContext != null)
            {
                return CartContext.OrderId.ToString();
            }
            else
            {
                if (Request.Params["oId"] != null)
                    return Request.Params["oId"];
            }
            return "";
        }
    }
}
