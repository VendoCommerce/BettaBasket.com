using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Diagnostics;
using System.Data;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Collections;
using System.Globalization;
using Com.ConversionSystems.DataAccess;
using Com.ConversionSystems.Utility;
// using Com.ConversionSystems.GoldCanyon;
// using ConversionSystems.Providers;
// using ConversionSystems.Providers.MediaChase.OrderProcessing;
using AhhBraService = BettaBasketBatch.com.shoptvcanada.ws;
using Moulton = AhhBraBatch.Application_Code.BusinessObjects;
using CSBusiness.OrderManagement;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.Resolver;
namespace Com.ConversionSystems
{
    public class Batch : Com.ConversionSystems.UI.BasePage
    {
        private DataTable _dtOrders = null;
        private DataTable _dtRejectedOrders = null;
        private ArrayList AllOrders = new ArrayList();
        private DataTable _dtCustomerBillingAddress = null;
        private DataTable _dtCustomerShippingAddress = null;
        private DataTable _dtOrderSKU = null;
        private DataTable _dtSalesTaxRate = null;
        private int _intOrderID = 0;
        private int _intBillingAddress = 0;
        private int _intShippingAddress = 0;
        int _intRecords = 0;
        private Hashtable UpSell = new Hashtable();
        private string _srtPath = Helper.AppSettings["FileDirectoryPath"];
        private string filenameCustomer = "";
        private string filenameOrder = "";
        private string filenameDetail = "";
        private string ActualfilenameCustomer = "";
        public static string file1;
        public static string file2;
        public static string file3;
        public static ArrayList PaymentPlanSKU = null;
        public static int count1;
        public static int count2;
        public static int count3;
        public string _TransactionId = "";
        private string ActualfilenameOrder = "";
        private string ActualfilenameDetail = ""; 
        LogData log = new LogData();      
        string AuthCode = "";
        string TransactionCode = "";
        private DataTable Orders
        {
            get
            {
                   //DAL.SQLServer.GetOrdersForXMLBatch(DateTime.ParseExact (DateTime.Now.ToString("yyyyMMdd"), "yyyyMMdd",CultureInfo.InvariantCulture), out _dtOrders);
                    DAL.SQLServer.GetOrdersForXMLBatch(out _dtOrders);
                    //DAL.SQLServer.GetOrdersForXMLBatch(DateTime.Now.AddDays(-1), out _dtOrders);
                    //DAL.SQLServer.GetOrdersForXMLBatch(new DateTime(2009, 06, 29), out _dtOrders);
                
                return _dtOrders;
           } 
        }        
        private DataTable RejectedOrders
        {
            get
            {
                if (_dtRejectedOrders == null)
                {
                    //DAL.SQLServer.GetOrdersForXMLBatch(DateTime.ParseExact (DateTime.Now.ToString("yyyyMMdd"), "yyyyMMdd",CultureInfo.InvariantCulture), out _dtOrders);
                    DAL.SQLServer.GetRejectedOrdersForXMLBatch(out _dtRejectedOrders);
                    //DAL.SQLServer.GetOrdersForXMLBatch(DateTime.Now.AddDays(-1), out _dtOrders);
                    //DAL.SQLServer.GetOrdersForXMLBatch(new DateTime(2009, 06, 29), out _dtOrders);
                }
                return _dtRejectedOrders;
            }
        }
        private DataTable CustomerBillingAddress
        {
            get
            {
                if (_dtCustomerBillingAddress == null)
                {
                    DAL.SQLServer.GetCustomerAddress(_intBillingAddress, out _dtCustomerBillingAddress);
                }
                return _dtCustomerBillingAddress;
            }
        }
        private DataTable CustomerShippingAddress
        {
            get
            {
                if (_dtCustomerShippingAddress == null)
                {
                    DAL.SQLServer.GetCustomerAddress(_intShippingAddress, out _dtCustomerShippingAddress);
                }
                return _dtCustomerShippingAddress;
            }
        }
        private DataTable OrderSKU
        {
            get
            {
                if (_dtOrderSKU == null)
                {
                    DAL.SQLServer.GetOrderSKU(_intOrderID, out _dtOrderSKU);
                }
                return _dtOrderSKU;
            }
        }
        //public void DoEncryption()
        //{
        //    //Check this before going forward completely
        //    string EncryptionFileKey = "C:\\enc\\encryptionkey.asc";
        //    PGPEncryption _oEncrypt = new PGPEncryption();
        //    //_oEncrypt.Encrypt(filename,EncryptionFileKey,filename);
        //}
        
        public static string fixstring(object s1)
        {
            string s = "";
            if (s1 != null) { s = s1.ToString(); }

            s = s.Replace("&", "&amp;");
            s = s.Replace("<", "&lt;");
            s = s.Replace(">", "&gt;");
            s = s.Replace(((char)(34)).ToString(), "&quot;");
            s = s.Replace("'", "&apos;");
            return s;

        }
        public static string fixQuot(object s1)
        {
            string s = "";
            if (s1 != null) { s = s1.ToString(); }
            s = s.Replace("'", "&apos;");
            return s;

        }

