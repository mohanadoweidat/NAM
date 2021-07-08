using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NAM.User
{
    public partial class userOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged_User"] != null)
            {
                logOut_Btn.Style.Add("display", "block");
                bindGrid();
            }
            logOut_Btn.ServerClick += LogOut_Btn_ServerClick;
        }

        private void LogOut_Btn_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../index.aspx");
        }

        private void bindGrid()
        {
            if (!IsPostBack)
            {
                ordersGrid.DataSource = SqlDataSource1;
                ordersGrid.DataBind();
            }
        }
    }
}