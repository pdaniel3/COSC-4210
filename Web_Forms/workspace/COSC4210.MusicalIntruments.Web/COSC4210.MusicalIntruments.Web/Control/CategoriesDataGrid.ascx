<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoriesDataGrid.ascx.cs" Inherits="COSC4210.MusicalIntruments.Web.Control.CategoriesDataGrid" %>

<asp:MultiView ID="categoriesForm" runat="server" ActiveViewIndex="1">
    <asp:View ID="vForm" runat="server">
        Category Name
        <asp:TextBox ID="name" runat="server" />
        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
            ControlToValidate="name" 
            Display="Dynamic" 
            ErrorMessage="Please enter something, the field is empty">
        </asp:RequiredFieldValidator>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnCommand="btnSave_OnCommand" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_OnClick" />
    </asp:View>
    <asp:View ID="list" runat="server" >
        <asp:Button ID="btnNewInstrumentCategory" runat="server" Text="New Instrument Category" OnClick="btnNewInstrumentCategory_OnClick" />
        <br />
        <br />
        <asp:DataGrid ID="dgCategoryList" runat="server" DataKeyField="ID" OnItemCommand="dgCategoryList_OnItemCommmand" AutoGenerateColumns="false">
            <Columns>
                <asp:ButtonColumn ButtonType="PushButton" Text="Edit" />
                <asp:BoundColumn DataField="InstrumentCategoryName" HeaderText="Categories"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </asp:View>
</asp:MultiView>