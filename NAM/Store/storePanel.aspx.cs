using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.Store
{
    public partial class storePanel : System.Web.UI.Page
    {
        private Database.DB dB;
        private SqlConnection con;
        private SqlCommand cmd;
        private SqlDataReader sqlData;
        string storeName = "";
        private Byte[] bytes;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                dB = new Database.DB();
                storeName = dB.getStoreNameByUsername(Session["logged_User"].ToString());
                wlcLbl.Text = storeName;
                logOut_Btn.Style.Add("display", "block");
            }
            if (!IsPostBack)
            {
                bindGrid();
            }
            logOut_Btn.ServerClick += logOut_Btn_ServerClick;
        }

        private void logOut_Btn_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../index.aspx");
        }
        private void bindGrid()
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label productId = GridView1.Rows[e.RowIndex].FindControl("label1") as Label;
            string deleteQuery = "delete from Products where product_Id=" + productId.Text;
            con = new SqlConnection(Database.connectionString.conString);
            con.Open();
            cmd = new SqlCommand(deleteQuery, con);
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "doneDelete()", true);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label productId = GridView1.Rows[e.RowIndex].FindControl("label7") as Label;
            TextBox productName = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox productDesc = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox orginalPrice = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox newPrice = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox pickUpTime = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            FileUpload fileUpload = GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
            TextBox quantity = GridView1.Rows[e.RowIndex].FindControl("TextBox12") as TextBox;

            con = new SqlConnection(Database.connectionString.conString);
            con.Open(); // Open the connection to the database
                        //Stored Procedure name
            string procedureName = fileUpload.HasFile ? "Products_EditProduct_sp" : "Products_EditProduct2_sp";
            cmd = new SqlCommand(procedureName, con);  //creating  SqlCommand  object
            cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
            HttpPostedFile postedFile = fileUpload.PostedFile;
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            cmd.Parameters.AddWithValue("@productName", productName.Text.ToString());//Procut name 
            cmd.Parameters.AddWithValue("@productDesc", productDesc.Text.ToString());//Product describtion
            if (fileUpload.HasFile)
            {
                bytes = binaryReader.ReadBytes((int)stream.Length);
                cmd.Parameters.AddWithValue("@productImage", bytes);//Product image  
            }
            cmd.Parameters.AddWithValue("@oldPrice", orginalPrice.Text.ToString());  //Old price 
            cmd.Parameters.AddWithValue("@newPrice", newPrice.Text.ToString());  //New  price 
            cmd.Parameters.AddWithValue("@pickupTime", pickUpTime.Text.ToString());  //PickUp time 
            cmd.Parameters.AddWithValue("@quantity", quantity.Text.ToString());  // Quantity
            cmd.Parameters.AddWithValue("@productId", productId.Text.ToString());  //Store name 
            cmd.ExecuteNonQuery(); //executing the sqlcommand
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "doneEditing();", true);
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            TextBox productName = GridView1.FooterRow.FindControl("TextBox7") as TextBox;
            TextBox productDesc = GridView1.FooterRow.FindControl("TextBox8") as TextBox;
            TextBox orginalPrice = GridView1.FooterRow.FindControl("TextBox9") as TextBox;
            TextBox newPrice = GridView1.FooterRow.FindControl("TextBox10") as TextBox;
            TextBox pickUpTime = GridView1.FooterRow.FindControl("TextBox11") as TextBox;
            FileUpload imgUploader = GridView1.FooterRow.FindControl("FileUpload2") as FileUpload;
            TextBox quantity = GridView1.FooterRow.FindControl("TextBox13") as TextBox;

            if (productName.Text == "" || productDesc.Text == "" || orginalPrice.Text == "" || newPrice.Text == "" || pickUpTime.Text == "" || !imgUploader.HasFile || quantity.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
                return;
            }
            else
            {
                con = new SqlConnection(Database.connectionString.conString);
                con.Open(); // Open the connection to the database
                string procedureName = "Products_addProduct_sp"; //Stored Procedure name
                cmd = new SqlCommand(procedureName, con);  //creating  SqlCommand  object
                cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                HttpPostedFile postedFile = imgUploader.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                    //adding paramerters to  SqlCommand below  
                    cmd.Parameters.AddWithValue("@productName", productName.Text.ToString());//Procut name 
                    cmd.Parameters.AddWithValue("@productDesc", productDesc.Text.ToString());//Product describtion  
                    cmd.Parameters.AddWithValue("@productImage", bytes);//Product image  
                    cmd.Parameters.AddWithValue("@oldPrice", orginalPrice.Text.ToString());  //Old price 
                    cmd.Parameters.AddWithValue("@newPrice", newPrice.Text.ToString());  //New  price 
                    cmd.Parameters.AddWithValue("@pickupTime", pickUpTime.Text.ToString());  //PickUp time 
                    cmd.Parameters.AddWithValue("@quantity", quantity.Text.ToString());  // Qyantity
                    cmd.Parameters.AddWithValue("@storeName", wlcLbl.Text.ToString());  //Store name 
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    con.Close(); // Close the connection to the database
                    SqlDataSource1.DataBind();
                    bindGrid();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "doneAdd()", true);
                }
            }
        }

        protected void add_Empty_Click(object sender, EventArgs e)
        {
            Label productID = GridView1.Controls[0].FindControl("productID") as Label;
            TextBox productName = GridView1.Controls[0].Controls[0].FindControl("productNameBox") as TextBox;
            TextBox productDescBox = GridView1.Controls[0].Controls[0].FindControl("productDescBox") as TextBox;
            FileUpload FileUploadBox = GridView1.Controls[0].Controls[0].FindControl("FileUploadBox") as FileUpload;
            TextBox oldPriceBox = GridView1.Controls[0].Controls[0].FindControl("oldPriceBox") as TextBox;
            TextBox newPriceBox = GridView1.Controls[0].Controls[0].FindControl("newPriceBox") as TextBox;
            TextBox pickUpTimeBox = GridView1.Controls[0].Controls[0].FindControl("pickUpTimeBox") as TextBox;
            TextBox antaletBox = GridView1.Controls[0].Controls[0].FindControl("antaletBox") as TextBox;

            if (productName.Text == "" || productDescBox.Text == "" || !FileUploadBox.HasFile || oldPriceBox.Text == "" || newPriceBox.Text == "" || pickUpTimeBox.Text == "" || antaletBox.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "emptyFields()", true);
                return;
            }
            else
            {
                con = new SqlConnection(Database.connectionString.conString);
                con.Open(); // Open the connection to the database
                string procedureName = "Products_addProduct_sp"; //Stored Procedure name
                cmd = new SqlCommand(procedureName, con);  //creating  SqlCommand  object
                cmd.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure
                HttpPostedFile postedFile = FileUploadBox.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                   || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                    //adding paramerters to  SqlCommand below  
                    cmd.Parameters.AddWithValue("@productName", productName.Text.ToString());//Procut name 
                    cmd.Parameters.AddWithValue("@productDesc", productDescBox.Text.ToString());//Product describtion  
                    cmd.Parameters.AddWithValue("@productImage", bytes);//Product image  
                    cmd.Parameters.AddWithValue("@oldPrice", oldPriceBox.Text.ToString());  //Old price 
                    cmd.Parameters.AddWithValue("@newPrice", newPriceBox.Text.ToString());  //New  price 
                    cmd.Parameters.AddWithValue("@pickupTime", pickUpTimeBox.Text.ToString());  //PickUp time 
                    cmd.Parameters.AddWithValue("@quantity", antaletBox.Text.ToString());  // Quantity
                    cmd.Parameters.AddWithValue("@storeName", wlcLbl.Text.ToString());  //Store name 
                    cmd.ExecuteNonQuery(); //executing the sqlcommand
                    con.Close(); // Close the connection to the database
                    SqlDataSource1.DataBind();
                    bindGrid();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "doneAdd()", true);
                }
            }
        }
    }
}