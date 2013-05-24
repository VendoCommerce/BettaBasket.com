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

namespace CSWeb.C2.Store
{
    public partial class PostSale : ShoppingCartBasePage
    {
        private List<int> AllTemplates
        {
            get { return ViewState["AllTemplates"] as List<int>; }
            set { ViewState["AllTemplates"] = value; }
        }

        private List<string> Skus
        {
            get { return ViewState["Skus"] as List<string>; }
            set { ViewState["Skus"] = value; }
        }

        private SkuLookupBag LookupBag
        {
            get { return ViewState["LookupBag"] as SkuLookupBag; }
            set { ViewState["LookupBag"] = value; }
        }

        private int CurrentTemplateIndex
        {
            get { return Convert.ToInt32(Session["CurrentTemplateIndex"]); }
            set { Session["CurrentTemplateIndex"] = value; }
        }

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }


        private List<string> StaticContainers
        {
            get
            {
                List<string> staticContainers = ViewState["StaticContainers"] as List<string>;
                if (staticContainers == null)
                {
                    ViewState["StaticContainers"] = staticContainers = new List<string>();
                }
                return staticContainers;

            }
            set
            {
                ViewState["StaticContainers"] = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AllTemplates = GetTemplates();
                CurrentTemplateIndex = -1;
                GoToNextTemplate();
            }
        }

        private List<int> GetTemplates()
        {
            PathManager pathManager = new PathManager();
            Path upsalePath = null;
            int pathID = 0;
            if (Request["p"] != null)
            {
                //We can also handle cookie check here.
                pathID = Convert.ToInt32(Request["p"]);
                upsalePath = pathManager.GetUpSalePath(pathID, false);
            }
            else
            {
                upsalePath = pathManager.GetPath(HttpContext.Current, CartContext.VersionId);
            }

            //Set Cookie fist time after path calculation
            if (HttpContext.Current.Request.Cookies["CS-PathId"] == null && upsalePath != null)
            {
                TimeSpan ts = new TimeSpan(24, 0, 0);
                CommonHelper.SetCookie("CS-PathId", upsalePath.PathId.ToString(), ts);

            }

            if (upsalePath == null)
            {
                return new List<int>();
            }
            else
            {
                //Store Order Path to database
                if (upsalePath.PathId > 0)
                {
                    CSResolve.Resolve<IOrderService>().UpdateOrderPath(CartContext.OrderId, upsalePath.PathId);
                }

                return upsalePath.Templates
                    .OrderBy(t => t.OrderNo)
                    .Select(t => t.TemplateId)
                    .ToList();
            }
        }

        private void GoToNextTemplate()
        {
            CurrentTemplateIndex++;
            if (CurrentTemplateIndex < AllTemplates.Count)
            {
                LoadTemplate(CurrentTemplateIndex);
            }
            else
            {
                //SriComments: Admin may setup path with empty templates: kevin business case
                if (CSFactory.OrderProcessCheck() == (int)OrderProcessTypeEnum.InstantOrderProcess)
                    Response.Redirect("receipt.aspx");
                else
                    Response.Redirect("ReviewOrder.aspx");

            }
        }

