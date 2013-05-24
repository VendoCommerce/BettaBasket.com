using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSBusiness.Web;
using CSWebBase;

namespace CSWeb.Root.Store
{
    public partial class index : SiteBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                base.Page_Load(sender, e);
            SitePreference sitePrefCache = CSFactory.GetCacheSitePref();
            if (Request.Url.ToString().ToLower().Contains("plugnsafe.ca") || Request.Url.ToString().ToLower().Contains("plugandsafe.ca"))
            {
                Response.Redirect("https://www.plugnsafe.com/canada?" + Request.QueryString);
            }
            if (Request.Url.ToString().ToLower().Contains("plugandsafe.com"))
            {
                Response.Redirect("https://www.plugnsafe.com?" + Request.QueryString);
            }
            if (!sitePrefCache.GeoLocationService)
            {
                string GeoCoountry = "";
                GeoCoountry = CommonHelper.GetGeoTargetLocation(CommonHelper.IpAddress(HttpContext.Current));
                if (GeoCoountry.Equals("canada"))
                {
                    Response.Redirect("https://www.plugnsafe.com/canada/?" + Request.QueryString);
                }
            }
            if (Request.Headers["X-HTTPS"] != null)
            {
                if (Request.Headers["X-HTTPS"].ToLower().Equals("no"))
                {
                    if (Request.Url.ToString().Contains("www"))
                    {
                        Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("index.aspx", "")));
                    }
                    else
                    {
                        Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("https://", "https://www.").Replace("index.aspx", "")));
                    }
                }
            }
                
            }
           
        }
    }
}