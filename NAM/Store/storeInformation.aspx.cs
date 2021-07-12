using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.Store
{
    public partial class storeInformation : System.Web.UI.Page
    {
        private Database.DB dB;
        string oldStoreName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                dB = new Database.DB();
                oldStoreName = dB.getStoreNameByUsername(Session["logged_User"].ToString());
                if (!IsPostBack)
                {
                     getRestaurantInfo();
                }
             }
            edit_Btn.ServerClick += edit_Btn_ServerClick;
        }

        private void edit_Btn_ServerClick(object sender, EventArgs e)
        {
            if (checkEmpty())
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
            }
            else
            {
                //Save the new values into the database.
                using (var con = new SqlConnection(Database.connectionString.conString))
                {
                    string currentUsername = Session["logged_User"].ToString();
                    con.Open();
                    SqlCommand sqlCmd = new SqlCommand("Products_StoreInformation_EditStoreName_sp", con);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@newStoreName", storeName.Value.Trim());
                    sqlCmd.Parameters.AddWithValue("@oldStoreName", oldStoreName);
                    sqlCmd.Parameters.AddWithValue("@username", currentUsername);
                    sqlCmd.Parameters.AddWithValue("@newaddress", address.Value.Trim());
                    sqlCmd.ExecuteNonQuery();
                    sqlCmd.Dispose();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", " doneChange()", true);
                }
            }
        }

        //It will fill the fields with values from the database.
        private void getRestaurantInfo()
        {
            String query = "select * from StoreInformation where (username = '" + Session["logged_User"].ToString() + "');";
            using (SqlConnection sql = new SqlConnection(Database.connectionString.conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, sql))
                {
                    sql.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        storeName.Value = sdr["storeName"].ToString();
                        address.Value = sdr["address"].ToString();


                    }
                    sql.Close();
                }
            }
        }

        //Check if the fields is empty.
        private bool checkEmpty()
        {
            if (storeName.Value == "" || address.Value == "")
            {
                return true;
            }
            return false;
        }
    }
}