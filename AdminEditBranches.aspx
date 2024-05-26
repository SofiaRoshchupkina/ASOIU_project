<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="AdminEditBranches.aspx.cs" Inherits="ASOIU4.AdminEditBranches" %>

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
        .add-container {
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit-container">
        <h2>Manage Branches</h2>
        <asp:GridView ID="gvBranches" runat="server" AutoGenerateColumns="False" DataKeyNames="Код_филиала" DataSourceID="SqlDataSourceBranches" OnRowEditing="gvBranches_RowEditing" OnRowUpdating="gvBranches_RowUpdating" OnRowCancelingEdit="gvBranches_RowCancelingEdit" OnRowDeleting="gvBranches_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Код_филиала" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Название" HeaderText="Name" />
                <asp:BoundField DataField="Адрес" HeaderText="Address" />
                <asp:BoundField DataField="Телефон" HeaderText="Phone" />
                <asp:BoundField DataField="Время_работы" HeaderText="Working Hours" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceBranches" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
            SelectCommand="SELECT * FROM филиалы" 
            UpdateCommand="UPDATE филиалы SET Название = @Название, Адрес = @Адрес, Телефон = @Телефон, Время_работы = @Время_работы WHERE Код_филиала = @Код_филиала"
            DeleteCommand="DELETE FROM филиалы WHERE Код_филиала = @Код_филиала"
            InsertCommand="INSERT INTO филиалы (Название, Адрес, Телефон, Время_работы) VALUES (@Название, @Адрес, @Телефон, @Время_работы)">
            <UpdateParameters>
                <asp:Parameter Name="Название" Type="String" />
                <asp:Parameter Name="Адрес" Type="String" />
                <asp:Parameter Name="Телефон" Type="String" />
                <asp:Parameter Name="Время_работы" Type="String" />
                <asp:Parameter Name="Код_филиала" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Код_филиала" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Название" Type="String" />
                <asp:Parameter Name="Адрес" Type="String" />
                <asp:Parameter Name="Телефон" Type="String" />
                <asp:Parameter Name="Время_работы" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <div class="add-container">
            <h3>Add New Branch</h3>
            <asp:TextBox ID="txtName" runat="server" Placeholder="Name"></asp:TextBox>
            <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address"></asp:TextBox>
            <asp:TextBox ID="txtPhone" runat="server" Placeholder="Phone"></asp:TextBox>
            <asp:TextBox ID="txtWorkingHours" runat="server" Placeholder="Working Hours"></asp:TextBox>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
