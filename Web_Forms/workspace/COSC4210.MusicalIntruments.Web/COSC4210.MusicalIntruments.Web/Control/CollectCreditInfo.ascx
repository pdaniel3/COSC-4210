<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CollectCreditInfo.ascx.cs" Inherits="COSC4210.MusicalIntruments.Web.Control.CollectCreditInfo" %>
<asp:Panel ID="creditCollectPanel" runat="server">
    <h1>Enter Your Information (All fields Required)</h1>
    <asp:Label
        ID="firstNameLabel"
        runat="server"
        Text="First Name: " />
    <asp:TextBox
        ID="firstNameBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="firstNameRFV"
        runat="server"
        ControlToValidate="firstNameBox"
        ErrorMessage="Please enter your first name"
        Display="Dynamic" />
    <br />

    <asp:Label
        ID="lastNameLabel"
        runat="server"
        Text="Last Name: " />
    <asp:TextBox
        ID="lastNameBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="lastNameRFV"
        runat="server"
        ControlToValidate="lastNameBox"
        ErrorMessage="Please enter your last name"
        Display="Dynamic" />
    <br />
    <asp:Label
        ID="addressLabel"
        runat="server"
        Text="Address: " />
    <asp:TextBox
        ID="addressBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="addressRFV"
        runat="server"
        ControlToValidate="addressBox"
        ErrorMessage="Please enter your address"
        Display="Dynamic" />
    <br />
    <asp:Label
        ID="cityLabel"
        runat="server"
        Text="City: " />
    <asp:TextBox
        ID="cityBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="cityRFV"
        runat="server"
        ControlToValidate="cityBox"
        ErrorMessage="Please enter your city"
        Display="Dynamic" />
    <br />
    <asp:DropDownList ID="stateDD" AutoPostBack="true" runat="server">
        <asp:ListItem Value="-1" Selected="True">Select A State</asp:ListItem>
        <asp:ListItem Value="0">AL</asp:ListItem>
        <asp:ListItem Value="1">AK</asp:ListItem>
        <asp:ListItem Value="2">AZ</asp:ListItem>
        <asp:ListItem Value="3">AR</asp:ListItem>
        <asp:ListItem Value="4">CA</asp:ListItem>
        <asp:ListItem Value="5">CO</asp:ListItem>
        <asp:ListItem Value="6">CT</asp:ListItem>
        <asp:ListItem Value="7">DE</asp:ListItem>
        <asp:ListItem Value="8">DC</asp:ListItem>
        <asp:ListItem Value="9">FL</asp:ListItem>
        <asp:ListItem Value="10">GA</asp:ListItem>
        <asp:ListItem Value="11">HI</asp:ListItem>
        <asp:ListItem Value="12">ID</asp:ListItem>
        <asp:ListItem Value="13">IL</asp:ListItem>
        <asp:ListItem Value="14">IN</asp:ListItem>
        <asp:ListItem Value="15">IA</asp:ListItem>
        <asp:ListItem Value="16">KS</asp:ListItem>
        <asp:ListItem Value="17">KY</asp:ListItem>
        <asp:ListItem Value="18">LA</asp:ListItem>
        <asp:ListItem Value="19">ME</asp:ListItem>
        <asp:ListItem Value="20">MD</asp:ListItem>
        <asp:ListItem Value="21">MA</asp:ListItem>
        <asp:ListItem Value="22">MI</asp:ListItem>
        <asp:ListItem Value="23">MN</asp:ListItem>
        <asp:ListItem Value="24">MS</asp:ListItem>
        <asp:ListItem Value="25">MO</asp:ListItem>
        <asp:ListItem Value="26">MT</asp:ListItem>
        <asp:ListItem Value="27">NE</asp:ListItem>
        <asp:ListItem Value="28">NV</asp:ListItem>
        <asp:ListItem Value="29">NH</asp:ListItem>
        <asp:ListItem Value="30">NJ</asp:ListItem>
        <asp:ListItem Value="31">NM</asp:ListItem>
        <asp:ListItem Value="32">NY</asp:ListItem>
        <asp:ListItem Value="33">NC</asp:ListItem>
        <asp:ListItem Value="34">ND</asp:ListItem>
        <asp:ListItem Value="35">OH</asp:ListItem>
        <asp:ListItem Value="36">OK</asp:ListItem>
        <asp:ListItem Value="37">OR</asp:ListItem>
        <asp:ListItem Value="38">PA</asp:ListItem>
        <asp:ListItem Value="39">RI</asp:ListItem>
        <asp:ListItem Value="40">SC</asp:ListItem>
        <asp:ListItem Value="41">SD</asp:ListItem>
        <asp:ListItem Value="42">TN</asp:ListItem>
        <asp:ListItem Value="43">TX</asp:ListItem>
        <asp:ListItem Value="44">UT</asp:ListItem>
        <asp:ListItem Value="45">VT</asp:ListItem>
        <asp:ListItem Value="46">VA</asp:ListItem>
        <asp:ListItem Value="47">WA</asp:ListItem>
        <asp:ListItem Value="48">WV</asp:ListItem>
        <asp:ListItem Value="49">WI</asp:ListItem>
        <asp:ListItem Value="50">WY</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator 
        ID="stateRFV" 
        runat="server" 
        ControlToValidate="stateDD" 
        InitialValue="-1" 
        ErrorMessage="Please select a state" />
    <br />
    <asp:Label
        ID="zipLabel"
        runat="server"
        Text="Zip Code: " />
    <asp:TextBox
        ID="zipBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="zipRFV"
        runat="server"
        ControlToValidate="zipBox"
        ErrorMessage="Please enter your zip code"
        Display="Dynamic" />
    <asp:RegularExpressionValidator
        ID="zipCodeValidator"
        ErrorMessage="This is not a valid zip code"
        Display="Dynamic"
        Runat="server"
        ControlToValidate="zipBox"
        ValidationExpression="\d{5}-?(\d{4})?$" />
    <br />
    <asp:Label
        ID="invoiceLabel"
        runat="server"
        Text="Invoice Total: $" />
    <asp:TextBox
        ID="invoiceBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="invoiceRFV"
        runat="server"
        ControlToValidate="invoiceBox"
        ErrorMessage="Please enter your invoice amount"
        Display="Dynamic" />
    <asp:RegularExpressionValidator
        ID="RegularExpressionValidator1"
        ErrorMessage="This is not a valid dollar amount"
        Display="Dynamic"
        Runat="server"
        ControlToValidate="invoiceBox"
        ValidationExpression="^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$" />
    <br />
    <asp:Label
        ID="Label1"
        runat="server"
        Text="Credit Card Type: " />
    <asp:DropDownList ID="ccTypeDD" AutoPostBack="true" runat="server">
        <asp:ListItem Value="0" Selected="True">Type</asp:ListItem>
        <asp:ListItem Value="1">Visa</asp:ListItem>
        <asp:ListItem Value="2">MasterCard</asp:ListItem>
        <asp:ListItem Value="3">American Express</asp:ListItem>
        <asp:ListItem Value="4">Discover</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator 
        ID="ccTypeRFV" 
        runat="server" 
        ControlToValidate="ccTypeDD" 
        InitialValue="0" 
        ErrorMessage="Please select a card type" />
    <br />
    <asp:Label
        ID="creditNumberLabel"
        runat="server"
        Text="Credit Card Number: " />
    <asp:TextBox
        ID="cardNumberBox"
        runat="server" />
    <asp:RequiredFieldValidator
        ID="cardNumberRFV"
        runat="server"
        ControlToValidate="cardNumberBox"
        ErrorMessage="Please enter your card number"
        Display="Dynamic" />
    <asp:CustomValidator
             ID="cvCardNumber" 
             Runat="server" 
             ControlToValidate="cardNumberBox" 
             ErrorMessage="Your card number is invalid" 
             Display="Dynamic" 
             OnServerValidate="cvCardNumber_ServerValidate"/>
    <br />
    <asp:Label
        ID="cardExpirationLabel"
        runat="server"
        Text="Card Expiration Date: " />
    <asp:DropDownList ID="monthDD" AutoPostBack="true" runat="server">
        <asp:ListItem Value="0" Selected="True">Month</asp:ListItem>
        <asp:ListItem Value="1">Jan</asp:ListItem>
        <asp:ListItem Value="2">Feb</asp:ListItem>
        <asp:ListItem Value="3">Mar</asp:ListItem>
        <asp:ListItem Value="4">Apr</asp:ListItem>
        <asp:ListItem Value="5">May</asp:ListItem>
        <asp:ListItem Value="6">Jun</asp:ListItem>
        <asp:ListItem Value="7">Jul</asp:ListItem>
        <asp:ListItem Value="8">Aug</asp:ListItem>
        <asp:ListItem Value="9">Sep</asp:ListItem>
        <asp:ListItem Value="10">Oct</asp:ListItem>
        <asp:ListItem Value="11">Nov</asp:ListItem>
        <asp:ListItem Value="12">Dec</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="yearDD" AutoPostBack="true" runat="server">
        <asp:ListItem Value="0" Selected="True">Year</asp:ListItem>
        <asp:ListItem Value="1">2016</asp:ListItem>
        <asp:ListItem Value="2">2017</asp:ListItem>
        <asp:ListItem Value="3">2018</asp:ListItem>
        <asp:ListItem Value="4">2019</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:RequiredFieldValidator 
        ID="monthRFV" 
        runat="server" 
        ControlToValidate="monthDD" 
        InitialValue="0" 
        ErrorMessage="Please select a month" />
    <asp:RequiredFieldValidator 
        ID="yearRFV" 
        runat="server" 
        ControlToValidate="yearDD" 
        InitialValue="0" 
        ErrorMessage="Please select a year" />
    <br />
    <asp:Button
        ID="submitButton"
        Text="Submit"
        runat="server" 
        OnClick="submit_OnClick"/>
</asp:Panel>
