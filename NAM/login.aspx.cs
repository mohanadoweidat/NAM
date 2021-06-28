using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM
{
    public partial class login : System.Web.UI.Page
    {
        private string userToken;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                userToken = Session["logged_User"].ToString();
            }
            logIn_Btn.ServerClick += LogIn_Btn_ServerClick;
            signUp_Btn.ServerClick += SignUp_Btn_ServerClick;
            forgotPass_Btn.ServerClick += ForgotPass_Btn_ServerClick;
        }

        private void ForgotPass_Btn_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("forgotPassword.aspx");
        }

        private void SignUp_Btn_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("signUp.aspx");
        }

        private void LogIn_Btn_ServerClick(object sender, EventArgs e)
        {
            string Username = username.Value;
            string Password = pwd.Value;
            string both = Username + Password;
            SqlConnection connection = new SqlConnection(Database.connectionString.conString);
            connection.Open();
            string query = "SELECT password, username, userType, isLogged FROM Users WHERE (username = '" + Username + "') AND (password = '" + Password + "');";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter sds = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sds.SelectCommand = cmd;
            int i = 0;
            sds.Fill(ds, "Password");
            if (ds.Tables[i].Rows.Count > 0)
            {
                if (userToken == null)
                {
                    Session["logged_User"] = ds.Tables[i].Rows[i]["username"].ToString();
                }
                // If you login and you are user
                if (ds.Tables[i].Rows[i]["userType"].ToString() == "U")
                {
                    Response.Redirect("~/User/userPanel.aspx");
                }
                // If you log in and you are  Admin
                else if (ds.Tables[i].Rows[i]["userType"].ToString() == "A")
                {

                    Response.Redirect("~/Admin/adminPanel.aspx");
                }
                // If you log in and you are a store Admin
                else
                {
                    if (ds.Tables[i].Rows[i]["isLogged"].Equals(false))
                    {
                        Response.Redirect("~/Store/firstLogin.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Store/storePanel.aspx");
                    }
                }
            }
            else if (both == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
                clear();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "wrongEmail_Pass()", true);
                clear();
            }
            connection.Close();
        }

        private void clear()
        {
            username.Value = pwd.Value = "";
        }
    }
}