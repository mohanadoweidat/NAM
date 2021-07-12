using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace NAM.Store
{
    public partial class firstLogin : System.Web.UI.Page
    {
        private bool nameExist = false;
        private SqlConnection sql;
        private SqlCommand cmd;
        private Database.DB dB;
        protected void Page_Load(object sender, EventArgs e){
            add_Btn.ServerClick += add_Btn_ServerClick;
        }

        /**
         * This function will fire when user press add button
         * The button will add filled information to the database and
         * change the status of the stroe to inlogged in the database.
         */
        private void add_Btn_ServerClick(object sender, EventArgs e){
            if (storeName.Value == "" || address.Value == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
                return;
            }
            else
            {
                sql = new SqlConnection(Database.connectionString.conString);
                sql.Open();
                cmd = new SqlCommand();
                cmd.CommandText = "select * from [StoreInformation]";
                cmd.Connection = sql;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader[0].ToString() == storeName.Value)
                    {
                        nameExist = true;
                        break;
                    }
                }
                if (nameExist)
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "usernameExist()", true);
                }
                else
                {
                    sql = new SqlConnection(Database.connectionString.conString);
                    sql.Open(); // Open the connection to the database
                    string procedureName = "sp_StoreInformation_addInformation"; //Stored Procedure name
                    cmd = new SqlCommand(procedureName, sql);  //creating  SqlCommand  object
                    cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                    //adding paramerters to  SqlCommand below  
                    cmd.Parameters.AddWithValue("@storeName", storeName.Value.ToString()); //Store name 
                    cmd.Parameters.AddWithValue("@address", address.Value.ToString()); //Address  
                    cmd.Parameters.AddWithValue("@username", Session["logged_User"].ToString()); //username  
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    sql.Close(); // Close the connection to the database
                    //Change status of restaurant to isLogged = true;
                    changeStatus();
                    Response.Redirect("storePanel.aspx");
                }
            }
        }

        //This function wuill change the status of the stroe to inlogged in the database.
        private void changeStatus(){
            dB = new Database.DB();
            dB.changeLoggedStatus();
        }
    }
}