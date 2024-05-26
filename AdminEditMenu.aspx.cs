using System;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class AdminEditMenu : System.Web.UI.Page
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
                gvMenu.DataBind();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void gvMenu_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMenu.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvMenu_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlDataSourceMenu.UpdateParameters["Название_блюда"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Цена"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Ингредиенты"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Категория_блюда"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Murl"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Код_филиала"].DefaultValue = ((TextBox)gvMenu.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
                SqlDataSourceMenu.UpdateParameters["Код_блюда"].DefaultValue = gvMenu.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceMenu.Update();
                gvMenu.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while updating: " + ex.Message + "');</script>");
            }
        }

        protected void gvMenu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMenu.EditIndex = -1;
            BindGrid();
        }

        protected void gvMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlDataSourceMenu.DeleteParameters["Код_блюда"].DefaultValue = gvMenu.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceMenu.Delete();
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
                SqlDataSourceMenu.InsertParameters["Название_блюда"].DefaultValue = txtDishName.Text;
                SqlDataSourceMenu.InsertParameters["Цена"].DefaultValue = txtPrice.Text;
                SqlDataSourceMenu.InsertParameters["Ингредиенты"].DefaultValue = txtIngredients.Text;
                SqlDataSourceMenu.InsertParameters["Категория_блюда"].DefaultValue = txtCategory.Text;
                SqlDataSourceMenu.InsertParameters["Murl"].DefaultValue = txtImageUrl.Text;
                SqlDataSourceMenu.InsertParameters["Код_филиала"].DefaultValue = ddlBranch.SelectedValue;
                SqlDataSourceMenu.Insert();
                BindGrid();

                // Очистим поля после добавления
                txtDishName.Text = "";
                txtPrice.Text = "";
                txtIngredients.Text = "";
                txtCategory.Text = "";
                txtImageUrl.Text = "";
                ddlBranch.ClearSelection();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while adding: " + ex.Message + "');</script>");
            }
        }
    }
}
