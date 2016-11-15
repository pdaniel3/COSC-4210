<%@ Page Title="Homework7" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homework7.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.Homework7" %>
<%@ Register TagPrefix="homework7" TagName="CollectInfo" Src="~/Control/CollectInformation.ascx" %>
<%@ Register TagPrefix="homework7" TagName="DisplayInfo" Src="~/Control/DisplayInformation.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <homework7:CollectInfo ID="userControlCollectIt" runat="server" OnInfoCollected="userControlCollectIt_OnInfoCollected" />    
        <homework7:DisplayInfo ID="userControlDisplayIt" runat="server" Visible="false"/>
    </div>
</asp:Content>
