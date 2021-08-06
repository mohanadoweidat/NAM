using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.Store
{
    public partial class orderedProducts : System.Web.UI.Page
    {
        private Database.DB dB;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                dB = new Database.DB();
                storeNameLbl.Text = dB.getStoreNameByUsername(Session["logged_User"].ToString());
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
            ordersGrid.DataSource = SqlDataSource1;
            ordersGrid.DataBind();
        }
    }
}