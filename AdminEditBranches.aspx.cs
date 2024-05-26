using System;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class AdminEditBranches : System.Web.UI.Page
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
                gvBranches.DataBind();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void gvBranches_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBranches.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvBranches_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlDataSourceBranches.UpdateParameters["Название"].DefaultValue = ((TextBox)gvBranches.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                SqlDataSourceBranches.UpdateParameters["Адрес"].DefaultValue = ((TextBox)gvBranches.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                SqlDataSourceBranches.UpdateParameters["Телефон"].DefaultValue = ((TextBox)gvBranches.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
                SqlDataSourceBranches.UpdateParameters["Время_работы"].DefaultValue = ((TextBox)gvBranches.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
                SqlDataSourceBranches.UpdateParameters["Код_филиала"].DefaultValue = gvBranches.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceBranches.Update();
                gvBranches.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while updating: " + ex.Message + "');</script>");
            }
        }

        protected void gvBranches_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBranches.EditIndex = -1;
            BindGrid();
        }

        protected void gvBranches_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlDataSourceBranches.DeleteParameters["Код_филиала"].DefaultValue = gvBranches.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceBranches.Delete();
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
                SqlDataSourceBranches.InsertParameters["Название"].DefaultValue = txtName.Text;
                SqlDataSourceBranches.InsertParameters["Адрес"].DefaultValue = txtAddress.Text;
                SqlDataSourceBranches.InsertParameters["Телефон"].DefaultValue = txtPhone.Text;
                SqlDataSourceBranches.InsertParameters["Время_работы"].DefaultValue = txtWorkingHours.Text;
                SqlDataSourceBranches.Insert();
                BindGrid();

                // Очистим поля после добавления
                txtName.Text = "";
                txtAddress.Text = "";
                txtPhone.Text = "";
                txtWorkingHours.Text = "";
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while adding: " + ex.Message + "');</script>");
            }
        }
    }
}
