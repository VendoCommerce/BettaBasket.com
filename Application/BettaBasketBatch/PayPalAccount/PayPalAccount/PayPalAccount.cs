using System;
using System.IO;
using System.Net;
using System.Xml;
using System.Collections.Generic;
using System.Text;
using EBS.IntegrationServices.Providers.PaymentProviders;


namespace EBS.IntegrationServices.Providers.PaymentProviders.PayPal
{
    public class PayPalAccount : GatewayProvider
    {

        #region Private Members

        private static string m_ProviderSection = "PaymentProvider";
        private static ProviderConfiguration m_ProviderConfiguration = ProviderConfiguration.GetProviderConfiguration(m_ProviderSection);
        public static Provider objProvider = null;
        private static GatewaySettings gatewaySettings = null;
        private static string errRequiredNode = "A required gateway node does not exist: {0}";

        #endregion

        #region Public Methods

        public PayPalAccount()
        {
            objProvider = m_ProviderConfiguration.Providers[m_ProviderConfiguration.DefaultProvider];
        }

        private static void ThrowRequiredNodeError(string nodeName)
        {
            throw new GatewayException(string.Format(errRequiredNode, nodeName));
        }

        private static void GetSettings()
        {

            XmlDocument xmlDoc = new XmlDocument();
            XmlNode xmlNode;

            try
            {
                //Load provider object from configuration
                objProvider = m_ProviderConfiguration.Providers[m_ProviderConfiguration.DefaultProvider];

                gatewaySettings = new GatewaySettings();

                //get transaction url attribute
                gatewaySettings.TransactionURL = objProvider.transactionUrl;
                gatewaySettings.Login = objProvider.login;
                gatewaySettings.TransactionKey = objProvider.transactionKey;
                gatewaySettings.DelimData = objProvider.delimitedData.ToString();
                gatewaySettings.DelimChar = objProvider.delimitedCharacter;
                gatewaySettings.Version = objProvider.version;
                gatewaySettings.TestMode = objProvider.transactionTest.ToString();
                gatewaySettings.DeviceType = objProvider.deviceType;
                gatewaySettings.MarketType = objProvider.marketType;                

                if (string.IsNullOrEmpty(gatewaySettings.TransactionURL))
                {
                    throw new GatewayException("TransactionURL cannot be null");
                }

                if (string.IsNullOrEmpty(gatewaySettings.Login))
                {
                    throw new GatewayException("Login cannot be null");
                }

                
                if (string.IsNullOrEmpty(gatewaySettings.DelimData))
                {
                    gatewaySettings.DelimData = "TRUE";
                }

                if (string.IsNullOrEmpty(gatewaySettings.DelimChar))
                {
                    gatewaySettings.DelimData = "|";
                }

                if (string.IsNullOrEmpty(gatewaySettings.TestMode))
                {
                    gatewaySettings.DelimData = "FALSE";
                }


            }
            catch (Exception ex)
            {
                throw new GatewayException("An error occured while reading the gateway settings", ex);
            }

        }

        public override Response PerformRequest(Request request)
        {

            Response response = new Response();
            StreamWriter streamWriter = null;
            StreamReader streamReader = null;
            string strPost = string.Empty;

            if (gatewaySettings == null)
            {
                //Load settings if they have not been loaded
                PayPalAccount.GetSettings();
            }

            strPost = BuildRequestPost(request);

            //Initialize & populate HTTP request object
            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(gatewaySettings.TransactionURL);

            //set header attributes
            objRequest.Method = "POST";
            objRequest.ContentLength = strPost.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";

            try
            {

                //write post for request to url
                streamWriter = new StreamWriter(objRequest.GetRequestStream());
                streamWriter.Write(strPost);

            }
            catch (Exception ex)
            {
                //error while writing post
                throw new GatewayException("An exception occured while getting the request stream for the gateway", ex);
            }
            finally
            {
                streamWriter.Close();
            }

            HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();

            try
            {

                //read response from request
                streamReader = new StreamReader(objResponse.GetResponseStream());

                response = ParseResponse(streamReader.ReadToEnd());

            }
            catch (Exception ex)
            {
                throw new GatewayException("An exception occured while getting the response stream for the gateway", ex);
            }
            finally
            {
                streamReader.Close();
            }

            return response;

        }
        public override Response PerformVoidRequest(Request request)
        {

            Response response = new Response();
            return response;

        }

