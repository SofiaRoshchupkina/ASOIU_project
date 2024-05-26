using System;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class AdminEditBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                gvBookings.DataBind();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void gvBookings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBookings.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvBookings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlDataSourceBookings.UpdateParameters["Дата_бронирования"].DefaultValue = ((TextBox)gvBookings.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                SqlDataSourceBookings.UpdateParameters["Время_бронирования"].DefaultValue = ((TextBox)gvBookings.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
                SqlDataSourceBookings.UpdateParameters["Количество_персон"].DefaultValue = ((TextBox)gvBookings.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
                SqlDataSourceBookings.UpdateParameters["Код_филиала"].DefaultValue = ((TextBox)gvBookings.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
                SqlDataSourceBookings.UpdateParameters["Код_гостя"].DefaultValue = ((TextBox)gvBookings.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
                SqlDataSourceBookings.UpdateParameters["Код_бронирования"].DefaultValue = gvBookings.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceBookings.Update();
                gvBookings.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while updating: " + ex.Message + "');</script>");
            }
        }

        protected void gvBookings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBookings.EditIndex = -1;
            BindGrid();
        }

        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlDataSourceBookings.DeleteParameters["Код_бронирования"].DefaultValue = gvBookings.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceBookings.Delete();
                BindGrid();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while deleting: " + ex.Message + "');</script>");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSourceBookings.InsertParameters["Дата_бронирования"].DefaultValue = txtBookingDate.Text;
                SqlDataSourceBookings.InsertParameters["Время_бронирования"].DefaultValue = txtBookingTime.Text;
                SqlDataSourceBookings.InsertParameters["Количество_персон"].DefaultValue = txtPersons.Text;
                SqlDataSourceBookings.InsertParameters["Код_филиала"].DefaultValue = ddlBranch.SelectedValue;
                SqlDataSourceBookings.InsertParameters["Код_гостя"].DefaultValue = txtGuestID.Text;
                SqlDataSourceBookings.Insert();
                BindGrid();

                // Очистим поля после добавления
                txtBookingDate.Text = "";
                txtBookingTime.Text = "";
                txtPersons.Text = "";
                ddlBranch.ClearSelection();
                txtGuestID.Text = "";
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while adding: " + ex.Message + "');</script>");
            }
        }
    }
}
