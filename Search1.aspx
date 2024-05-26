<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search1.aspx.cs" Inherits="ASOIU4.Search1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Общие стили */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3; /* Нежно зеленый */
            margin: 0;
            padding: 0;
        }

        /* Стили для формы бронирования */
        .form-container {
            margin-top: 20px;
            width: 50%; /* Ширина формы */
            margin: auto; /* Центрирование формы */
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type=text],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group input[type=submit] {
            background-color: #4CAF50; /* Зеленый цвет кнопки */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s; /* Плавное изменение цвета фона при наведении */
        }

        .form-group input[type=submit]:hover {
            background-color: #45a049; /* Зеленый цвет кнопки при наведении */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Форма бронирования места в ресторане</h2>
        <asp:Calendar ID="calBookingDate" runat="server" CssClass="form-control" placeholder="Дата бронирования"></asp:Calendar>
        <asp:DropDownList ID="ddlBookingTime" runat="server" CssClass="form-control" placeholder="Время бронирования">
            <asp:ListItem Text="12:00" Value="12:00"></asp:ListItem>
            <asp:ListItem Text="13:00" Value="13:00"></asp:ListItem>
            <asp:ListItem Text="14:00" Value="14:00"></asp:ListItem>
            <asp:ListItem Text="15:00" Value="15:00"></asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtPersons" runat="server" CssClass="form-control" placeholder="Количество персон"></asp:TextBox>
        <asp:DropDownList ID="ddlFilial" runat="server" CssClass="form-control" placeholder="Выберите филиал" DataSourceID="SqlDataSourceFilials" DataTextField="Название" DataValueField="Код_филиала">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceFilials" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
            SelectCommand="SELECT Код_филиала, Название FROM филиалы">
        </asp:SqlDataSource>
        <asp:Button ID="btnSubmit" runat="server" Text="Забронировать" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>
