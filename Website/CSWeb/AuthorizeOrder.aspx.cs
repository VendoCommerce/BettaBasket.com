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

namespace CSWeb.C2.Store
{
    public partial class AuthorizeOrder : ShoppingCartBasePage
    {	

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
                if (OrderHelper.AuthorizeOrder(CartContext.OrderId))
                {
                    Response.Redirect("CheckoutThankYou.aspx");
                }
                else
                {//While Testing I am sending this to ThankYou Page. But Ideally we should send this on rejection page.
                    Response.Redirect("CheckoutThankYou.aspx");
                }
					
			}
		}        
    }
}