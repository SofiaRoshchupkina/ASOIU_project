<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="ASOIU4.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style8 {
        height: 26px;
    }
    .auto-style9 {
        width: 584px;
        text-align: right;
    }
    .auto-style10 {
        height: 26px;
        width: 584px;
        text-align: right;
    }
    .auto-style11 {
        text-align: center;
    }
        .auto-style12 {
            height: 26px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style9">
            <asp:Label ID="Label2" runat="server" Text="Введите название:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style10">
            <asp:Label ID="Label3" runat="server" Text="Введите дату публикации:"></asp:Label>
        </td>
        <td class="auto-style12">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style9">
            <asp:Label ID="Label4" runat="server" Text="Выберите автора:"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource10" DataTextField="Name" DataValueField="ID_Author">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" SelectCommand="SELECT * FROM [Author]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style9">
            <asp:Label ID="Label5" runat="server" Text="Выберите жанр:"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource11" DataTextField="Name" DataValueField="ID_Genre">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" OnSelecting="SqlDataSource11_Selecting" SelectCommand="SELECT * FROM [Genre]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style11" colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Добавить" />
        </td>
    </tr>
</table>
</asp:Content>