        private DataSet getsql(string s)
        {
            SqlConnection conn = new SqlConnection(Helper.SQLServerDAO["mode"].ToString());
            conn.Open();
            SqlDataAdapter adp = new SqlDataAdapter(s, conn);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            conn.Close();
            return ds;
        }
        //private void runsql(string s)
        //{
        //    SqlConnection conn = new SqlConnection(Helper.SQLServerDAO["mode"].ToString());
        //    conn.Open();
        //    SqlCommand cm = new SqlCommand(s, conn);
        //    cm.CommandType = CommandType.Text;
        //    cm.ExecuteNonQuery();
        //    conn.Close();
        //}        
        public bool DoAuthorization_Canada(Order orderItem, bool AuthNeeded)
        {
            if (!AuthNeeded)
            {
                return true;
            }
            bool auth = true;
            String post_url = "https://secure.authorize.net/gateway/transact.dll";

            Hashtable post_values = new Hashtable();

            //the API Login ID and Transaction Key must be replaced with valid values
            post_values.Add("x_login", "7R8Gr7evY4qz");
            post_values.Add("x_tran_key", "74f8P37Rjz9u7vPY");

            post_values.Add("x_delim_data", "TRUE");
            post_values.Add("x_delim_char", '|');
            post_values.Add("x_relay_response", "FALSE");

            post_values.Add("x_type", "AUTH_ONLY");
            post_values.Add("x_method", "CC");

            string cc = orderItem.CreditInfo.CreditCardNumber;
            post_values.Add("x_card_num", cc);
            post_values.Add("x_exp_date", orderItem.CreditInfo.CreditCardExpired.ToString("MMyy"));
            post_values.Add("x_test_request", "FALSE");
            post_values.Add("x_amount", Math.Round(Convert.ToDouble(orderItem.Total), 2));
            post_values.Add("x_description", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.FirstName) + " " + CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.LastName) + "PlugNSafe.com - CS");

