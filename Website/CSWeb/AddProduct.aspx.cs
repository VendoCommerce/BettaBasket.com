using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.ShoppingManagement;
using CSBusiness.CustomerManagement;
using CSBusiness.Resolver;
using CSBusiness.OrderManagement;
using CSWeb.C2.Store;
using CSCore.DataHelper;
using CSWeb.Root.Store;

namespace CSWeb.C2.Store
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected int skuId, cId, dId=0, qId=1;
        protected CSBusiness.ShoppingManagement.Cart cartObject;
        public ClientCartContext clientData;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!Page.IsPostBack)
            {
                if (Request.Params["PId"] != null)
                    skuId = Convert.ToInt32(Request.Params["PId"]);

                if(Request.Params["CId"] != null)
                    cId = Convert.ToInt32(Request.Params["CId"]);

                if (Request.Params["DId"] != null)
                    dId = Convert.ToInt32(Request.Params["DId"]);

                if (Request.Params["QId"] != null)
                    qId = Convert.ToInt32(Request.Params["QId"]);

                if(skuId > 0)
                {
                    
                    if (cId == (int)ShoppingCartType.SingleCheckout)
                    {
                        clientData = (ClientCartContext)Session["ClientOrderData"];
                        cartObject = new CSBusiness.ShoppingManagement.Cart();
                        cartObject.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }

                        cartObject.ShippingAddress = clientData.CustomerInfo.BillingAddress;
                        cartObject.Compute();
                        cartObject.ShowQuantity = false;
                        clientData.CartInfo = cartObject;

                        //Sri Comment: OverrideSetting for Database configuration
                        if (CSFactory.OrderProcessCheck() == (int) OrderProcessTypeEnum.InstantOrderProcess)
                        {
                            int orderId = CSResolve.Resolve<IOrderService>().SaveOrder(clientData);
                            if (orderId > 0)
                            {
                                //remove Customer Data and Payment Data in session object
                                clientData.ResetData();
                                clientData.OrderId = orderId;
                                Session["ClientOrderData"] = clientData;

                                
                            }
                            if (OrderHelper.AuthorizeOrder(orderId) == true)
                            {
                                Response.Redirect("CheckoutThankYou.aspx?oId=" + orderId);
                            }
                            else
                                Response.Redirect("CardDecline.aspx?failedAuth=1&orderID=" + orderId);

                            Response.Redirect("PostSale.aspx");
                        }

                        
                    }
                    else if (cId == (int)ShoppingCartType.ShippingCreditCheckout)
                    {
                        clientData = (ClientCartContext)Session["ClientOrderData"];
                        cartObject = new CSBusiness.ShoppingManagement.Cart();
                        cartObject.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }
                        cartObject.ShippingAddress = clientData.CustomerInfo.BillingAddress;
                        cartObject.Compute();
                        cartObject.ShowQuantity = false;
                        clientData.CartInfo = cartObject;
                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("cart.aspx");
                    }

                    else
                    {

                        //we may set this object in index page to capture request information
                        if (Session["ClientOrderData"] == null)
                        {
                            clientData = new ClientCartContext();
                            clientData.CartInfo = new CSBusiness.ShoppingManagement.Cart();
                        }
                        else
                        {
                            clientData = (ClientCartContext)Session["ClientOrderData"];
                            if(clientData.CartInfo == null)
                                clientData.CartInfo = new CSBusiness.ShoppingManagement.Cart();
                        }

                        clientData.CartInfo.AddItem(skuId, qId, true, false);
                        if (dId > 0)
                        {
                            bool settingVal = Convert.ToBoolean(ConfigHelper.ReadAppSetting("DisCountCardDisplay", "false"));
                            cartObject.AddItem(dId, qId, settingVal, false);
                        }
                        clientData.CartInfo.Compute();
                        clientData.CartInfo.ShowQuantity = false;
                
                        Session["ClientOrderData"] = clientData;
                        Response.Redirect("cart.aspx");
                    }
                    
                }
                
                
            }
        }
    }
}

