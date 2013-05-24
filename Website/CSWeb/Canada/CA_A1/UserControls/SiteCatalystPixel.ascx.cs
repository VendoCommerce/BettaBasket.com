using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Web;
using CSBusiness.OrderManagement;
using CSBusiness;
using CSBusiness.Resolver;
using System.Text;

namespace CSWeb.Canada.CA_A1.UserControls
{
    public partial class SiteCatalystPixel : System.Web.UI.UserControl
    {
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
        }

        protected string State
        {
            get
            {
                if (CartContext != null && CartContext.CustomerInfo != null && CartContext.CustomerInfo.BillingAddress != null)
                {
                    return GetJsString(StateManager.GetStateName(CartContext.CustomerInfo.BillingAddress.StateProvinceId));
                }

                return null;
            }
        }

        protected string Zip
        {
            get
            {
                if (CartContext != null && CartContext.CustomerInfo != null && CartContext.CustomerInfo.BillingAddress != null)
                {
                    return CartContext.CustomerInfo.BillingAddress.ZipPostalCode;
                }

                return null;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetVersionName()
        {
            return GetJsString(CSBasePage.GetVersionName(false));
        }

        protected int GetVersionId()
        {
            return CSWeb.OrderHelper.GetVersion();
        }

        public string GetPageName(HttpContext context)
        {
            string _version = context.Request.Url.AbsolutePath.ToString().ToUpper();
            string _pageName = "Home";

            if (_version.IndexOf("INDEX") > -1) _pageName = "HOME";
            if (_version.IndexOf("FAQ") > -1) _pageName = "FAQS";
            if (_version.IndexOf("TESTIMONIALS") > -1) _pageName = "Testimonials";
            if (_version.IndexOf("CONTACT") > -1) _pageName = "Contact";
            if (_version.IndexOf("PRIVACY") > -1) _pageName = "Privacy";
            if (_version.IndexOf("RETURN") > -1) _pageName = "Return";
            if (_version.IndexOf("CART") > -1) _pageName = "Cart";

            if (_version.IndexOf("POSTSALE") > -1)
            {
                //if (!IsPostBack)
                //{
                //    _pageName = "One Pay Upsell";
                //}
                //else
                //{
                //    _pageName = "Cross Sells";
                // }

                if (Session["PostSaleLabelName"] != null)
                {
                    _pageName = Session["PostSaleLabelName"].ToString();
                }
            }
            if (_version.IndexOf("RECEIPT") > -1) _pageName = "Receipt";
            if (_version.IndexOf("DONOTGO") > -1) _pageName = "Exit Pop";
            if (_version.IndexOf("CART2") > -1) _pageName = "Exit Pop Cart";

            return GetJsString(_pageName);
        }

        public string GetEvents(HttpContext context)
        {
            string _event = "";
            string _version = context.Request.Url.AbsolutePath.ToString().ToUpper();
            if (_version.IndexOf("POSTSALE") > -1)
            {
                _event = "scCheckOut";
            }
            else if (_version.IndexOf("RECEIPT") > -1)
            {
                _event = "purchase";
            }
            else
            {
                _event = "";
            }


            return GetJsString(_event);
        }

        public string GetPurchaseID(HttpContext context)
        {
            string purchaseID = "";
            bool isOrderRelatedPage = false;
            string _version = context.Request.Url.AbsolutePath.ToString().ToUpper();

            if (_version.IndexOf("POSTSALE") > -1)
            {
                isOrderRelatedPage = true;
            }
            else if (_version.IndexOf("RECEIPT") > -1)
            {
                isOrderRelatedPage = true;
            }

            if (isOrderRelatedPage)
            {
                if (CartContext != null && CartContext.OrderId > 0)
                {
                    purchaseID = CartContext.OrderId.ToString();
                }
            }
            return GetJsString(purchaseID);
        }

        public string GetProductsDetails(HttpContext context)
        {
            string ProductDetails = "";

            bool isOrderRelatedPage = false;
            string _version = context.Request.Url.AbsolutePath.ToString().ToUpper();

            if (_version.IndexOf("POSTSALE") > -1)
            {
                isOrderRelatedPage = true;
            }
            else if (_version.IndexOf("RECEIPT") > -1)
            {
                isOrderRelatedPage = true;
            }

            if (isOrderRelatedPage)
            {
                if (CartContext != null && CartContext.OrderId > 0)
                {
                    Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(CartContext.OrderId);

                    StringBuilder sb2 = new StringBuilder();
                    bool isseconditem = false;
                    foreach (Sku sku in orderData.SkuItems)
                    {
                        if (isseconditem)
                        {
                            sb2.Append(",");
                        }
                        sb2.Append(";@productname@;@qty@;@totalprice@");
                        StringBuilder prodname = new StringBuilder();
                        prodname.Append(sku.Title);
                        prodname.Replace(",", "");
                        sb2.Replace("@productname@", prodname.ToString());
                        sb2.Replace("@qty@", sku.Quantity.ToString());
                        sb2.Replace("@totalprice@", Math.Round(Convert.ToDouble(sku.InitialPrice), 2).ToString());
                        isseconditem = true;
                    }
                    ProductDetails = sb2.ToString();
                }
            }

            return GetJsString(ProductDetails);
        }

        public string GetJsString(string str)
        {
            return str.Replace("\"", "\\\"");
        }
    }
}