using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASOIU4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Установка параметра сортировки по умолчанию (по возрастанию цены)
                SqlDataSource1.SelectCommand = "SELECT Название_блюда, Цена, Ингредиенты, Категория_блюда, Murl, Код_филиала FROM меню WHERE Код_филиала = @Filial ORDER BY Цена ASC";
            }
        }

        protected void ddlFilial_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Обновление данных ListView после изменения выбора филиала
            ListView1.DataBind();
        }

        protected void ddlSortOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Получение выбранного значения порядка сортировки
            string sortOrder = ddlSortOrder.SelectedValue;

            // Обновление SQL запроса с новым порядком сортировки
            SqlDataSource1.SelectCommand = "SELECT Название_блюда, Цена, Ингредиенты, Категория_блюда, Murl, Код_филиала FROM меню WHERE Код_филиала = @Filial ORDER BY Цена " + sortOrder;

            // Обновление данных ListView
            ListView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Получение текста из текстового поля поиска
            string searchQuery = txtSearch.Text.Trim();

            // Формирование SQL запроса для фильтрации по названию товара
            // Заметь, что мы используем LIKE оператор для частичного совпадения
            SqlDataSource1.SelectCommand = "SELECT Название_блюда, Цена, Ингредиенты, Категория_блюда, Murl, Код_филиала FROM меню WHERE Код_филиала = @Filial AND Название_блюда LIKE '%' + @SearchQuery + '%'";

            // Установка параметра поискового запроса
            SqlDataSource1.SelectParameters.Add("SearchQuery", searchQuery);

            // Обновление данных ListView
            ListView1.DataBind();
        }
    }
}
