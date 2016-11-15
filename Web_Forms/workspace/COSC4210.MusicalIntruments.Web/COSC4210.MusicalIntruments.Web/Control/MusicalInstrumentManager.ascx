<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MusicalInstrumentManager.ascx.cs" Inherits="COSC4210.MusicalIntruments.Web.Control.MusicalInstrumentManager" %>

<%@ Register TagPrefix="uc" TagName="InstrumentDataGridCategoryManager" Src="~/Control/InstrumentDataGridCategoryManager.ascx" %>

<asp:MultiView ID="musicalInstrumentsForm" runat="server" ActiveViewIndex="1">
    <asp:View ID="vForm" runat="server">
        Musical Instrument Entities
        <br />
    <asp:Label
        ID="brandLabel"
        runat="server"
        Text="*Brand Name (ex: Fender): " />
    <br />
    
    <asp:TextBox
        ID="brandBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="brandValidator"
        Runat="server"
        ControlToValidate="brandBox"
        ErrorMEssage="Please specify a brand."
        Display="Dynamic" />
    
    <br />
    <br />
    <asp:Label
        ID="priceLabel"
        runat="server"
        Text="*Price (ex: $150 or $51.53):" />
    <br />
    <asp:Label
        ID="cashSymbol"
        runat="server"
        Text="$" />
    <asp:TextBox
        ID="priceBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="priceBoxRFV"
        Runat="server"
        ControlToValidate="priceBox"
        ErrorMEssage="Please enter a dollar amount"
        Display="Dynamic" />
    <asp:RegularExpressionValidator
        ID="cashValidator"
        ErrorMessage="This is not a valid dollar amount"
        Display="Dynamic"
        Runat="server"
        ControlToValidate="priceBox"
        ValidationExpression="^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$" />
    <br />
    <br />

    <asp:Label
        ID="nameLabel"
        runat="server"
        Text="*Name (ex: violin):" />
    <br />

    <asp:TextBox
        ID="nameBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="nameValidator"
        Runat="server"
        ControlToValidate="nameBox"
        ErrorMEssage="Please specify your instrument name."
        Display="Dynamic" />
    <br />
    <br />
    
    
    <h2>Types</h2>
    <h3>Select an Instrument Type</h3>
    <h4>Types insclude Woodwind, Brass, Strings, Percussion, etc.</h4>
    <asp:DropDownList ID="ddlInstrumentTypes" runat="server" DataTextField="TypeName" DataValueField="ID" AppendDataBoundItems="true">
        <asp:ListItem Text="---Select A Type---" Value="0" />
        </asp:DropDownList>
    <asp:RequiredFieldValidator 
        ID="rfv1" 
        runat="server" 
        ControlToValidate="ddlInstrumentTypes" 
        InitialValue="0" 
        ErrorMessage="Please select a type" />
    <br />
    <br />
    
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnCommand="btnSave_OnCommand" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_OnClick" />
    <br />
    </asp:View>
    <asp:View ID="list" runat="server" >
        <asp:Button ID="btnNewInstrument" runat="server" Text="New Instrument" OnClick="btnNewInstrument_OnClick" />
        <br />
        <br />
        <asp:DataGrid ID="dgInstrumentList" runat="server" DataKeyField="ID" OnItemCommand="dgInstrumentList_OnItemCommmand" AutoGenerateColumns="false">
            <Columns>
                <asp:ButtonColumn ButtonType="PushButton" CommandName ="EditInstrument" Text="Edit" />
                <asp:ButtonColumn ButtonType="PushButton" Text="Categories" CommandName="EditCategories"></asp:ButtonColumn>
                <asp:BoundColumn DataField="Name" HeaderText="Name"></asp:BoundColumn>
                <asp:BoundColumn DataField="Price" HeaderText="Price"></asp:BoundColumn>
                <asp:BoundColumn DataField="Brand" HeaderText="Brand"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
        </asp:View>
        <asp:View ID="categories" runat="server">
            <uc:InstrumentDataGridCategoryManager ID="ucInstrumentDataGridCategoryManager" runat="server" OnDoneEditing="ucInstrumentDataGridCategoryManager_OnDoneEditing" />
    </asp:View>
</asp:MultiView>