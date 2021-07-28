using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace NAM
{
    public partial class signUp : System.Web.UI.Page
    {
        private bool emailExist = false;
        private bool usernameExist = false;
        private string id = "";
        private SqlConnection sql;
        private SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            signUp_Btn.ServerClick += signUp_Btn_ServerClick;
            logIn_Btn.ServerClick += logIn_Btn_ServerClick;
            newLogIn_btn.ServerClick += newLogIn_btn_ServerClick;
        }

        //This function will send you to the logIn site
        private void newLogIn_btn_ServerClick(object sender, EventArgs e){
            Response.Redirect("logIn.aspx");
        }

        //This function will send you to the logIn site
        private void logIn_Btn_ServerClick(object sender, EventArgs e){
            Response.Redirect("logIn.aspx");
        }

        //This function will redirect the user to signup page when the user press the signup button.
        private void signUp_Btn_ServerClick(object sender, EventArgs e){
            if (username.Value == "" || email.Value == "" || pwd.Value == "")
            {

                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
                return;
            }
            else
            {
                sql = new SqlConnection(Database.connectionString.conString);
                sql.Open();
                cmd = new SqlCommand();
                cmd.CommandText = "select * from [Users]";
                cmd.Connection = sql;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader[1].ToString() == username.Value)
                    {
                        usernameExist = true;
                        break;
                    }
                    if (reader[3].ToString() == email.Value)
                    {
                        emailExist = true;
                        break;
                    }
                }
                if (usernameExist)
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "usernameExist()", true);
                }
                else if (emailExist)
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emailExist()", true);
                }
                else
                {
                    sql = new SqlConnection(Database.connectionString.conString);
                    sql.Open(); // Open the connection to the database
                    string procedureName = "sp_Users_addAccount"; //Stored Procedure name
                    cmd = new SqlCommand(procedureName, sql);  //creating  SqlCommand  object
                    cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                    //adding paramerters to  SqlCommand below  
                    cmd.Parameters.AddWithValue("@username", username.Value.ToString());//Username 
                    cmd.Parameters.AddWithValue("@password", pwd.Value.ToString());//Password  
                    cmd.Parameters.AddWithValue("@email", email.Value.ToString());//Email  
                    cmd.Parameters.AddWithValue("@userType", "U");  //userType 
                    cmd.Parameters.AddWithValue("@isLogged", false);  //isLogged 
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    sql.Close(); // Close the connection to the database
                    Session["logged_User"] = username.Value.ToString();
                    id = Session["logged_User"].ToString();
                    Clear(); // Clear the fields
                    doneLbl.Text = "Kontot har skapats för användaren:" + id + ", du kan nu logga in!";
                    disableFields();
                    signUp_Btn.Visible = false;
                    logIn_Btn.Visible = false;
                    newLogIn_btn.Visible = true;
                }
            }
        }

        //This function will clear all the fields
        private void Clear(){
            username.Value = email.Value = pwd.Value = "";
        }

        //This function will disable the fields
        private void disableFields(){
            username.Disabled = true;
            email.Disabled = true;
            pwd.Disabled = true;
        }
    }
}
