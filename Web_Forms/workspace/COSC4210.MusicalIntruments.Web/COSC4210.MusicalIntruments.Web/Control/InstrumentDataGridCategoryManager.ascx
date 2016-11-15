<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstrumentDataGridCategoryManager.ascx.cs" Inherits="COSC4210.MusicalIntruments.Web.Control.InstrumentDataGridCategoryManager" %>

<asp:Label runat="server" ID="InstrumentName" />
<br /><br />
 
<asp:DropDownList ID="categoriesDDL" DataTextField="InstrumentCategoryName" DataValueField="ID" AppendDataBoundItems="true" runat="server">
    <asp:ListItem Text="---Select A Category---" Value="0" />
</asp:DropDownList>
<asp:Button ID="addButton" Text="add" runat="server" OnCommand="addButton_OnCommand" /><asp:Button ID="doneButton" Text="done" runat="server" OnCommand="doneButton_OnClick" />
<asp:Label runat="server" ID="ErrorMessage" />

<asp:DataGrid ID="categoryTable" runat="server" DataKeyField="ID" OnItemCommand="dgCategories_OnItemCommmand" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundColumn HeaderText="Name" DataField="InstrumentCategoryName"></asp:BoundColumn>
        <asp:ButtonColumn Text="delete" ButtonType="PushButton" />
    </Columns>
</asp:DataGrid>