using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using System.Text;
using CSCore.Utils;

namespace CSWeb.UserControls
{
    public partial class Contact : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rfvFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                                
                rfvMessage.ErrorMessage = "Please enter your message.";

                pnlSubmitSuccessMsg.Visible = Request.QueryString["success"] == "1";
            }
        }
        
        protected void imgBtn_OnClick(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                SendEmail();
                /*
                try
                {
                    CSWebBase.DAL.InsertContact(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPhone.Text, txtMessage.Text);
                }
                catch (Exception ex)
                {
                    CSWebBase.SiteBasePage.SendErrorEmail("Contact page error : " + ex.Message + " | " +
                        (ex.InnerException != null ? ex.InnerException.Message : string.Empty));
                }*/

                Response.Redirect("/Contact?success=1", true);
            }
        }

        protected void SendEmail()
        {
            StringBuilder emailBody = new StringBuilder();

            emailBody.Append("First Name: ").Append(txtFirstName.Text).Append("<br />");
            emailBody.Append("Last Name: ").Append(txtLastName.Text).Append("<br />");
            emailBody.Append("Email: ").Append(txtEmail.Text).Append("<br />");
            emailBody.Append("Phone: ").Append(txtPhone.Text).Append("<br />");
            emailBody.Append("Message: ").Append(txtMessage.Text).Append("<br />");

            //CSCore.EmailHelper.SendEmail(txtEmail.Text, ((CSWebBase.SiteBasePage)Page).ContactUsEmail, "Airocide.com - Contact Message", emailBody.ToString(), true);
        }

        public bool validateInput()
        {
            bool _bError = false;

            if (CommonHelper.EnsureNotNull(txtFirstName.Text) == String.Empty)
            {
                lblFirstNameError.Text = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                lblFirstNameError.Visible = true;
                _bError = true;
            }
            else
                lblFirstNameError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtLastName.Text) == String.Empty)
            {
                lblLastNameError.Text = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                lblLastNameError.Visible = true;
                _bError = true;
            }
            else
                lblLastNameError.Visible = false;
            
            if (CommonHelper.EnsureNotNull(txtEmail.Text) == String.Empty)
            {
                lblEmailError.Text = ResourceHelper.GetResoureValue("EmailErrorMsg");
                lblEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidEmail(txtEmail.Text))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                    lblEmailError.Visible = true;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }

            return _bError;
        }
    }
}