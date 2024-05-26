<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ASOIU4.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Измененный стиль для таблицы */
        .table-container {
            margin-top: 20px;
        }
        .table-container table {
            width: 100%;
            border-collapse: collapse;
        }
        .table-container th, .table-container td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .table-container th {
            background-color: #f2f2f2;
        }
        .table-container img {
            max-width: 200px; /* увеличьте максимальную ширину */
            max-height: 200px; /* увеличьте максимальную высоту */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Выпадающий список для выбора филиала -->
    <asp:DropDownList ID="ddlFilial" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilial_SelectedIndexChanged" DataSourceID="SqlDataSourceFilials" DataTextField="Название" DataValueField="Код_филиала">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceFilials" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
        SelectCommand="SELECT Код_филиала, Название FROM филиалы">
    </asp:SqlDataSource>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

    <!-- Выпадающий список для выбора порядка сортировки -->
    <asp:DropDownList ID="ddlSortOrder" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortOrder_SelectedIndexChanged">
        <asp:ListItem Text="По возрастанию" Value="ASC"></asp:ListItem>
        <asp:ListItem Text="По убыванию" Value="DESC"></asp:ListItem>
    </asp:DropDownList>

    <!-- Таблица для отображения данных из БД -->
    <div class="table-container"> <!-- Скрыть таблицу до выбора филиала -->
        <table>
            <thead>
                <tr>
                    <th>Фото</th>
                    <th>Название товара</th>
                    <th>Категория</th>
                    <th>Состав</th>
                    <th>Цена</th>
                </tr>
            </thead>
            <tbody>
                <!-- Привязываем данные из ListView к таблице -->
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr>
                            <!-- Фото по ссылке -->
                            <td>
                                <img src='<%# Eval("Murl") %>' alt='<%# Eval("Название_блюда") %>' />
                            </td>
                            <!-- Название товара -->
                            <td><%# Eval("Название_блюда") %></td>
                            <!-- Категория -->
                            <td><%# Eval("Категория_блюда") %></td>
                            <!-- Состав -->
                            <td><%# Eval("Ингредиенты") %></td>
                            <!-- Цена -->
                            <td><%# Eval("Цена") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
    </div>

    <!-- Источник данных из БД -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" SelectCommand="SELECT Название_блюда, Цена, Ингредиенты, Категория_блюда, Murl, Код_филиала FROM меню WHERE Код_филиала = @Filial ORDER BY Цена ASC">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFilial" Name="Filial" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
