using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM View_1 WHERE ID_Genre = " + DropDownList1.SelectedValue;
                SqlDataSource8.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label2.Text = ex1.Message;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM View_1 WHERE ID_Author = " + DropDownList2.SelectedValue;
                SqlDataSource8.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label2.Text = ex1.Message;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                string crit, crit1;
                crit1 = " ID_Genre = " + DropDownList1.SelectedValue + "AND ID_Author = " + DropDownList2.SelectedValue;
                crit = "SELECT * FROM View_1 WHERE " + crit1;
                SqlDataSource8.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label2.Text = ex1.Message;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM View_1";
                SqlDataSource8.SelectCommand = crit;
                GridView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label2.Text = ex1.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string crit;
                crit = "SELECT * FROM View_1 WHERE ID_Book= " + GridView1.SelectedValue;
                SqlDataSource9.SelectCommand = crit;
                DetailsView1.DataBind();
            }
            catch (Exception ex1)
            {
                Label2.Text = ex1.Message;
            }
        }
    }
}