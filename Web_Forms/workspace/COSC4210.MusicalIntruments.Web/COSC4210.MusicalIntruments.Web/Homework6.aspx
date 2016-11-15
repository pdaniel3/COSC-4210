<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homework6.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.Homework6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="enterInfoPanel" runat="server">
    <h1>Homework 6</h1>
    <h2>Instrument Information</h2>
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
        ValidationExpression="^\$(?=.*\d)\d{0,6}(\.\d{1,2})?$" />
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
    <h4>Types insclude Woodwind, Brass, Strings, Percussion</h4>
    <asp:DropDownList ID="typeDropDown" OnSelectedIndexChanged="typeDropDown_SelectedIndexChanged" AutoPostBack="true" runat="server">
        <asp:ListItem Value ="0" Selected ="True">Choose A Type</asp:ListItem>
        <asp:ListItem Value ="1">Woodwind</asp:ListItem>
        <asp:ListItem Value ="2">Brass</asp:ListItem>
        <asp:ListItem Value ="3">String</asp:ListItem>
        <asp:ListItem Value ="4">Percussion</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator 
        ID="rfv1" 
        runat="server" 
        ControlToValidate="typeDropDown" 
        InitialValue="0" 
        ErrorMessage="Please select a type" />
    <br />
    <br />

    <h2>Categories</h2>
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_New"
        Text="New"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_Old"
        Text="Old"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_GoodSound"
        Text="Good Sound"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_PoorSound"
        Text="Poor Sound"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_Loud"
        Text="Loud"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_Quiet"
        Text="Quiet"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />

    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_Consonant"
        Text="Consonant"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:CheckBox
        runat="server"
        AutoPostBack="true"
        ID="checkBox_Dissonant"
        Text="Dissonant"
        OnCheckedChanged="checkBox_CheckChanged" />
    <br />
    <asp:Button
        ID="submitButton"
        Text="Submit"
        runat="server" 
        OnClick="btn_Clicked"/>
    </asp:Panel>
    <br />
    <asp:Panel ID="outputPanel" runat="server" >
        <asp:Label ID="outputLabel" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
