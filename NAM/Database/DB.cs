using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NAM.Database
{
   
    public class DB
    {
        private SqlCommand cmd;
        private SqlDataReader dr;
        private SqlConnection sql;

        //This function will check the type of the logged user  U-User, A-Admin(NAM-developers), Other(S)- Store
        public char checkUserType()
        {
            char user = 'x';
            string loggedUser = System.Web.HttpContext.Current.Session["logged_User"].ToString();
            SqlConnection connection = new SqlConnection(Database.connectionString.conString);
            connection.Open();
            string query = "SELECT username, userType FROM Users WHERE (username = '" + loggedUser + "');";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter sds = new SqlDataAdapter();
            DataSet ds = new DataSet();
            sds.SelectCommand = cmd;
            int i = 0;
            sds.Fill(ds, "loggedUser");
            if (ds.Tables[i].Rows.Count > 0)
            {
                if (ds.Tables[i].Rows[i]["userType"].ToString() == "U")
                {
                    // If you login and you are user
                    user = 'U';
                }
                else if (ds.Tables[i].Rows[i]["userType"].ToString() == "A")
                {
                    user = 'A';
                }
                else
                {
                    user = 'S';
                }
            }
            connection.Close();
            return user;
        }

        //This function will get store name from database.
        public SqlDataReader getStoreNameData()
        {
            sql = new SqlConnection(Database.connectionString.conString);
            sql.Open();
            cmd = new SqlCommand("sp_getStoreName", sql);
            dr = cmd.ExecuteReader();
            if (dr.HasRows == false)
            {
                dr = null;
            }
            return dr;
        }
    }
}