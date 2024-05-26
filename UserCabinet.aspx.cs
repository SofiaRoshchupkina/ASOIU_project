using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Linq;

namespace ASOIU4
{
    public partial class UserCabinet : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInUser"] != null || Session["AdminUser"] != null)
                {
                    string username = Session["LoggedInUser"] != null ? Session["LoggedInUser"].ToString() : Session["AdminUser"].ToString();
                    LoadUserData(username);
                    LoadUserBookings(username);
                }
                else
                {
                    Response.Redirect("auth.aspx");
                }
            }
        }

        private void LoadUserData(string username)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                    SELECT ФИО, Телефон, Email
                    FROM гости
                    WHERE Логин = @username";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", username);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblUserInfo.Text = $"ФИО: {reader["ФИО"]}<br />" +
                                              $"Телефон: {reader["Телефон"]}<br />" +
                                              $"Email: {reader["Email"]}<br /><br />";
                        }
                        else
                        {
                            lblUserInfo.Text = "User not found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblUserInfo.Text = "An error occurred: " + ex.Message;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            lblUserInfo.Visible = false;
            btnEdit.Visible = false;
            btnSave.Visible = true;
            txtFullName.Text = lblUserInfo.Text.Split(new string[] { "<br />" }, StringSplitOptions.None)[0].Split(':').Last().Trim();
            txtPhone.Text = lblUserInfo.Text.Split(new string[] { "<br />" }, StringSplitOptions.None)[1].Split(':').Last().Trim();
            txtEmail.Text = lblUserInfo.Text.Split(new string[] { "<br />" }, StringSplitOptions.None)[2].Split(':').Last().Trim();
            txtFullName.Visible = true;
            txtPhone.Visible = true;
            txtEmail.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = Session["LoggedInUser"].ToString();
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                    UPDATE гости
                    SET ФИО = @fullName, Телефон = @phone, Email = @email
                    WHERE Логин = @username";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@fullName", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.ExecuteNonQuery();

                    lblUserInfo.Visible = true;
                    btnEdit.Visible = true;
                    btnSave.Visible = false;
                    txtFullName.Visible = false;
                    txtPhone.Visible = false;
                    txtEmail.Visible = false;
                    LoadUserData(username);
                }
                catch (Exception ex)
                {
                    lblUserInfo.Text = "An error occurred while saving user data: " + ex.Message;
                }
            }
        }

        private void LoadUserBookings(string username)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = @"
                    SELECT Код_бронирования, Дата_бронирования, Время_бронирования, Количество_персон
                    FROM бронирования
                    WHERE Код_гостя = (SELECT Код_гостя FROM гости WHERE Логин = @username)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", username);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();
                }
                catch (Exception ex)
                {
                    lblUserInfo.Text = "An error occurred while loading bookings: " + ex.Message;
                }
            }
        }

        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.RowIndex].Value);
            string connectionString = WebConfigurationManager.ConnectionStrings["ASOIU4ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM бронирования WHERE Код_бронирования = @bookingId";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@bookingId", bookingId);
                    cmd.ExecuteNonQuery();

                    LoadUserBookings(Session["LoggedInUser"].ToString());
                }
                catch (Exception ex)
                {
                    lblUserInfo.Text = "An error occurred while deleting booking: " + ex.Message;
                }
            }
        }
    }
}
