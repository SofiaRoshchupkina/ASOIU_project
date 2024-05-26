using System;
using System.Web.UI;

namespace ASOIU4
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                lblAdminInfo.Text = "Добро пожаловать, " + Session["AdminUser"];
            }
        }
    }
}
