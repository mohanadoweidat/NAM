using System;
using System.Net.Mail;
using System.Web.UI;

namespace NAM
{
    public partial class contactUs : System.Web.UI.Page
    {
        private Database.DB dB;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                dash_Btn.Style.Add("display", "block");
                logOut_Btn.Style.Add("display", "block");

                logIn_Btn.Visible = false;
                signUp_Btn.Visible = false;
            }
            else
            {
                dash_Btn.Style.Add("display", "none");
                logOut_Btn.Style.Add("display", "none");

                logIn_Btn.Visible = true;
                signUp_Btn.Visible = true;
            }
            logIn_Btn.ServerClick += LogIn_Btn_ServerClick;
            signUp_Btn.ServerClick += SignUp_Btn_ServerClick;
            logOut_Btn.ServerClick += LogOut_Btn_ServerClick;
            dash_Btn.ServerClick += Dash_Btn_ServerClick;
            send_btn.ServerClick += Send_btn_ServerClick;
        }

        private void Send_btn_ServerClick(object sender, EventArgs e)
        {
            if (fname.Value == "" || lname.Value == "" || email.Value == "" || subject.Value == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
            }
            else
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("companycompanymh2020@gmail.com", "z)EC<YB+HWp*;9@"); // Email och lösenord för NAM
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = "Meddelande från en Användare!";
                msg.Body = "Meddelande från:" + "\n" + fname.Value + " " + lname.Value + "\n\nE-post: " + "\n" + email.Value + "\n" + " \n" +
                   "Meddelande:" + "\n" + subject.Value + "\n\n";
                msg.From = new MailAddress(email.Value);
                msg.To.Add("companycompanymh2020@gmail.com"); // NAM e-post som ska få meddelandena
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "sendMessage()", true);
                smtp.Send(msg);
                clear();
            }
        }

        private void Dash_Btn_ServerClick(object sender, EventArgs e)
        {
            dB = new Database.DB();
            char userType = dB.checkUserType();
            //If u press panel button and u are a user
            if (userType == 'U')
            {
                Response.Redirect("~/User/userPanel.aspx");
            }
            //If u press panel button and u are an admin
            else if (userType == 'A')
            {
                Response.Redirect("~/Admin/adminPanel.aspx");
            }
            //If u press panel button and u are a store admin
            else
            {
                Response.Redirect("~/Store/StorePanel.aspx");
            }
        }

        private void LogOut_Btn_ServerClick(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "logOut()", true);
            Session.Abandon();
        }

        private void SignUp_Btn_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("signUp.aspx");
        }

        private void LogIn_Btn_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("logIn.aspx");
        }

        private void clear()
        {
            fname.Value = lname.Value = email.Value = subject.Value = "";
        }
    }
}