            post_values.Add("x_first_name", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.FirstName));
            post_values.Add("x_last_name", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.LastName));
            post_values.Add("x_address", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.Address1));
            post_values.Add("x_state", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.StateProvinceName));
            post_values.Add("x_zip", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.ZipPostalCode));
            post_values.Add("x_country", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.CountryCode).Trim());
            // Additional fields can be added here as outlined in the AIM integration
            // guide at: http://developer.authorize.net

            // This section takes the input fields and converts them to the proper format
            // for an http post.  For example: "x_login=username&x_tran_key=a1B2c3D4"
            String post_string = "";
            foreach (DictionaryEntry field in post_values)
            {
                post_string += field.Key + "=" + field.Value + "&";
            }
            post_string = post_string.TrimEnd('&');

            // create an HttpWebRequest object to communicate with Authorize.net
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(post_url);
            objRequest.Method = "POST";
            objRequest.ContentLength = post_string.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";

            // post data is sent as a stream
            StreamWriter myWriter = null;
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(post_string);
            myWriter.Close();

            // returned values are returned as a stream, then read into a string
            String post_response;
            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader responseStream = new StreamReader(objResponse.GetResponseStream()))
            {
                post_response = responseStream.ReadToEnd();
                responseStream.Close();
            }

            // the response string is broken into an array
            // The split character specified here must match the delimiting character specified above
            Array response_array = post_response.Split('|');

            // the results are output to the screen in the form of an html numbered list.
            int i = 0;
            foreach (string value in response_array)
            {
                i++;
                if (i == 1)
                {
                    if (value != "1")
                    {
                        auth = false;
                    }
                }
                if (i == 7)
                {
                    TransactionCode = value;
                    AuthCode = value;
                }
            }
            // individual elements of the array could be accessed to read certain response
            // fields.  For example, response_array[0] would return the Response Code,
            // response_array[2] would return the Response Reason Code.
            // for a list of response fields, please review the AIM Implementation Guide        

            if (auth)
            {
                new OrderManager().SaveOrder(orderItem.OrderId, TransactionCode, AuthCode, 4); //Auth Accepted 
            }
            else
            {
                new OrderManager().SaveOrder(orderItem.OrderId, TransactionCode, AuthCode, 7); //Auth Rejected
                try {
                    sendDeclineEmail(orderItem.Email, orderItem.CustomerInfo.BillingAddress.FirstName, orderItem.CustomerInfo.BillingAddress.LastName, "");
                }
                catch { }
            }
            // runsql("update [order] set authorizationcode = '" + AuthCode + "', confirmationcode='" + TransactionCode + "' where orderid=" + orderItem.OrderId);
            return auth;

        }
        public bool DoAuthorization_US(Order orderItem, bool AuthNeeded)
        {
            if (!AuthNeeded)
            {
                return true;
            }
            bool auth = true;            
            String post_url = "https://secure.authorize.net/gateway/transact.dll";

            Hashtable post_values = new Hashtable();

            //the API Login ID and Transaction Key must be replaced with valid values
            post_values.Add("x_login", "3NTm97gMrx");
            post_values.Add("x_tran_key", "6T5sM69VNHa5z4MD");
            
            post_values.Add("x_delim_data", "TRUE");
            post_values.Add("x_delim_char", '|');
            post_values.Add("x_relay_response", "FALSE");

            post_values.Add("x_type", "AUTH_ONLY");
            post_values.Add("x_method", "CC");

            string cc = orderItem.CreditInfo.CreditCardNumber;
            post_values.Add("x_card_num", cc);
            post_values.Add("x_exp_date", orderItem.CreditInfo.CreditCardExpired.ToString("MMyy"));
            post_values.Add("x_test_request", "FALSE");
            post_values.Add("x_amount", Math.Round(Convert.ToDouble(orderItem.Total), 2));
            post_values.Add("x_description", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.FirstName) + " " + CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.LastName) + "PlugNSafe.com - CS");

            post_values.Add("x_first_name", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.FirstName));
            post_values.Add("x_last_name", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.LastName));
            post_values.Add("x_address", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.Address1));
            post_values.Add("x_state", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.StateProvinceName));
            post_values.Add("x_zip", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.ZipPostalCode));            
            post_values.Add("x_country", CommonHelper.ClearAccents(orderItem.CustomerInfo.BillingAddress.CountryCode).Trim());
            // Additional fields can be added here as outlined in the AIM integration
            // guide at: http://developer.authorize.net

            // This section takes the input fields and converts them to the proper format
            // for an http post.  For example: "x_login=username&x_tran_key=a1B2c3D4"
            String post_string = "";
            foreach (DictionaryEntry field in post_values)
            {
                post_string += field.Key + "=" + field.Value + "&";
            }
            post_string = post_string.TrimEnd('&');

            // create an HttpWebRequest object to communicate with Authorize.net
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(post_url);
            objRequest.Method = "POST";
            objRequest.ContentLength = post_string.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";

            // post data is sent as a stream
            StreamWriter myWriter = null;
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(post_string);
            myWriter.Close();

            // returned values are returned as a stream, then read into a string
            String post_response;
            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
            using (StreamReader responseStream = new StreamReader(objResponse.GetResponseStream()))
            {
                post_response = responseStream.ReadToEnd();
                responseStream.Close();
            }

            // the response string is broken into an array
            // The split character specified here must match the delimiting character specified above
            Array response_array = post_response.Split('|');

            // the results are output to the screen in the form of an html numbered list.
            int i = 0;
            foreach (string value in response_array)
            {
                i++;
                if (i == 1)
                {
                    if (value !="1")
                    {
                        auth = false;
                    }
                }
                if (i == 7)
                {
                    TransactionCode = value;
                    AuthCode = value;
                }
            }
            // individual elements of the array could be accessed to read certain response
            // fields.  For example, response_array[0] would return the Response Code,
            // response_array[2] would return the Response Reason Code.
            // for a list of response fields, please review the AIM Implementation Guide        
           
            if (auth)
            {
                new OrderManager().SaveOrder(orderItem.OrderId, TransactionCode, AuthCode, 4); //Auth Accepted 
            }
            else
            {
                new OrderManager().SaveOrder(orderItem.OrderId, TransactionCode, AuthCode, 7); //Auth Rejected
                try
                {
                    sendDeclineEmail(orderItem.Email, orderItem.CustomerInfo.BillingAddress.FirstName, orderItem.CustomerInfo.BillingAddress.LastName, "");
                }
                catch { }
            }
            // runsql("update [order] set authorizationcode = '" + AuthCode + "', confirmationcode='" + TransactionCode + "' where orderid=" + orderItem.OrderId);
            return auth;

        }
        private static string UTF8ByteArrayToString(byte[] characters)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            string constructedString = encoding.GetString(characters);
            return (constructedString);
        }
        public bool DoBatch()
        {
            decimal orderTotal = 0;
            decimal tax = 0;
            decimal subtotal = 0;
            decimal shipping = 0;
            bool _breturn = false;
            int LineIdCounter = 0;
            string skuCode = "";
            Hashtable SkyesInventory = new Hashtable();
            
            try
            {
                Hashtable AllItems = new OrderManager().GetBatchProcessOrders();
                List<Order> orders = (List<Order>)AllItems["allOrders"];
                List<Sku> OrderSkus = (List<Sku>)AllItems["allOrderSkus"];
                
                foreach (Order orderItem in orders)
                {
                    try
                    {
                        List<Sku> orderSkuItems = OrderSkus.FindAll(x => x.OrderId == orderItem.OrderId);

                        //System.Net.ServicePointManager.CertificatePolicy = new TrustAllCertificatePolicy();

                        _dtOrderSKU = null;
                        _dtCustomerBillingAddress = null;
                        _dtCustomerShippingAddress = null;
                        Moulton.Order _order = new Moulton.Order();
                        Moulton.OrderOrderHeader _OrderOrderHeader = new Moulton.OrderOrderHeader();
                        Moulton.OrderFinancial _OrderFinancial = new Moulton.OrderFinancial();

                        Order ord = new Order();
                        bool checkAuthNeeded = false;
                        _breturn = true;
                        LineIdCounter = 0;
                        _intOrderID = Convert.ToInt32(orderItem.OrderId);
                        AhhBraService.SalesOrder NewSalesOrder = new AhhBraService.SalesOrder();
                        _OrderOrderHeader.DATE_ORD = Convert.ToDateTime(orderItem.CreatedDate).ToString("yyyyMMdd");
                        _OrderOrderHeader.CSOURCE = Helper.AppSettings["CSOURCE"];
                        _OrderOrderHeader.PROJECT = Helper.AppSettings["PROJECT"];
                        _OrderOrderHeader.CMEDIA = Helper.AppSettings["CMEDIA"];

                        _OrderOrderHeader.GROUP_CODE = Helper.AppSettings["GROUPCODE"];                        
                        _OrderOrderHeader.CL_NO = Helper.AppSettings["CLNO"];

                        _OrderOrderHeader.PAY_TYPE = Helper.AppSettings["PAY_TYPE"];
                        _OrderOrderHeader.NUM_PYMNTS = Helper.AppSettings["NUMOFPAYMENTS"];
                        _OrderOrderHeader.UNIQUEID = "CSPS" + _intOrderID.ToString();
                        _OrderOrderHeader.HAS_FINANCIAL = "Y";                        
                        _OrderOrderHeader.SRC_CD = Helper.AppSettings["CSOURCE"];
                        if (orderItem.VersionName.ToLower().Equals("canada"))
                        {
                            _OrderOrderHeader.CL_NO = Helper.AppSettings["CANADA_CLNO"];
                            if (!DoAuthorization_Canada(orderItem, true))
                            {
                                continue;
                            }
                        }
                        else
                        {
                            bool _authReq = true;
                            if (orderItem.CreditInfo.AuthorizationCode != null)
                            {
                                if (orderItem.CreditInfo.AuthorizationCode.Length > 2)
                                {
                                    AuthCode = orderItem.CreditInfo.AuthorizationCode;
                                    TransactionCode = orderItem.CreditInfo.AuthorizationCode;
                                    _authReq = false;
                                }
                            }
                            else
                            {
                                AuthCode = "";
                                TransactionCode = "";
                            }
                            _OrderOrderHeader.CL_NO = Helper.AppSettings["ENGLISH_CLNO"];
                            if (!DoAuthorization_US(orderItem, _authReq))
                            {
                                continue;
                            }
                        }
                        //_OrderOrderHeader.CL_NO = "DR";//=++++++++++++++++++++++++





                        //Order payment Information
                        _OrderOrderHeader.CREDCD = orderItem.CreditInfo.CreditCardNumber;
                        _OrderOrderHeader.EXPDT = orderItem.CreditInfo.CreditCardExpired.ToString("MMyy");
                        _OrderOrderHeader.CVV2 = orderItem.CreditInfo.CreditCardCSC;
                        _OrderFinancial.CVV2_ID = orderItem.CreditInfo.CreditCardCSC;
                        _OrderFinancial.TRANSACTION_ID = AuthCode;

                        _OrderOrderHeader.TAX_AMOUNT = orderItem.Tax.ToString();
                        _OrderOrderHeader.SHIPPING_HANDLING_AMOUNT = orderItem.ShippingCost.ToString();
                        _OrderOrderHeader.SALE_AMOUNT = orderItem.SubTotal.ToString();
                        _OrderOrderHeader.TOTAL_CHARGE_AMOUNT = (orderItem.Tax + orderItem.ShippingCost + orderItem.SubTotal).ToString();

                        //Billing Information
                        _OrderOrderHeader.BILL_TO_COMPANY = orderItem.CustomerInfo.BillingAddress.Company;
                        _OrderOrderHeader.BILL_TO_F_NAME = orderItem.CustomerInfo.BillingAddress.FirstName;
                        _OrderOrderHeader.BILL_TO_L_NAME = orderItem.CustomerInfo.BillingAddress.LastName;
                        _OrderOrderHeader.BILL_TO_ADDR_1 = orderItem.CustomerInfo.BillingAddress.Address1;
                        _OrderOrderHeader.BILL_TO_ADDR_2 = orderItem.CustomerInfo.BillingAddress.Address2;
                        _OrderOrderHeader.BILL_TO_CITY = orderItem.CustomerInfo.BillingAddress.City;
                        _OrderOrderHeader.BILL_TO_ST = StateManager.GetAllStates(orderItem.CustomerInfo.BillingAddress.CountryId).Find(x =>
                        {
                            return x.StateProvinceId == orderItem.CustomerInfo.BillingAddress.StateProvinceId;
                        }).Abbreviation.Trim();
                        _OrderOrderHeader.BILL_TO_ZIP = orderItem.CustomerInfo.BillingAddress.ZipPostalCode;
                        _OrderOrderHeader.BILL_TO_COUNTRY_CODE = orderItem.CustomerInfo.BillingAddress.CountryCode.Trim();

                        //Shipping nformation
                        _OrderOrderHeader.COMPANY = orderItem.CustomerInfo.ShippingAddress.Company;
                        _OrderOrderHeader.F_NAME = orderItem.CustomerInfo.ShippingAddress.FirstName;
                        _OrderOrderHeader.L_NAME = orderItem.CustomerInfo.ShippingAddress.LastName;
                        _OrderOrderHeader.PHONE = orderItem.CustomerInfo.ShippingAddress.PhoneNumber;
                        _OrderOrderHeader.ADDR_1 = orderItem.CustomerInfo.ShippingAddress.Address1;
                        _OrderOrderHeader.ADDR_2 = orderItem.CustomerInfo.ShippingAddress.Address2;
                        _OrderOrderHeader.CITY = orderItem.CustomerInfo.ShippingAddress.City;
                        _OrderOrderHeader.ST = StateManager.GetAllStates(orderItem.CustomerInfo.ShippingAddress.CountryId).Find(x =>
                        {
                            return x.StateProvinceId == orderItem.CustomerInfo.ShippingAddress.StateProvinceId;
                        }).Abbreviation.Trim();
                        _OrderOrderHeader.ZIP = orderItem.CustomerInfo.ShippingAddress.ZipPostalCode;
                        _OrderOrderHeader.COUNTRY_CODE = orderItem.CustomerInfo.ShippingAddress.CountryCode.Trim();
                        _OrderOrderHeader.EMAIL = orderItem.Email;

                        int count = 1;
                        int Quantity = 0;
                        Moulton.OrderOrderHeader[] _OrderOrderHeaderArray = new Moulton.OrderOrderHeader[1];
                        Moulton.OrderOrderDetailLineItem[] objLineItems = new Moulton.OrderOrderDetailLineItem[orderSkuItems.Count];
                        Moulton.OrderFinancial[] _OrderFinancialArray = new Moulton.OrderFinancial[1];

                        foreach (Sku OrderSKUItem in orderSkuItems)
                        {

                            Moulton.OrderOrderDetailLineItem _OrderOrderDetailLineItem = new Moulton.OrderOrderDetailLineItem();
                            _OrderOrderDetailLineItem.OFFER_CODE = OrderSKUItem.SkuCode;
                            //_OrderOrderDetailLineItem.OFFER_CODE = "DMDR191-01";//=++++++++++++++++++++++++
                            _OrderOrderDetailLineItem.UNIT_PRICE = Math.Round(Convert.ToDouble(OrderSKUItem.FullPrice), 2).ToString();
                            //_OrderOrderDetailLineItem.UNIT_PRICE = Math.Round(Convert.ToDouble("29.95".ToString()), 2).ToString(); //=++++++++++++++++++++++++                               
                            _OrderOrderDetailLineItem.CONTINUITY_FLAG = Helper.AppSettings["CONTINUITYFLAG"];
                            _OrderOrderDetailLineItem.OFFER_DESCRIPTION = OrderSKUItem.Title;
                            _OrderOrderDetailLineItem.QUANTITY_ORDERED = OrderSKUItem.Quantity.ToString();
                            _OrderOrderDetailLineItem.TAXABLE_FLAG = Helper.AppSettings["TAXABLEFLAG"];

                            objLineItems[count - 1] = _OrderOrderDetailLineItem;

                            //Moulton.OrderOrderDetailLineItem[][] n8 = new Moulton.OrderOrderDetailLineItem[4][] { new Moulton.OrderOrderDetailLineItem[] { _OrderOrderDetailLineItem }};
                            //n8[0][0] = _OrderOrderDetailLineItem ;

                            _OrderOrderHeader.NUM_PYMNTS = "1";
                            
                            count++;
                        }
                        _OrderOrderHeaderArray[0] = _OrderOrderHeader;
                        _OrderFinancialArray[0] = _OrderFinancial;


                        _order.OrderDetail = objLineItems;
                        _order.OrderHeader = _OrderOrderHeaderArray;
                        _order.Financial = _OrderFinancialArray;
                         

                        string xmlString = null;
                        MemoryStream memoryStream = new MemoryStream();
                        XmlSerializer xs = new XmlSerializer(typeof(Moulton.Order));
                        XmlTextWriter xmlTextWriter = new XmlTextWriter(memoryStream, Encoding.UTF8);
                        xs.Serialize(xmlTextWriter, _order);
                        memoryStream = (MemoryStream)xmlTextWriter.BaseStream;
                        xmlString = UTF8ByteArrayToString(memoryStream.ToArray());

                        objLineItems = null;
                        string Response = "";
                        string sql = "";

                        try
                        {

                            BettaBasketBatch.com.qcmoultonordervision.ORDAPI _MoultonOrderAPI = new BettaBasketBatch.com.qcmoultonordervision.ORDAPI();
                            
                            XmlNode x = null;
                            x = _MoultonOrderAPI.OrderNewAPI("TMGC_CS", "XKSb73j3j3ddcjMn0b22", _OrderOrderHeader.GROUP_CODE, _OrderOrderHeader.CL_NO, _OrderOrderHeader.PROJECT, "new_order_TMGC", xmlString);
                            //ObjectToXml(NewSalesOrder, "C:\\batchstaging\\BatchProcesses\\NonoBatchFiles\\UK\\" + NewSalesOrder.MerchantOrderNumber.ToString() + ".xml"); //For Testing
                            //Response = oWS.ExportOrders(NewSalesOrder.B2BCustomerName, NewSalesOrder.B2BCustomerEmail, NewSalesOrder.B2BCustomerPassword, "", "", "SHP", "", "28511", "");
                            Response = x.InnerXml;
                            string s = getfromto(Response, "<Status>", "</Status>");

                            if (s.ToLower().Equals("true"))
                            {
                                string OMSOrderid = "";
                                OMSOrderid = getfromto(Response, "<Order>", "</Order>");
                                new OrderManager().SaveOrderInfo(orderItem.OrderId, 2, CommonHelper.ClearAccents(xmlString.Trim().ToLower().Replace("utf-8", "utf-16")), CommonHelper.ClearAccents(Response.Trim().ToLower().Replace("utf-8", "utf-16")));                              
                            }
                            else
                            {
                                new OrderManager().SaveOrderInfo(orderItem.OrderId, 2, CommonHelper.ClearAccents(xmlString.Trim().ToLower().Replace("utf-8", "utf-16")), CommonHelper.ClearAccents(Response.Trim().ToLower().Replace("utf-8", "utf-16")));                                
                                //Send Email to admins
                                sendEmailToAdmin(Response, _intOrderID.ToString());
                            }
                        }
                        catch (Exception e) {
                            string test = "";
                        }
               
                    }
                    catch (Exception e)
                    {   
                    }
                }
                    log.LogToFile("File Successfully created ");
 
            }
            catch (Exception e)
            {
                log.LogToFile("Error creating file ---" + e.Message);
                _breturn = false;
                _dtOrderSKU = null;
                _dtCustomerBillingAddress = null;
                _dtCustomerShippingAddress = null;
                return _breturn;
            }
            return _breturn;
        }
        public static void ObjectToXml(object obj, string path_to_xml)
        {
            //serialize and persist it to it's file
            try
            {
                XmlSerializer ser = new XmlSerializer(obj.GetType());
                FileStream fs = File.Open(
                        path_to_xml,
                        FileMode.OpenOrCreate,
                        FileAccess.Write,
                        FileShare.ReadWrite);
                ser.Serialize(fs, obj);
                 
            }
            catch (Exception ex)
            {
                throw new Exception(
                        "Could Not Serialize object to " + path_to_xml,
                        ex);
            }
        }

        public string CheckField(string request)
        {
            request = ClearAccents(request.Replace(",", " "));

            return request + ",";
        }
        public string getfromto(string s22, string sa22, string sb22)
        {
            string s;
            string sa;
            string sb;

            s = s22.ToLower();
            sa = sa22.ToLower();
            sb = sb22.ToLower();


            string s1 = s;
            s1 = s1.Replace(sa, ((char)(200)).ToString());
            s1 = s1.Replace(sb, ((char)(201)).ToString());

            bool b = false;
            bool c = false;
            string s2 = "";
            for (int i = 0; i < s1.Length; i++)
            {
                if (c == false)
                {
                    if (s1[i].ToString() == ((char)(200)).ToString()) { b = true; c = true; }
                }
                if (s1[i].ToString() == ((char)(201)).ToString()) { b = false; }

                if (b == true)
                {
                    if ((s1[i].ToString() != ((char)(200)).ToString()) && (s1[i].ToString() != ((char)(201)).ToString()))
                    {
                        s2 += s1[i];
                    }
                }
            }
            return s2;

        }
        
        void RejectedOrdersCheck()
        {
            string FirstName = "";
            string LastName = "";
            try
            {
                foreach (DataRow _drRejectedOrder in RejectedOrders.Rows)
                {
                    if (_drRejectedOrder["OrderId"].ToString() != null)
                    {
                        DataSet ds = null;
                        ds = getsql("select * from [order] where orderid = " + _drRejectedOrder["OrderId"].ToString());
                        string email = ds.Tables[0].Rows[0]["Email"].ToString();
                        DataSet dsAddress = null;
                        dsAddress = getsql("select * from [Address] where Addressid = " + _drRejectedOrder["billingaddressid"].ToString());
                        FirstName = dsAddress.Tables[0].Rows[0]["FirstName"].ToString();
                        LastName = dsAddress.Tables[0].Rows[0]["LastName"].ToString();
                        try
                        {                            
                            sendDeclineEmail(email, FirstName, LastName, _drRejectedOrder["BankAccountName"].ToString());
                           // runsql("update [order] set orderstatusid = 5 where orderid= " + _drRejectedOrder["OrderId"].ToString()); //changing the orderstatus from 8 to 5 which indicates they are rejected.
                        }
                        catch 
                        {
                            Console.WriteLine("Error while sending rejected orders email.");                        
                        }

                    }

                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error while checking rejected orders -- " + e.Message);
            }

        }
        string fixempty(string s)
        {
            string s1 = s;
            if (s1 == "") { s1 = "0"; }
            return s1;
        }        
        string filtercc(string s)
        {
            string s1 = s;
            string sa = "";
            sa = getfromto(s, "<CardNumber>", "</CardNumber>");
            s1 = s1.Replace(sa, "----");
            return s1;
        }
        string fixquotes(string s)
        {
            string s1 = s;
            s1 = s1.Replace("'", "''");
            return s1;
        }
        static string HttpPost(string uri, string parameters)
        {
            // parameters: name1=value1&name2=value2	
            WebRequest webRequest = WebRequest.Create(uri);
            //string ProxyString = 
            //   System.Configuration.ConfigurationManager.AppSettings
            //   [GetConfigKey("proxy")];
            //webRequest.Proxy = new WebProxy (ProxyString, true);
            //Commenting out above required change to App.Config
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.Method = "POST";
            byte[] bytes = Encoding.ASCII.GetBytes(parameters);
            Stream os = null;
            try
            { // send the Post
                webRequest.ContentLength = bytes.Length;   //Count bytes to send
                os = webRequest.GetRequestStream();
                os.Write(bytes, 0, bytes.Length);         //Send it
            }
            catch (WebException ex)
            {
                Console.WriteLine("HttpPost: request error");
            }
            finally
            {
                if (os != null)
                {
                    os.Close();
                }
            }

            try
            { // get the response
                WebResponse webResponse = webRequest.GetResponse();
                if (webResponse == null)
                { return null; }
                StreamReader sr = new StreamReader(webResponse.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                Console.WriteLine("HttpPost: Response error");
            }
            return null;
        }
        public static void sendDeclineEmail(string DeclineToEmail, string FirstName, string LastName, string version)
        {
            StringBuilder sb = new StringBuilder();
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress(DeclineToEmail));
            message.From = new MailAddress("info@plugnsafe.com");
            string sendemailto1 = DeclineToEmail;

            message.Subject = "Unable to Process Your Order";
            sb.Append("Dear").Append(" ").Append(FirstName).Append(" ").Append(LastName).Append(",<br /><br />");
            sb.Append("Thank you for placing an order with Plug & Safe.<br /><br />");
            sb.Append("Unfortunately, we were not able to authorize your credit card and submit your order for processing.<br /><br />");
            sb.Append("Please visit our Website (http://www.plugnsafe.com) and place an order with a new card.<br /><br />");
            sb.Append("Thank you and have a great day!<br />");
            sb.Append("--------------------------------------------------------<br />");
            sb.Append("<br /><br />");
            sb.Append("Plug & Safe<br />");
            sb.Append("cs@plugnsafe.com<br />");

            string st;
            st = sb.ToString();

            st = st.Replace("~", ((char)(13)).ToString() + ((char)(10)).ToString());
            message.Body = st;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            Helper.SendMail(message);            
        }
        public static void sendEmailToAdmin(string OMSResponse, string Orderid)
        {
            StringBuilder sb = new StringBuilder();
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress(Helper.AppSettings["AdminEmail"]));
            message.CC.Add(new MailAddress(Helper.AppSettings["MonitorEmail"]));
            message.From = new MailAddress("info@ahhbra.com");
            
                message.Subject = "Alert - AhhBra.com - Unable to process Orderid = "+Orderid;
                sb.Append("Here is the response from Moulton. Please address this order:");
                sb.Append(OMSResponse);            

            string st;
            st = sb.ToString();

            st = st.Replace("~", ((char)(13)).ToString() + ((char)(10)).ToString());
            message.Body = st;
            message.IsBodyHtml = false;
            SmtpClient client = new SmtpClient();
            Helper.SendMail(message);
        }
        public static string ClearAccents(string text)
        {
            //url = Regex.Replace(url, @"\s+", "-");
            string stFormD = text.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();

            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(stFormD[ich]);
                }
            }

            return (sb.ToString());
        }
        // static string key1;
        // static Mediachase.eCF.BusLayer.Common.Util.EncryptionManager em;
        public static string fixpath(string s)
        {
            string s1 = s;
            if (s1.IndexOf(".csv") != -1) { s1 = s1.ToLower().Replace("nonobatchfiles", "nonobatchfiles1"); }
            return s1;
        }
        public static void encryptfile(string s)
        {

            string s21 = s;
            s21 = s21.Replace(".csv", "_csv.csv");

            string s2 = s;
            s2 = fixpath(s2);

            if (File.Exists(s2))
            {
                File.Delete(s2);
            }
            File.Move(s, s2);


            string s1;
            s1 = "-e -u --sign-~Aniketh Parmar <aniketh@conversionsystems.com>~ -r ~Susan Stevenson <susan.stevenson@talktomango.com>~ --always-trust --yes ~filepath~";            
            s1 = s1.Replace("~", ((char)(34)).ToString());
            s1 = s1.Replace("filepath", s2);
            Console.WriteLine("C:\\gnupg\\gpg.exe " + s1);

            string appname = "C:\\gnupg\\gpg.exe";
            string args1 = s1;

            runapp(appname, args1);

            if (File.Exists(s21))
            {
                File.Delete(s21);
            }
            File.Move(s2, s21);

            string st2z = s2;
            string st21z = s21;
            st2z = st2z.Replace(".csv", ".gpg");

            st21z = st21z.Replace(".csv", ".gpg");

            if (File.Exists(st21z))
            {
                File.Delete(st21z);
            }
            File.Move(st2z, st21z);
            


            string sta, stb;




            sta = st21z;
            stb = st21z;
            stb = stb.Replace(".gpg", ".pgp");

            

            if (File.Exists(stb))
            {
                File.Delete(stb);
            }
            File.Move(sta, stb);


            string stb1 = stb.ToLower();
            stb1 = stb1.Replace("batchstaging", "ftp");


            stb1 = stb1.Replace("_csv", ".csv");

            if (File.Exists(stb1))
            {
                File.Delete(stb1);
            }
            File.Move(stb, stb1);



            string s3 = s21;
            s3 = s3.Replace("_csv.csv", ".csv");
            if (File.Exists(s3))
            {
                File.Delete(s3);
            }
            File.Move(s21, s3);

        }
        public static string afterslash(string s)
        {
            string s1 = s;
            string s2 = "";
            bool b;

            b = false;

            int j;
            j = -1;


            for (int i = s.Length - 1; i >= 0; i--)
            {
                if ((s[i].ToString() == "\\") && (j == -1))
                {
                    j = i;
                }
            }

            for (int i = 0; i < s.Length; i++)
            {
                if ((s[i].ToString() == "\\") && i == j)
                {
                    b = true;
                }
                else
                {
                    if (b == true) { s2 += s[i]; }
                }
            }

            return s2;
        }
        public static void runapp(string appname, string args1)
        {
            ProcessStartInfo pi = new ProcessStartInfo(appname);
            pi.Arguments = args1;

            pi.UseShellExecute = false;
            pi.RedirectStandardOutput = true;

            Process p = Process.Start(pi);
            StreamReader sr = p.StandardOutput;

            String line;
            while ((line = sr.ReadLine()) != null)
            {
                Console.WriteLine("Read line: {0}", line);
            }
            p.WaitForExit();

        }
        public static int LineCount(string source)
        {
            if (source != null)
            {
                string text = source;
                int numOfLines = 0;
                
                    FileStream FS = new FileStream(source, FileMode.Open,
                       FileAccess.Read, FileShare.Read);
                    StreamReader SR = new StreamReader(FS);
                    while (text != null)
                    {
                        text = SR.ReadLine();
                        if (text != null)
                        {
                            ++numOfLines;
                        }
                    }
                    SR.Close();
                    FS.Close();
                    return (numOfLines);
                
   
            }
            else
            {
                // Handle a null source here
                return (0);
            }
        }
        public class clsPerson
        {
            public string FirstName;
            public string MI;
            public string LastName;
        }

        private void uploadFile(string FTPAddress, string filePath, string username, string password)
        {
            try
            {
                //Create FTP request
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(FTPAddress + "/" + Path.GetFileName(filePath));

                request.Method = WebRequestMethods.Ftp.UploadFile;
                request.Credentials = new NetworkCredential(username, password);
                request.UsePassive = true;
                request.UseBinary = true;
                request.KeepAlive = false;

                //Load the file
                FileStream stream = File.OpenRead(filePath);
                byte[] buffer = new byte[stream.Length];

                stream.Read(buffer, 0, buffer.Length);
                stream.Close();

                //Upload file
                Stream reqStream = request.GetRequestStream();
                reqStream.Write(buffer, 0, buffer.Length);
                reqStream.Close();
            }
            catch(Exception es)
            {
                //sendemail(filePath);
            }
        }
        public static void Main(string[] args)
        {
            //key1= System.Configuration.ConfigurationSettings.AppSettings["encryptionkey"];
            //Mediachase.eCF.BusLayer.Common.Configuration.FrameworkConfig.EncryptionPrivateKey = key1;
           // em = new Mediachase.eCF.BusLayer.Common.Util.EncryptionManager();
            
            Batch StartBatch = new Batch();
            Console.WriteLine("PlugNSafe Batch - Started");
            Console.WriteLine("Please Wait - ");
            StartBatch.DoBatch();            
            Console.WriteLine("PlugNSafe Batch  - End");
            Console.WriteLine("Task Completed - ");
            
        }
    }

    public class TrustAllCertificatePolicy : System.Net.ICertificatePolicy
    {
        public TrustAllCertificatePolicy()
        { }

        public bool CheckValidationResult(ServicePoint sp,
         System.Security.Cryptography.X509Certificates.X509Certificate cert, WebRequest req, int problem)
        {
            return true;
        }
    }



}
