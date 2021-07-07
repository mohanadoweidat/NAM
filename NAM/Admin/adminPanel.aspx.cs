﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.Admin
{
    public partial class adminPanel : System.Web.UI.Page
    {
        private bool emailExist = false;
        private bool usernameExist = false;
        private bool checkFlag = false;
        private string id = "";
        private SqlConnection sql;
        private SqlCommand cmd;
        private SqlDataReader sqlDataReader;
        private Database.DB dB;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                wlcLbl.Text = "Välkommen tillbaka: " + Session["logged_User"];
                logOut_Btn.Style.Add("display", "block");
                bindGrid();
            }
            logOut_Btn.ServerClick += LogOut_Btn_ServerClick;
            add_Btn.ServerClick += Add_Btn_ServerClick;
             
        }

         

        private void Add_Btn_ServerClick(object sender, EventArgs e)
        {
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
                    cmd.Parameters.AddWithValue("@userType", "S");  //userType 
                    cmd.Parameters.AddWithValue("@isLogged", false);  //isLogged 
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    sql.Close(); // Close the connection to the database
                    Session["logged_User"] = username.Value.ToString();
                    id = Session["logged_User"].ToString();
                    Clear(); // Clear the fields
                    ClientScript.RegisterStartupScript(Page.GetType(), "text", "addStore()", true);
                    bindGrid();
                }
            }
        }

        private void LogOut_Btn_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../index.aspx");
        }

        private void bindGrid()
        {
            dB = new Database.DB();
            if (dB.getStoreNameData() == null)
            {
                connectedStoreGrid.Visible = false;
                emptyGrid.Visible = true;
                emptyGrid.Text = "Det finns inga anslutna restauranger/mataffärer/cafeer";
            }
            //If there is connectred stores show them
            else
            {
                emptyGrid.Visible = false;
                connectedStoreGrid.Visible = true;
                connectedStoreGrid.DataSource = dB.getStoreNameData();
                connectedStoreGrid.DataBind();
            }
        }

        private void Clear()
        {
            username.Value = email.Value = pwd.Value = "";
        }
    }
}