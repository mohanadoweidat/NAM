using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.User
{
    public partial class userPanel : System.Web.UI.Page
    {
        private SqlConnection con;
        private SqlCommand cmd;
        private string loggeduserName = "";
        private Label productName;
        private Label newPrice;
        private Label pickUpTime;
        private TextBox userQuantity;
        private Label storeName;
        private Label productQuantity;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                loggeduserName = Session["logged_User"].ToString();
                wlcLbl.Text = loggeduserName;
                logOut_Btn.Style.Add("display", "block");
            }
            bindGrid();
            logOut_Btn.ServerClick += logOut_Btn_ServerClick;
        }

        // This function will fire when the user press logout button
        private void logOut_Btn_ServerClick(object sender, EventArgs e){
            Session.Abandon();
            Response.Redirect("../index.aspx");
        }

        //This function will fire when the user press order button
        protected void orderBtn_Click(object sender, EventArgs e){
            LinkButton lb = (LinkButton)sender;
         
            foreach (GridViewRow row in orderGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if ((row.FindControl("Label1") as Label).Text == lb.CommandName)
                    {
                        productName = row.FindControl("Label2") as Label;
                        newPrice = row.FindControl("Label5") as Label;
                        pickUpTime = row.FindControl("Label6") as Label;
                        userQuantity = row.FindControl("userQuantity") as TextBox;
                        storeName = row.FindControl("Label8") as Label;
                        productQuantity = row.FindControl("Label7") as Label;
                        break;
                    }
                }
            }

            if (userQuantity.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "errorEmptyQuantity()", true);
                return;
            }
            else
            {
                //Check quantity
                if (int.Parse(userQuantity.Text) <= int.Parse(productQuantity.Text))
                {
                    int orderID = new Random().Next(1000000);
                    con = new SqlConnection(Database.connectionString.conString);
                    con.Open(); // Open the connection to the database
                    string procedureName = "Orders_addOrder_sp"; //Stored Procedure name
                    cmd = new SqlCommand(procedureName, con);  //creating  SqlCommand  object
                    cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                    //adding paramerters to SqlCommand below
                    cmd.Parameters.AddWithValue("@orderID", orderID);  // Store Name
                    cmd.Parameters.AddWithValue("@productId", lb.CommandName);//Product ID 
                    cmd.Parameters.AddWithValue("@productName", productName.Text.ToString());//Product Name  
                    cmd.Parameters.AddWithValue("@newPrice", newPrice.Text.ToString());//Product Price  
                    cmd.Parameters.AddWithValue("@pickupTime", pickUpTime.Text.ToString());  //PickUp time   
                    cmd.Parameters.AddWithValue("@quantity", userQuantity.Text.ToString());  // User quantity 
                    cmd.Parameters.AddWithValue("@customerName", loggeduserName);  // User name
                    cmd.Parameters.AddWithValue("@storeName", storeName.Text.ToString());  // Store Name
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    con.Close(); // Close the connection to the database
                    userQuantity.Text = "";
                    deleteProductsWithNoQuantity();
                    SOURCE1.DataBind();
                    orderGrid.DataSource = SOURCE1;
                    orderGrid.DataBind();

                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "doneOrder()", true);
                }
                //Wrong quantiityt -- > user input more than product quantity!
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "errorQuantity()", true);
                }
            }
        }

        //This function fill the grid with products that user can buy.
        private void bindGrid(){
            if (!IsPostBack)
            {
                orderGrid.DataSource = SOURCE1;
                orderGrid.DataBind();
            }
        }

        //This function will delete all the products without quantity(sold out) from the grid.
        private void deleteProductsWithNoQuantity(){
            con = new SqlConnection(Database.connectionString.conString);
            con.Open(); // Open the connection to the database
            string procedureName = "Products_DeleteNoQuantity"; //Stored Procedure name
            cmd = new SqlCommand(procedureName, con);  //creating  SqlCommand  object
            cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
            cmd.ExecuteNonQuery(); //executing the sqlcommand
        }
    }
}