<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %> Info</h2>
    <h3>Mail, Email, Phone</h3>
    <address>
        1234 Fake St<br />
        Laramie, WY 82070<br />
        <abbr title="Phone">P:</abbr>
        123.555.6789
    </address>

    <address>
        <strong>Email:</strong>   <a href="mailto:pdaniel3@uwyo.edu">pdaniel3@uwyo.edu</a><br />
    </address>
</asp:Content>
