<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="AdminEditGuests.aspx.cs" Inherits="ASOIU4.AdminEditGuests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .edit-container {
            padding: 20px;
        }
        .edit-container table {
            width: 100%;
            border-collapse: collapse;
        }
        .edit-container th, .edit-container td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .edit-container th {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit-container">
        <h2>Manage Guests</h2>
        <asp:GridView ID="gvGuests" runat="server" AutoGenerateColumns="False" DataKeyNames="Код_гостя" DataSourceID="SqlDataSourceGuests" OnRowEditing="gvGuests_RowEditing" OnRowUpdating="gvGuests_RowUpdating" OnRowCancelingEdit="gvGuests_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="Код_гостя" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="ФИО" HeaderText="Full Name" />
                <asp:BoundField DataField="Телефон" HeaderText="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGuests" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
            SelectCommand="SELECT * FROM гости" 
            UpdateCommand="UPDATE гости SET ФИО = @ФИО, Телефон = @Телефон, Email = @Email WHERE Код_гостя = @Код_гостя">
            <UpdateParameters>
                <asp:Parameter Name="ФИО" Type="String" />
                <asp:Parameter Name="Телефон" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Код_гостя" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
