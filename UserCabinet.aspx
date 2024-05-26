<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master" CodeBehind="UserCabinet.aspx.cs" Inherits="ASOIU4.UserCabinet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Личный кабинет</h1>
        <div id="userInfo">
            <asp:Label ID="lblUserInfo" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnEdit" runat="server" Text="Редактировать" OnClick="btnEdit_Click" />
            <br />
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Visible="false"></asp:TextBox><br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Visible="false"></asp:TextBox><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Visible="false"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="Сохранить" OnClick="btnSave_Click" Visible="false" />
        </div>
        <hr />
        <div id="bookingsTable">
            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvBookings_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Дата_бронирования" HeaderText="Дата бронирования" />
                    <asp:BoundField DataField="Время_бронирования" HeaderText="Время бронирования" />
                    <asp:BoundField DataField="Количество_персон" HeaderText="Количество персон" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Удалить" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
