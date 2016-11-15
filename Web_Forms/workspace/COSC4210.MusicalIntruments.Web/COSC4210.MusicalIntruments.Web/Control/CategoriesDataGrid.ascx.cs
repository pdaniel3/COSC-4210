using COSC4210.MusicalIntruments.Web.Data_Contracts;
using COSC4210.MusicalIntruments.Web.Instruments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public partial class CategoriesDataGrid : System.Web.UI.UserControl
    {
        public event EventHandler DoneEditing;

        IMusicalInstrumentPortal miInterface = new MusicalInstrumentPortal();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Initialize();
            }
        }

        public void Initialize()
        {
            ClearForm();
            BindList();
        }

        private void BindList()
        {
            IList<InstrumentCategory> categories = miInterface.GetInstrumentCategories();
            dgCategoryList.DataSource = categories;
            dgCategoryList.DataBind();
        }

        private void ClearForm()
        {
            name.Text = string.Empty;
            btnSave.CommandArgument = "0";
        }

        protected void btnNewInstrumentCategory_OnClick(object s, EventArgs e)
        {
            ClearForm();
            ShowForm(0);
        }

        

        protected void btnSave_OnCommand(object s, CommandEventArgs e)
        {
            if(Page.IsValid)
            {
                InstrumentCategory category = ScrapeForm();
                miInterface.SaveInstrumentCategory(category);
                OnDoneEditing();
                ShowForm(1);
            }
        }

        protected void btnCancel_OnClick(object s, CommandEventArgs e)
        {
            ShowForm(1);
        }

        private void OnDoneEditing()
        {
            EventHandler handler = DoneEditing;

            if (handler != null)
            {
                this.DoneEditing(this, new EventArgs());
            }
        }

        private InstrumentCategory ScrapeForm()
        {
            InstrumentCategory category = new InstrumentCategory();

            category.ID = Convert.ToInt32(btnSave.CommandArgument);
            category.InstrumentCategoryName = name.Text;
            return category;
        }

        private void ShowForm(int formIndex)
        {
            categoriesForm.ActiveViewIndex = formIndex;
        }

        protected void dgCategoryList_OnItemCommmand(object s, DataGridCommandEventArgs e)
        {
            int ID = Convert.ToInt32(dgCategoryList.DataKeys[e.Item.ItemIndex]);
            InstrumentCategory category = miInterface.GetInstrumentCategory(ID);
            ClearForm();
            BindForm(category);
            ShowForm(0);

        }

        protected void btnCancel_OnClick(object s, EventArgs e)
        {
            ShowForm(1);
        }

        private void BindForm(InstrumentCategory category)
        {
            name.Text = category.InstrumentCategoryName;
            btnSave.CommandArgument = category.ID.ToString();
        }
    }
}