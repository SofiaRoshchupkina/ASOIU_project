<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="AdminEditMenu.aspx.cs" Inherits="ASOIU4.AdminEditMenu" %>

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
        <h2>Manage Menu</h2>
        <asp:GridView ID="gvMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Код_блюда" DataSourceID="SqlDataSourceMenu" OnRowEditing="gvMenu_RowEditing" OnRowUpdating="gvMenu_RowUpdating" OnRowCancelingEdit="gvMenu_RowCancelingEdit" OnRowDeleting="gvMenu_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Код_блюда" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Название_блюда" HeaderText="Dish Name" />
                <asp:BoundField DataField="Цена" HeaderText="Price" />
                <asp:BoundField DataField="Ингредиенты" HeaderText="Ingredients" />
                <asp:BoundField DataField="Категория_блюда" HeaderText="Category" />
                <asp:BoundField DataField="Murl" HeaderText="Image URL" />
                <asp:BoundField DataField="Код_филиала" HeaderText="Branch ID" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMenu" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
            SelectCommand="SELECT * FROM меню" 
            UpdateCommand="UPDATE меню SET Название_блюда = @Название_блюда, Цена = @Цена, Ингредиенты = @Ингредиенты, Категория_блюда = @Категория_блюда, Murl = @Murl, Код_филиала = @Код_филиала WHERE Код_блюда = @Код_блюда"
            DeleteCommand="DELETE FROM меню WHERE Код_блюда = @Код_блюда"
            InsertCommand="INSERT INTO меню (Название_блюда, Цена, Ингредиенты, Категория_блюда, Murl, Код_филиала) VALUES (@Название_блюда, @Цена, @Ингредиенты, @Категория_блюда, @Murl, @Код_филиала)">
            <UpdateParameters>
                <asp:Parameter Name="Название_блюда" Type="String" />
                <asp:Parameter Name="Цена" Type="Decimal" />
                <asp:Parameter Name="Ингредиенты" Type="String" />
                <asp:Parameter Name="Категория_блюда" Type="String" />
                <asp:Parameter Name="Murl" Type="String" />
                <asp:Parameter Name="Код_филиала" Type="Int32" />
                <asp:Parameter Name="Код_блюда" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Код_блюда" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Название_блюда" Type="String" />
                <asp:Parameter Name="Цена" Type="Decimal" />
                <asp:Parameter Name="Ингредиенты" Type="String" />
                <asp:Parameter Name="Категория_блюда" Type="String" />
                <asp:Parameter Name="Murl" Type="String" />
                <asp:Parameter Name="Код_филиала" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <div class="add-container">
            <h3>Add New Dish</h3>
            <asp:TextBox ID="txtDishName" runat="server" Placeholder="Dish Name"></asp:TextBox>
            <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price"></asp:TextBox>
            <asp:TextBox ID="txtIngredients" runat="server" Placeholder="Ingredients"></asp:TextBox>
            <asp:TextBox ID="txtCategory" runat="server" Placeholder="Category"></asp:TextBox>
            <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Image URL"></asp:TextBox>
            <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="SqlDataSourceBranches" DataTextField="Название" DataValueField="Код_филиала">
                <asp:ListItem Text="Select Branch" Value="" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceBranches" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
                SelectCommand="SELECT Код_филиала, Название FROM филиалы">
            </asp:SqlDataSource>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
