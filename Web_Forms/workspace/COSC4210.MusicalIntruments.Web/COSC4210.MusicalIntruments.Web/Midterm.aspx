<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Midterm.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.Midterm" %>
<%@ Register TagPrefix="midterm" TagName="CollectInfo" Src="~/Control/CollectCreditInfo.ascx" %>
<%@ Register TagPrefix="midterm" TagName="DisplayInfo" Src="~/Control/DisplayCreditInfo.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <midterm:CollectInfo ID="userControlCollectCreditInfo" runat="server" OnInfoCollected="userControlCollectCreditInfo_OnInfoCollected" />    
        <midterm:DisplayInfo ID="userControlDisplayCreditInfo" runat="server" Visible="false"/>
    </div>
</asp:Content>
