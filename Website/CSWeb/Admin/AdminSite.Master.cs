using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.Admin
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected string CartVersion
        {
            get
            {
                return "";

                // TODO
                /*
                string version = Session["AdminSite.CartVersion"] as string;

                if (!string.IsNullOrEmpty(version))
                {
                    
                }
                */
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["CSVal"] != null)
            {
                HttpCookie cookie = Request.Cookies["CSVal"];
                int userTypeId = Convert.ToInt32(cookie.Value);
                if (userTypeId == 4)
                {
                    plLeftNav.Visible = true;
                }

            }
        }
    }
}