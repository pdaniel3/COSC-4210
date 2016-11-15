<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TypesDDL.ascx.cs" Inherits="COSC4210.MusicalIntruments.Web.Control.TypesDDL" %>

<asp:MultiView ID="typesForm" runat="server" ActiveViewIndex="1">
    <asp:View ID="vForm" runat="server">
        Type Name
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
        <asp:Button ID="btnNewInstrumentType" runat="server" Text="New Instrument Type" OnClick="btnNewInstrumentType_OnClick" />
        <br />
        <br />
        <asp:DataGrid ID="dgTypeList" runat="server" DataKeyField="ID" OnItemCommand="dgTypeList_OnItemCommmand" AutoGenerateColumns="false">
            <Columns>
                <asp:ButtonColumn ButtonType="PushButton" Text="Edit" />
                <asp:BoundColumn DataField="TypeName" HeaderText="Types"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </asp:View>
</asp:MultiView>