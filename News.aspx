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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="news-card">
                <!-- Отображение изображения -->
                <img src='<%# Eval("Nurl") %>' alt="Image" class="news-image" />
                <h2 class="news-title"><%# Eval("Ntitle") %></h2>
                <p class="news-text"><%# Eval("Ntext") %></p>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" SelectCommand="SELECT Ntext, Ntitle, Nurl FROM news"></asp:SqlDataSource>
</asp:Content>
