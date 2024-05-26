using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace ASOIU4
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO гости (ФИО, Телефон, Email, Логин, Пароль) VALUES (@fullName, @phone, @email, @username, @password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@fullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                try
                {
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        // Регистрация успешна, можно перенаправить пользователя на другую страницу
                        Response.Redirect("auth.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Не удалось завершить регистрацию. Пожалуйста, попробуйте еще раз.";
                    }
                }
                catch (Exception ex)
                {
                    // Обработка исключений
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Произошла ошибка при попытке регистрации. Пожалуйста, попробуйте еще раз.";
                    // Запись ошибки в журнал или другой лог
                    // Logger.LogError(ex);
                }
            }
        }
    }
}
