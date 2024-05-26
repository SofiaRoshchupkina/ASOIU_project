using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null || Session["AdminUser"] != null)
            {
                HtmlGenericControl divLoggedInContent = (HtmlGenericControl)FindControlRecursive(this, "divLoggedInContent");
                if (divLoggedInContent != null)
                {
                    divLoggedInContent.Style["display"] = "block";
                }
                auth.Visible = false;
                register.Visible = false;
                btnUserCabinet.Visible = Session["AdminUser"] == null; // Показываем иконку личного кабинета только для обычного пользователя
            }
            else
            {
                HtmlGenericControl divLoggedInContent = (HtmlGenericControl)FindControlRecursive(this, "divLoggedInContent");
                if (divLoggedInContent != null)
                {
                    divLoggedInContent.Style["display"] = "none";
                }
                btnUserCabinet.Visible = false; // Скрываем иконку личного кабинета
            }
        }

        protected void btnUserCabinet_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCabinet.aspx"); // Предполагаем, что страница личного кабинета называется UserCabinet.aspx
        }

        protected void btnAdminDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx"); // Перенаправляем на страницу админ панели
        }

        private Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
            {
                return root;
            }

            foreach (Control control in root.Controls)
            {
                Control foundControl = FindControlRecursive(control, id);
                if (foundControl != null)
                {
                    return foundControl;
                }
            }

            return null;
        }

        protected void auth_Click(object sender, EventArgs e)
        {
            Response.Redirect("auth.aspx"); // Redirects to the authentication page
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx"); // Redirects to the registration page
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Очищаем сессию
            Session.Clear();
            // Перенаправляем пользователя на страницу авторизации (или другую страницу по вашему выбору)
            Response.Redirect("Main.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx"); // Redirects to the main page
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("News.aspx"); // Redirects to the news page
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search1.aspx"); // Redirects to the booking page
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search2.aspx"); // Redirects to the branches page
        }
    }
}
