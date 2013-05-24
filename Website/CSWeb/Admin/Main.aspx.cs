using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.Admin
{
    public class Main : BasePage
    {
        protected Panel pnlHeader, pnlBody;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                this.BaseLoad();
                if (this.userTypeId == 4)
                {
                    pnlHeader.Visible = true;
                    pnlBody.Visible = true;
                }
               
            }
        }
    }
}