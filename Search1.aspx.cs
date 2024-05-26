using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace ASOIU4
{
    public partial class Search1 : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] == null)
            {
                Response.Write("Пользователь не авторизован.");
                return;
            }

            string loggedInUser = Session["LoggedInUser"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;

            DateTime date = calBookingDate.SelectedDate;
            string time = ddlBookingTime.SelectedValue;
            int persons = Convert.ToInt32(txtPersons.Text);
            int filial = Convert.ToInt32(ddlFilial.SelectedValue);

            // Проверка на допустимость даты
            if (date < SqlDateTime.MinValue.Value || date > SqlDateTime.MaxValue.Value)
            {
                Response.Write("Выбранная дата находится за пределами допустимого диапазона.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO бронирования (Код_гостя, Код_филиала, Дата_бронирования, Время_бронирования, Количество_персон) " +
                               "VALUES ((SELECT Код_гостя FROM гости WHERE Логин = @LoggedInUser), @Filial, @Date, @Time, @Persons)";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Date", date);
                command.Parameters.AddWithValue("@Time", time);
                command.Parameters.AddWithValue("@Persons", persons);
                command.Parameters.AddWithValue("@Filial", filial);
                command.Parameters.AddWithValue("@LoggedInUser", loggedInUser);

                connection.Open();
                command.ExecuteNonQuery();
            }

            ClearForm();
        }

        private void ClearForm()
        {
            calBookingDate.SelectedDate = DateTime.Today;
            ddlBookingTime.SelectedIndex = 0;
            txtPersons.Text = "";
            ddlFilial.SelectedIndex = 0;
        }
    }
}
