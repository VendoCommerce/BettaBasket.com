using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Web;
using CSBusiness;

namespace CSWebBase
{
    public class SiteBasePage : CSBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            CSBusiness.Version item = list.Find(x => x.Title.ToUpper() == "A1");

            if (item != null)
            {
                ClientOrderData.VersionId = item.VersionId;
            }
        }
    }
}
