using System;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class AdminEditGuests : System.Web.UI.Page
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
                gvGuests.DataBind();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
        }

        protected void gvGuests_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvGuests.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvGuests_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlDataSourceGuests.UpdateParameters["ФИО"].DefaultValue = ((TextBox)gvGuests.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                SqlDataSourceGuests.UpdateParameters["Телефон"].DefaultValue = ((TextBox)gvGuests.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                SqlDataSourceGuests.UpdateParameters["Email"].DefaultValue = ((TextBox)gvGuests.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
                SqlDataSourceGuests.UpdateParameters["Код_гостя"].DefaultValue = gvGuests.DataKeys[e.RowIndex].Value.ToString();
                SqlDataSourceGuests.Update();
                gvGuests.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                // Добавим обработку ошибок
                Response.Write("<script>alert('An error occurred while updating: " + ex.Message + "');</script>");
            }
        }

        protected void gvGuests_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvGuests.EditIndex = -1;
            BindGrid();
        }
    }
}
