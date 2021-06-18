using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM
{
    public partial class aboutUs : System.Web.UI.Page
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
    }
}