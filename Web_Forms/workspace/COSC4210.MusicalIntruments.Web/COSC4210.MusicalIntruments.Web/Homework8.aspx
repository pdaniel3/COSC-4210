<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homework8.aspx.cs" Inherits="COSC4210.MusicalIntruments.Web.Homework8" %>


<%@ Register TagPrefix="ps" TagName="MusicalInstrumentManager" Src="~/Control/MusicalInstrumentManager.ascx" %>
<%@ Register TagPrefix="ps" TagName="TypesDDL" Src="~/Control/TypesDDL.ascx" %>
<%@ Register TagPrefix="ps" TagName="CategoriesDataGrid" Src="~/Control/CategoriesDataGrid.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <asp:Button ID="btnMusicalInstruments" runat="server" OnCommand="btnViewChange_OnCommand" CommandArgument="0" Text="Musical Instruments" />&nbsp;
    <asp:Button ID="btnTypes" runat="server" OnCommand="btnViewChange_OnCommand" CommandArgument="1" Text="Types" />&nbsp;
    <asp:Button ID="btnCategories" runat="server" OnCommand="btnViewChange_OnCommand" CommandArgument="2" Text="Categories" />&nbsp;
    
    <br />
    <br />
    
    <asp:MultiView ID="hw8View" runat="server" ActiveViewIndex="0">
        
        <asp:View ID="vEntities" runat="server">
            <fieldset>
                <legend> Musical Instrument Entities</legend>
                <ps:MusicalInstrumentManager runat="server" ID="ucMusicalInstrumentsManager" OnDoneEditing="ucMusicalInstrumentsManager_OnDoneEditing" />
            </fieldset>
        </asp:View>

        <asp:View ID="vTypesDD" runat="server">
           <fieldset>
               <legend> Musical Instrument Types</legend>
               <ps:TypesDDL runat="server" ID="ucTypesDDL" OnDoneEditing="ucTypesDDL_OnDoneEditing" />
           </fieldset>
        </asp:View>

        <asp:View ID="Categories" runat="server">
            <fieldset>
                <legend> Musical Instrument Categories</legend>
                <ps:CategoriesDataGrid runat="server" ID="ucCategoriesDataGrid" OnDoneEditing="ucCategoriesDataGrid_OnDoneEditing" />
            </fieldset>
         </asp:View>
    </asp:MultiView>

</asp:Content>
