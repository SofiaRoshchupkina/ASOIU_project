<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs"  MasterPageFile="~/Site1.Master" Inherits="ASOIU4.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Регистрация</h2>
    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    <div>
        <asp:Label ID="lblFullName" runat="server" Text="ФИО:"></asp:Label>
        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblPhone" runat="server" Text="Телефон:"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblUsername" runat="server" Text="Логин:"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="lblPassword" runat="server" Text="Пароль:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnRegister" runat="server" Text="Зарегистрироваться" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
