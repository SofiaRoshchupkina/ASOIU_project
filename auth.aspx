<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auth.aspx.cs" Inherits="ASOIU4.auth" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Авторизация</h2>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    <div>
        <asp:Label ID="lblUsername" runat="server" Text="Имя пользователя:"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblPassword" runat="server" Text="Пароль:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnLogin" runat="server" Text="Войти" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
