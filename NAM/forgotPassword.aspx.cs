using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace NAM
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        private string userPassword;
        protected void Page_Load(object sender, EventArgs e)
        {
            getPwd_Btn.ServerClick += getPwd_Btn_ServerClick;
        }

        /**
         * This function will run when the user press gett password button.
         * This function will give the user a password based on the entered username.
         */
        private void getPwd_Btn_ServerClick(object sender, EventArgs e)
        {
            string userInput = username.Value;
            if (userInput != "")
            {
                SqlConnection connection = new SqlConnection(Database.connectionString.conString);
                connection.Open();
                String query = "SELECT username,password FROM Users WHERE (username = '" + userInput + "');";
                SqlCommand cmd = new SqlCommand(query, connection);
                SqlDataAdapter sds = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sds.SelectCommand = cmd;
                int i = 0;
                sds.Fill(ds, "password");
                if (ds.Tables[i].Rows.Count > 0)
                {
                    //Get the password for given username
                    userPassword = ds.Tables[i].Rows[i]["password"].ToString();
                    //Show the password with as a label text
                    showPassLbl.Text = "Ditt lösenord:" + userPassword;
                    showPassLbl.ForeColor = System.Drawing.Color.Green;
                    username.Disabled = true;
                    getPwd_Btn.Visible = false;
                    logIn_Btn.Visible = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "wrongUsername()", true);
                    username.Value = "";
                }
            }
        }
    }
}