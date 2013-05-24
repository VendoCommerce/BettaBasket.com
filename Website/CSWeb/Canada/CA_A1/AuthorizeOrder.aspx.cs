using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using CSBusiness.PostSale;
using CSBusiness;
using System.Text.RegularExpressions;
using CSCore.Utils;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;
using CSWeb.Root.Store;

namespace CSWeb.Canada.CA_A1.C2.Store
{
    public partial class AuthorizeOrder : ShoppingCartBasePage
    {
        int orderId = 0;
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["oid"] != null)
                {
                    orderId = Convert.ToInt32(Request["oid"].ToString());
                }
                else
                {
                    orderId = CartContext.OrderId;
                }

                Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId, true);

                if (orderData.CreditInfo.CreditCardNumber == "4444333322221111")
                {
                    Response.Redirect("Receipt.aspx", true);
                }
                else if (orderData.CreditInfo.CreditCardNumber == "4111111111111111")
                {
                    Response.Redirect("CardDecline.aspx", true);
                }

                if (CSFactory.GetSitePreference().PaymentGatewayService)
                {
                    if (OrderHelper.AuthorizeOrder(CartContext.OrderId))
                    {
                        Response.Redirect("Receipt.aspx", true);
                    }
                    else
                    {//While Testing I am sending this to ThankYou Page. But Ideally we should send this on rejection page.
                        Response.Redirect("CardDecline.aspx", true);
                    }
                }
                else
                {
                    Response.Redirect("Receipt.aspx", true);
                }
            }
        }              
    }
}