        private void LoadTemplate(int templateIndex)
        {
            if (templateIndex < AllTemplates.Count)
            {
                //We're making a separate call to database just to get 
                //full template object, ideally we should merge these two calls
                int currentTemplateId = AllTemplates[templateIndex];
                PathManager pathManager = new PathManager();
                Template currentTemplate = pathManager.GetTemplate(currentTemplateId);

                if (currentTemplate.CanUseTemplate(CartContext))
                {
                    string templateBody = currentTemplate.Body;
                    templateBody = BindLinks(templateBody);
                    templateBody = BindValidators(templateBody);
                    BindContainers(templateBody);

                    mainContainer.InnerHtml = templateBody;

                    //Tags contain some template related configuration information
                    var templateTagsXml = XElement.Parse("<root>" + currentTemplate.Tag + "</root>");

                    //there can be 1-many sku's in this template
                    var skuTags = templateTagsXml.Descendants("sku").Where(a => a.Attribute("id") != null);
                    Skus = new List<string>();
                    foreach (var s in skuTags)
                    {
                        Skus.Add(s.Attribute("id").Value);
                    }

                    //We'll parse here the lookup for dropdowns if there is any
                    var skuLookup = templateTagsXml.Descendants("skulookup").DefaultIfEmpty();
                    LookupBag = new SkuLookupBag();
                    if (skuLookup != null)
                    {
                        var controlSet = skuLookup.Descendants("controls");
                        foreach (var set in controlSet)
                        {
                            SkuLookupSet lookupSet = new SkuLookupSet();
                            //Order of controls is important as later that's how the actual sku us built
                            var lookupControls = set.Descendants("control");
                            foreach (var c in lookupControls)
                            {
                                if (c.Attribute("type") != null && c.Attribute("type").Value == "quantity")
                                {
                                    lookupSet.Quantity = c.Attribute("name").Value;
                                }
                                else
                                    lookupSet.Controls.Add(c.Attribute("name").Value);
                            }
                            LookupBag.Set.Add(lookupSet);
                        }

                        var lookupItem = skuLookup.Descendants("item");
                        foreach (var l in lookupItem)
                        {
                            LookupBag.Lookup.Add(l.Attribute("value").Value.ToLowerInvariant(), l.Attribute("sku").Value.ToLowerInvariant());
                        }
                    }

                }
                else
                {
                    GoToNextTemplate();
                }
            }
        }

        private string BindValidators(string templateBody)
        {
            //Commented as everything will be handled in the JS
            /*
            MatchCollection links = Regex.Matches(templateBody, "(<select.*?</select>|<input.*?>)", RegexOptions.Singleline | RegexOptions.IgnoreCase);

            int totalMatches = links.Count;
            for (int i = 0; i < totalMatches; i++)
            {
                XElement controlXml = XElement.Parse(links[i].Value);
                if (controlXml.Attribute("required") != null && controlXml.Attribute("required").Value == "true")
                {
                    string classAttribute = "validate[required]";
                    if (controlXml.Attribute("class") != null)
                    {
                        classAttribute += " " + controlXml.Attribute("class").Value;
                    }

                    controlXml.SetAttributeValue("class", classAttribute);
                    string controlID = string.Empty;
                    if (controlXml.Attribute("id") != null)
                    {
                        controlID = controlXml.Attribute("id").Value;
                    }
                    else
                    {
                        controlID = Guid.NewGuid().ToString().Substring(0, 6);
                    }
                    controlXml.SetAttributeValue("id", controlID);
                    templateBody = templateBody.Replace(links[i].Value, controlXml.ToString());
                }
            }
             */
            return templateBody;
        }

        private string BindLinks(string templateBody)
        {
            //"<sku id='5' />Do you want to take advantage of this offer <a href='javascript:void(0)' bind='yes'>Yes</a> no <a href='javascript:void(0)' bind='no'>No</a>";
            MatchCollection links = Regex.Matches(templateBody, "<a.*?</a>", RegexOptions.Singleline | RegexOptions.IgnoreCase);

            int totalMatches = links.Count;
            for (int i = 0; i < totalMatches; i++)
            {
                XElement linkXml = XElement.Parse(links[i].Value);
                if (linkXml.Attribute("bind") != null)
                {
                    string attributeName = linkXml.Attribute("bind").Value;
                    Button btn = Page.FindControl("btn" + attributeName) as Button;
                    if (btn != null)
                    {
                        string clientScript = ClientScript.GetPostBackEventReference(btn, "", btn.CausesValidation);

                        if (attributeName == "yes")
                            clientScript = "if(validateForm()) " + clientScript;

                        linkXml.SetAttributeValue("onclick", clientScript + ";return false;");
                        templateBody = templateBody.Replace(links[i].Value, linkXml.ToString());
                    }
                }
            }
            return templateBody;
        }

        //this will be used on 
        private void BindContainers(string templateBody)
        {
            StaticContainers.ForEach(c =>
            {
                Page.FindControl(c).Visible = false;
            });
            StaticContainers.Clear();

            MatchCollection containers = Regex.Matches(templateBody, "<container.*?/>", RegexOptions.Singleline | RegexOptions.IgnoreCase);
            int totalMatches = containers.Count;
            for (int i = 0; i < totalMatches; i++)
            {
                XElement containerXml = XElement.Parse(containers[i].Value);
                string containerID = containerXml.Attribute("id").Value;
                Control control = Page.FindControl(containerID);
                if (control != null)
                {
                    control.Visible = true;
                    StaticContainers.Add(containerID);
                }
            }
        }

