<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ASOIU4.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Стили для карточек */
        .news-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .news-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .news-text {
            color: #666;
            margin-bottom: 10px;
        }
        .news-link {
            color: #007bff;
            text-decoration: none;
        }
        .news-link:hover {
            text-decoration: underline;
        }
        .news-image {
            max-width: 100%;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        /* Стили для контейнера */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Используем див для центрирования и оформления -->
    <div class="container">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <!-- Стилизованные карточки с информацией о филиалах -->
                <div class="news-card">
                    <h3 class="news-title"><%# Eval("Название") %></h3>
                    <p class="news-text">Адрес: <%# Eval("Адрес") %></p>
                    <p class="news-text">Телефон: <%# Eval("Телефон") %></p>
                    <p class="news-text">Время работы: <%# Eval("Время_работы") %></p>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" SelectCommand="SELECT Адрес, Телефон, Название, Время_работы FROM филиалы"></asp:SqlDataSource>
</asp:Content>
