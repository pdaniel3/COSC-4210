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
    public partial class InstrumentDataGridCategoryManager : System.Web.UI.UserControl
    {
        private MusicalInstrument instrument;
        private IMusicalInstrumentPortal miInterface = new MusicalInstrumentPortal();

        public event EventHandler DoneEditing;

        //set up property statement so the user control has a DataSource property
        public MusicalInstrument DataSource
        {
            get { return instrument; }
            set { instrument = value; }
        }

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
            if (DataSource != null)
            {
                BindList();
                BindForm(DataSource);
            }
        }

        private void BindForm(MusicalInstrument instrument)
        {
            this.ViewState["InstrumentID"] = instrument.ID;
            InstrumentName.Text = instrument.Brand + " " + instrument.Name + " Categories";
            categoryTable.DataSource = instrument.Categories;
            addButton.CommandArgument = instrument.ID.ToString();

        }

        private void ClearDDL()
        {
            categoriesDDL.Items.Clear();
            categoriesDDL.Items.Add(new ListItem("---Select A Category---", "0"));
        }

        private void BindList()
        {
            InstrumentName.Text = instrument.Brand + " " + instrument.Name;

            ClearDDL();


            categoriesDDL.DataSource = miInterface.GetInstrumentCategories()
                                                        .Where(c => !(DataSource.Categories.Select(d => d.ID).ToList()).Contains(c.ID))
                                                        .OrderBy(c => c.InstrumentCategoryName)
                                                        .ToList();
            categoriesDDL.DataBind();

            categoryTable.DataSource = DataSource.Categories;
            categoryTable.DataBind();

        }

        private void ClearForm()
        {
            InstrumentName.Text = string.Empty;
            addButton.CommandArgument = "0";
        }

        protected void addButton_OnCommand(object s, CommandEventArgs e)
        {
            if(categoriesDDL.SelectedIndex!=0)
            {
                ErrorMessage.Text = "";
                miInterface.AddCategoryAssociation(Convert.ToInt32(e.CommandArgument), Convert.ToInt32(categoriesDDL.SelectedValue));
                DataSource = miInterface.GetMusicalInstrument(Convert.ToInt32(e.CommandArgument));
                Initialize();
            }
            else
            {
                ErrorMessage.Text = "Please select a category";
            }
        }

        private void OnDoneEditing()
        {
            EventHandler handler = DoneEditing;

            if (handler != null)
            {

                this.DoneEditing(this, new EventArgs());
            }
        }

        protected void dgCategories_OnItemCommmand(object s, DataGridCommandEventArgs e)
        {
            ClearForm();
            miInterface.DeleteCategoryAssociation(Convert.ToInt32(this.ViewState["InstrumentID"]), 
            miInterface.GetInstrumentCategory(Convert.ToInt32(categoryTable.DataKeys[e.Item.ItemIndex])).ID);
            DataSource = miInterface.GetMusicalInstrument(Convert.ToInt32(this.ViewState["InstrumentID"]));
            Initialize();
        }

        protected void doneButton_OnClick(object s, EventArgs e)
        {
            ClearForm();
            this.OnDoneEditing();
        }
    }
}