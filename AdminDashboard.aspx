<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="AdminDashboard.aspx.cs" Inherits="ASOIU4.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-container {
            padding: 20px;
        }
        .admin-menu {
            margin-bottom: 20px;
        }
        .admin-menu a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .admin-menu a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <h1>Панель адмистратора</h1>
        <div class="admin-menu">
            <a href="AdminEditGuests.aspx">Редактировать гостей</a>
            <a href="AdminEditMenu.aspx">Редактировать меню</a>
            <a href="AdminEditBranches.aspx">Редактировать филлиалы</a>
            <a href="AdminEditBookings.aspx">Редактировать брони</a>
        </div>
        <asp:Label ID="lblAdminInfo" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
