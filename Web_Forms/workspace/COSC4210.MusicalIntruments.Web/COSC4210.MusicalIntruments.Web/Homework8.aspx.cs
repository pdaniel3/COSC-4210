using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web
{
    public partial class Homework8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                this.InitializeCulture();
            }
        }

        private void InitializeMusicalInstrumententsManager()
        {
            hw8View.ActiveViewIndex = 0;
            ucMusicalInstrumentsManager.Initialize();
            //ucTypesDDL.Initialize();
            //ucCategoriesDataGrid.Initialize();
        }

        private void InitializeTypesDDL()
        {
            hw8View.ActiveViewIndex = 1;
            //ucMusicalInstrumentsManager.Initialize();
            ucTypesDDL.Initialize();
            //ucCategoriesDataGrid.Initialize();
        }

        private void InitializeCategoriesDataGrid()
        {
            hw8View.ActiveViewIndex = 2;
            //ucMusicalInstrumentsManager.Initialize();
            //ucTypesDDL.Initialize();
            ucCategoriesDataGrid.Initialize();
        }

        protected void ucMusicalInstrumentsManager_OnDoneEditing(object s, EventArgs e)
        {
            ucMusicalInstrumentsManager.Initialize();
            //ucTypesDDL.Initialize();
           // ucCategoriesDataGrid.Initialize();
        }

        protected void ucTypesDDL_OnDoneEditing(object s, EventArgs e)
        {
            //ucMusicalInstrumentsManager.Initialize();
            ucTypesDDL.Initialize();
            //ucCategoriesDataGrid.Initialize();
        }

        protected void ucCategoriesDataGrid_OnDoneEditing(object s, EventArgs e)
        {
            //ucMusicalInstrumentsManager.Initialize();
            //ucTypesDDL.Initialize();
            ucCategoriesDataGrid.Initialize();
        }

        protected void btnViewChange_OnCommand(object s, CommandEventArgs e)
        {
            hw8View.ActiveViewIndex = Convert.ToInt32(e.CommandArgument);
        }
    }
}