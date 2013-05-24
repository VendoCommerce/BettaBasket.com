using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using System.Text;

namespace CSWeb.Canada.CA_A1.UserControls
{
    public partial class TrackingPixels : System.Web.UI.UserControl
    {
        public Order CurrentOrder = null;
        public int i = 1;
        public string versionName = "";
        public int orderId = 0;
        public string productName = "";
        public string productCategory = "";
        public string productPrice = "";
        public string productBrand = "";
        public string productImageUrl = "";
        public string productSku = "";
        public string shoppingCartValue = "";
        public string shoppingCartQuantity = "";
        public string productIds = "";
        public decimal OrderAmount = 0;
        public string productQuantities;

        public enum Location
        {
            Unknown = 1,
            Body = 2,
            Head = 3
        }

        public Location PixelLocation
        {
            get
            {
                return ViewState["PixelLocation"] == null ? Location.Unknown :
                    (Location)Enum.Parse(typeof(Location), Convert.ToString(ViewState["PixelLocation"]));
            }
            set
            {
                ViewState["PixelLocation"] = value;
            }
        }

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
        }

        protected string OrderId
        {
            get
            {
                if (CartContext != null && CartContext.OrderId > 0)
                {
                    return Convert.ToString(CartContext.OrderId);
                }

                return null;
            }
        }

        protected string OrderTotal
        {
            get
            {
                if (CartContext != null && CartContext.CartInfo != null)
                {
                    return Convert.ToString(CartContext.CartInfo.Total);
                }

                return "0";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else
            {
                orderId = CartContext != null ? CartContext.OrderId : 0;
            }
            versionName = CSWeb.OrderHelper.GetVersionName();
                        
            SetContactPagePanel();
            SetPnlCartPage();
            SetpnlReceiptPage();
            SetOrderNowPage();
        }

        private void SetContactPagePanel()
        {
            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/contact.aspx"))
            {
                pnlContactPage.Visible = true;                
            }
            else
            {
                pnlContactPage.Visible = false;
            }
            
        }

        private void SetOrderNowPage()
        {

            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/order.aspx"))
            {
                PnlOrderNowPage.Visible = true;

            }
            else
            {
                PnlOrderNowPage.Visible = false;
            }

        }

        private void SetPnlCartPage()
        {

            string url = Request.Url.AbsolutePath.ToLower();

            if (url.EndsWith("/cart.aspx"))
            {
                PnlCartPage.Visible = true;

            }
            else
            {
                PnlCartPage.Visible = false;
            }

        }

        private void SetpnlReceiptPage()
        {
            string url = Request.Url.AbsolutePath.ToLower();
            if (url.EndsWith("/receipt.aspx"))
            {
                pnlReceiptPage.Visible = true;

                SetCurrentOrder();
                WriteGAPixel();
            }
            else
            {
                pnlReceiptPage.Visible = false;
            }

        }


        public static string GetVersionName()
        {
            return CSWeb.OrderHelper.GetVersionName();
        }

        protected string GetOrderId()
        {
            return OrderId;
        }

        private string GetEncodedJS(string str)
        {
            if (str == null)
                return string.Empty;

            return str.Replace("'", "\\'").Replace("\r", " ").Replace("\n", " ");
        }

        private void WriteGAPixel()
        {

            CSBusiness.CustomerManagement.Address address = CSResolve.Resolve<ICustomerService>().GetAddressById(CurrentOrder.BillingAddressId);

            StringBuilder sbGAPixel = new StringBuilder();
            sbGAPixel.AppendFormat("pageTracker._addTrans('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}' );\n",
                CurrentOrder.OrderId.ToString(), "", Math.Round(CurrentOrder.Total, 2), Math.Round(CurrentOrder.Tax, 2), Math.Round(CurrentOrder.ShippingCost, 2),
                GetEncodedJS(CurrentOrder.CustomerInfo.BillingAddress.City), 
                GetEncodedJS(CurrentOrder.CustomerInfo.BillingAddress.StateProvinceName), CurrentOrder.CustomerInfo.BillingAddress.CountryCode);

            foreach (Sku sku in CurrentOrder.SkuItems)
            {
                sbGAPixel.AppendFormat("pageTracker._addItem('{0}','{1}','{2}','{3}','{4}','{5}');\n",
                    CurrentOrder.OrderId.ToString(), GetEncodedJS(sku.SkuCode), GetEncodedJS(sku.Title), "",
                    Math.Round(Convert.ToDouble(sku.InitialPrice), 2), sku.Quantity.ToString());
            }

            litGAReceiptPixel.Text = sbGAPixel.ToString();
        }

        private void SetCurrentOrder()
        {
            int orderId = 0;
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else if (CartContext != null)
            {
                orderId = CartContext.OrderId;
            }

            CurrentOrder = new OrderManager().GetOrderDetails(orderId, true);
            CurrentOrder.LoadAttributeValues();
        }

    }
}