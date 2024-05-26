<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="AdminEditBookings.aspx.cs" Inherits="ASOIU4.AdminEditBookings" %>

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
        <h2>Manage Bookings</h2>
        <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" DataKeyNames="Код_бронирования" DataSourceID="SqlDataSourceBookings" OnRowEditing="gvBookings_RowEditing" OnRowUpdating="gvBookings_RowUpdating" OnRowCancelingEdit="gvBookings_RowCancelingEdit" OnRowDeleting="gvBookings_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Код_бронирования" HeaderText="Booking ID" ReadOnly="True" />
                <asp:BoundField DataField="Дата_бронирования" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" ApplyFormatInEditMode="true" />
                <asp:BoundField DataField="Время_бронирования" HeaderText="Booking Time" DataFormatString="{0:HH:mm}" ApplyFormatInEditMode="true" />
                <asp:BoundField DataField="Количество_персон" HeaderText="Number of Persons" />
                <asp:BoundField DataField="Код_филиала" HeaderText="Branch ID" />
                <asp:BoundField DataField="Код_гостя" HeaderText="Guest ID" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceBookings" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
            SelectCommand="SELECT * FROM бронирования" 
            UpdateCommand="UPDATE бронирования SET Дата_бронирования = @Дата_бронирования, Время_бронирования = @Время_бронирования, Количество_персон = @Количество_персон, Код_филиала = @Код_филиала, Код_гостя = @Код_гостя WHERE Код_бронирования = @Код_бронирования"
            DeleteCommand="DELETE FROM бронирования WHERE Код_бронирования = @Код_бронирования"
            InsertCommand="INSERT INTO бронирования (Дата_бронирования, Время_бронирования, Количество_персон, Код_филиала, Код_гостя) VALUES (@Дата_бронирования, @Время_бронирования, @Количество_персон, @Код_филиала, @Код_гостя)">
            <UpdateParameters>
                <asp:Parameter Name="Дата_бронирования" Type="DateTime" />
                <asp:Parameter Name="Время_бронирования" DbType="Time" />
                <asp:Parameter Name="Количество_персон" Type="Int32" />
                <asp:Parameter Name="Код_филиала" Type="Int32" />
                <asp:Parameter Name="Код_гостя" Type="Int32" />
                <asp:Parameter Name="Код_бронирования" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Код_бронирования" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Дата_бронирования" Type="DateTime" />
                <asp:Parameter Name="Время_бронирования" DbType="Time" />
                <asp:Parameter Name="Количество_персон" Type="Int32" />
                <asp:Parameter Name="Код_филиала" Type="Int32" />
                <asp:Parameter Name="Код_гостя" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <div class="add-container">
            <h3>Add New Booking</h3>
            <asp:TextBox ID="txtBookingDate" runat="server" Placeholder="Booking Date (yyyy-MM-dd)"></asp:TextBox>
            <asp:TextBox ID="txtBookingTime" runat="server" Placeholder="Booking Time (HH:mm)"></asp:TextBox>
            <asp:TextBox ID="txtPersons" runat="server" Placeholder="Number of Persons"></asp:TextBox>
            <asp:DropDownList ID="ddlBranch" runat="server" DataSourceID="SqlDataSourceBranches" DataTextField="Название" DataValueField="Код_филиала">
                <asp:ListItem Text="Select Branch" Value="" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceBranches" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASOIU4ConnectionString %>" 
                SelectCommand="SELECT Код_филиала, Название FROM филиалы">
            </asp:SqlDataSource>
            <asp:TextBox ID="txtGuestID" runat="server" Placeholder="Guest ID"></asp:TextBox>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