        protected string BuildRequestPost(Request request)
        {

            string NameValueFormat = "{0}={1}";

            List<string> aryPostParams = new List<string>();
                    

            //Create parameters from objProvider settings
            aryPostParams.Add(string.Format(NameValueFormat, "user", objProvider.login));
            aryPostParams.Add(string.Format(NameValueFormat, "pwd", objProvider.Password));
            aryPostParams.Add(string.Format(NameValueFormat, "partner", objProvider.partner));
            aryPostParams.Add(string.Format(NameValueFormat, "vendor", objProvider.vendor));
            


            //Create parameters from request

            try
            {

                if ((request.RequestType == PaymentRequestType.V ) && request.TransactionID.Trim().Length == 0)
                {
                    throw new GatewayException("This request type requires a valid transaction id");
                }


               
                if (request.Amount > 0)
                {
                    aryPostParams.Add(string.Format("amt={0:.00}", request.Amount));
                }
                //load optional params
                aryPostParams.Add(string.Format(NameValueFormat, "trxtype", request.RequestType.ToString()));
                aryPostParams.Add(string.Format(NameValueFormat, "tender", request.MethodType.ToString()));
                aryPostParams.Add(string.Format(NameValueFormat, "comment1", request.TransactionDescription));
                aryPostParams.Add(string.Format("expdate={0:####}", request.ExpireDate));
                aryPostParams.Add(string.Format(NameValueFormat, "acct", request.CardNumber));
                aryPostParams.Add(string.Format(NameValueFormat, "cvv2", request.CardCvv));
                aryPostParams.Add(string.Format(NameValueFormat, "invnum", request.InvoiceNumber));

                
                if (request.CustomerID.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "CustomerNum", request.CustomerID));
                if (request.FirstName.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "firstname", request.FirstName));
                if (request.FirstName.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "lastname", request.LastName));
                if (request.Address1.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "street", request.Address1 + (string.IsNullOrEmpty(request.Address2) == false ? "+" + request.Address2 : string.Empty)));
                if (request.ZipCode.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "zip", request.ZipCode));
                if (request.City.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "city", request.City));
                if (request.State.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "state", request.State));
                if (request.Country.Trim().Length > 0) aryPostParams.Add(string.Format(NameValueFormat, "billtocountry", request.Country));

                bool testMode = false;
                bool.TryParse(objProvider.transactionTest.ToString(), out testMode);
                

            }
            catch (Exception ex)
            {

                throw new GatewayException(string.Format("An exception occured while creating the post parameters: {0}", ex.Message), ex);
            }

            return string.Join("&", aryPostParams.ToArray());

        }

        private Response ParseResponse(string GatewayResponse)
        {

            Response response = new Response();

            response.GatewayResponseRaw = GatewayResponse;

            string[] aryGatewayResponse = GatewayResponse.Split(Convert.ToChar(gatewaySettings.DelimChar));


            if (aryGatewayResponse.Length > 0)
            {
                switch (aryGatewayResponse[0].Split('=')[1])
                {
                    case "0":
                    case "000":
     
                        //Approved
                        response.ResponseType = TransactionResponseType.Approved;
                        break;
                    case "12":
                        //Declined
                        response.ResponseType = TransactionResponseType.Denied;
                        break;
                    default:
                        //Error
                        response.ResponseType = TransactionResponseType.Error;
                        break;
                }
               

                response.ReasonText = aryGatewayResponse[2].Split('=')[1];
                response.TransactionID = aryGatewayResponse[1].Split('=')[1];
                response.AuthCode = aryGatewayResponse[3].Split('=')[1];
                if (aryGatewayResponse[5].Split('=')[1].ToLower().Equals("y"))
                {
                    response.AvsResponse = TransactionAvsResponse.Match;
                }
                else
                {
                    response.AvsResponse = TransactionAvsResponse.NoMatch;
                }
                
               

            }
            else
            {
                response.ResponseType = TransactionResponseType.Error;
                response.ReasonText = "Unknown Error (" + aryGatewayResponse + ")";
            }

            return response;

        }

        #endregion

        private class GatewaySettings
        {

            #region Private Members

            private string m_Login;
            private string m_TransactionKey;
            private string m_DelimData = "TRUE";
            private string m_DelimChar;
            private string m_EncapChar;
            private string m_Version;
            private string m_RelayResponse = "FALSE";
            private string m_TransactionURL;
            private string m_TestMode = "TRUE";
            private string m_DuplicateWindow;
            private string m_EmailCustomer;
            private string m_MerchantEmail;
            private string m_CurrencyCode;
            private string m_MarketType = "";
            private string m_DeviceType = "";
            #endregion

            #region Public Properties
            public string CurrencyCode
            {
                get { return m_CurrencyCode; }
                set { m_CurrencyCode = value; }
            }


            public string MerchantEmail
            {
                get { return m_MerchantEmail; }
                set { m_MerchantEmail = value; }
            }

            public string EmailCustomer
            {
                get { return m_EmailCustomer; }
                set { m_EmailCustomer = value; }
            }


            public string DuplicateWindow
            {
                get { return m_DuplicateWindow; }
                set { m_DuplicateWindow = value; }
            }


            public string Login
            {
                get { return m_Login; }
                set { m_Login = value; }
            }

            public string TransactionKey
            {
                get { return m_TransactionKey; }
                set { m_TransactionKey = value; }
            }

            public string DelimData
            {
                get { return m_DelimData; }
                set { m_DelimData = value; }
            }

            public string DelimChar
            {
                get { return m_DelimChar; }
                set { m_DelimChar = value; }
            }

            public string EncapChar
            {
                get { return m_EncapChar; }
                set { m_EncapChar = value; }
            }

            public string Version
            {
                get { return m_Version; }
                set { m_Version = value; }
            }

            public string RelayResponse
            {
                get { return m_RelayResponse; }
            }

            public string TransactionURL
            {
                get { return m_TransactionURL; }
                set { m_TransactionURL = value; }
            }

            public string TestMode
            {
                get { return m_TestMode; }
                set { m_TestMode = value; }
            }
            public string MarketType
            {
                get { return m_MarketType; }
                set { m_MarketType = value; }
            }
            public string DeviceType
            {
                get { return m_DeviceType; }
                set { m_DeviceType = value; }
            }
            #endregion

        }

    }
}