        private Dictionary<int, int> GetSelectedItems()
        {
            //1. This dictionary will be added to shopping cart
            Dictionary<int, int> dictOut = new Dictionary<int, int>();

            //2. Add all skus from the template
            Skus.ForEach(s => dictOut[Convert.ToInt32(s)] = 1);

            //3. Check every lookup control
            int totalSets = LookupBag.Set.Count;
            for (int s = 0; s < totalSets; s++)
            {
                string formSku = string.Empty;
                int formQuantity = 1;
                SkuLookupSet lookupSet = LookupBag.Set[s];
                for (int i = 0; i < lookupSet.Controls.Count; i++)
                {
                    if (!String.IsNullOrEmpty(Request.Form[lookupSet.Controls[i]]))
                    {
                        formSku += Request.Form[lookupSet.Controls[i]];
                    }
                }

                if (!String.IsNullOrEmpty(Request.Form[lookupSet.Quantity]))
                {
                    int.TryParse(Request.Form[lookupSet.Quantity], out formQuantity);
                }

                if (lookupSet.Controls.Count == 1) //if there is only one control, no lookup is required.
                {
                    //Edge Case Check: User should not add same item.
                    if (!dictOut.ContainsKey(Convert.ToInt32(formSku)))
                        dictOut.Add(Convert.ToInt32(formSku), formQuantity);
                }
                else if (LookupBag.Lookup.ContainsKey(formSku.ToLowerInvariant()))
                {
                    dictOut.Add(Convert.ToInt32(LookupBag.Lookup[formSku.ToLowerInvariant()]), formQuantity);
                }
            }

            return dictOut;
        }

        protected void btnYes_OnClick(object sender, EventArgs e)
        {
            //In case if use clicks back button and clicks yes again we need to redirect to a special page with some session expired text
            if (CurrentTemplateIndex < AllTemplates.Count)
            {
                Dictionary<int, int> selectedProducts = GetSelectedItems();
                PathManager pathManager = new PathManager();
                Template currentTemplate = pathManager.GetTemplate(AllTemplates[CurrentTemplateIndex]);

                currentTemplate.Process(CartContext.OrderId, CartContext.CartInfo, selectedProducts, (OrderProcessTypeEnum)CSFactory.OrderProcessCheck());
                //foreach (var p in selectedProducts)
                //{
                //    Response.Write(string.Format("{0} x {1} will be added to shopping cart<br />", p.Key, p.Value));
                //}

                GoToNextTemplate();
            }
            else
            {
                Response.Redirect("CheckoutExpired.aspx");
            }
        }

        protected void btnNo_OnClick(object sender, EventArgs e)
        {
            GoToNextTemplate();
        }


        //protected override void OnPreRender(EventArgs e)
        //{
        //    base.OnPreRender(e);

        //    ScriptManager.RegisterClientScriptInclude(this, this.GetType(),
        //        "jquery.validationEngine.js_local", Page.ResolveClientUrl("~/Scripts/validation/languages/jquery.validationEngine-" +
        //            System.Threading.Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName + ".js"));
        //    ScriptManager.RegisterClientScriptInclude(this, this.GetType(), "jquery.validationEngine.js", Page.ResolveClientUrl("~/Scripts/validation/jquery.validationEngine.js"));
        //}

        [Serializable]
        private class SkuLookupSet
        {
            public List<string> Controls;
            public string Quantity;

            public SkuLookupSet()
            {
                Controls = new List<string>();
                Quantity = string.Empty;
            }
        }

        [Serializable]
        private class SkuLookupBag
        {
            public SkuLookupBag()
            {
                Set = new List<SkuLookupSet>();
                Lookup = new Dictionary<string, string>();
            }

            public List<SkuLookupSet> Set;
            public Dictionary<string, string> Lookup;
        }
    }
}