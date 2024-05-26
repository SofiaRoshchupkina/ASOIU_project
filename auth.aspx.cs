using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;

namespace ASOIU4
{
    public partial class auth : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT COUNT(1) FROM гости WHERE Логин=@username AND Пароль=@password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                try
                {
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Session["LoggedInUser"] = txtUsername.Text.Trim();
                        Response.Redirect("Main.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Неверный логин или пароль";
                    }
                }
                catch (Exception ex)
                {
                    // Обработка исключений
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Произошла ошибка при попытке авторизации. Пожалуйста, попробуйте еще раз.";
                    // Запись ошибки в журнал или другой лог
                    // Logger.LogError(ex);
                }
            }
        }
    }
}