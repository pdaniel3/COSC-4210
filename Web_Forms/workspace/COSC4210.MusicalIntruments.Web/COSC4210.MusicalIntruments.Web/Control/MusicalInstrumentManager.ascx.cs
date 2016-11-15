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

    public enum FormViews : int
    {
        EditView = 0,
        ListView = 1
    }

    public partial class MusicalInstrumentManager : System.Web.UI.UserControl
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
            ResetForm();
            BindLists();
            ucInstrumentDataGridCategoryManager.Initialize();
        }

        protected void ucInstrumentDataGridCategoryManager_OnDoneEditing(object s, EventArgs e)
        {
            ShowForm(1);
        }


        private void BindLists()
        {
            IList<MusicalInstrument> musicalInstruments = miInterface.GetMusicalInstruments();
            dgInstrumentList.DataSource = musicalInstruments;
            dgInstrumentList.DataBind();
        }

        private void ClearForm()
        {
            btnSave.CommandArgument = "0";
            //txt.focus()?
            brandBox.Text = string.Empty;
            priceBox.Text = string.Empty;
            nameBox.Text = string.Empty;

            
        }

        protected void btnNewInstrument_OnClick(object s, EventArgs e)
        {

            ClearForm();
            ResetForm();
            ShowForm(0);
            
            
        }

        protected void btnSave_OnCommand(object s, CommandEventArgs e)
        {
            if (Page.IsValid)
            {
                MusicalInstrument musicalInstrument = ScrapeForm();
                miInterface.SaveMusicalInstrument(musicalInstrument);
               
                Initialize();
                ShowForm(1);
            }
        }

        protected void btnCancel_OnClick(object s, EventArgs e)
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

        private MusicalInstrument ScrapeForm()
        {
            MusicalInstrument musicalInstrument = new MusicalInstrument();

            musicalInstrument.ID = Convert.ToInt32(btnSave.CommandArgument);
            musicalInstrument.Brand = brandBox.Text;
            musicalInstrument.Price = System.Convert.ToDecimal(priceBox.Text);
            musicalInstrument.Name = nameBox.Text;
            musicalInstrument.TypeID = Convert.ToInt32(ddlInstrumentTypes.SelectedValue);
            return musicalInstrument;
        }

        private void ShowForm(int formIndex)
        {
            musicalInstrumentsForm.ActiveViewIndex = formIndex;
        }

        protected void dgInstrumentList_OnItemCommmand(object s, DataGridCommandEventArgs e)
        {
            int ID = Convert.ToInt32(dgInstrumentList.DataKeys[e.Item.ItemIndex]);

            MusicalInstrument musicalInstrument = miInterface.GetMusicalInstrument(ID);

            if(e.CommandName == "EditInstrument")
            {
                ClearForm();
                BindForm(musicalInstrument);
                ShowForm(0);
            }
            else
            {
                ucInstrumentDataGridCategoryManager.DataSource = musicalInstrument;
                ucInstrumentDataGridCategoryManager.Initialize();
                ShowForm(2);
            }

        }
        

        private void BindForm(MusicalInstrument musicalInstrument)
        {
            nameBox.Text = musicalInstrument.Name;
            brandBox.Text = musicalInstrument.Brand;
            priceBox.Text = System.Convert.ToString(musicalInstrument.Price);
            btnSave.CommandArgument = musicalInstrument.ID.ToString();
            ddlInstrumentTypes.SelectedValue = musicalInstrument.TypeID.ToString();
            
        }

        private void ResetForm()
        {
            ResetTypesDropDownList();
            BindTypesDropDownList();
        }

        private void BindTypesDropDownList()
        {
            ddlInstrumentTypes.DataSource = miInterface.GetInstrumentTypes();
            ddlInstrumentTypes.DataBind();
        }

        private void ResetTypesDropDownList()
        {
            
            ddlInstrumentTypes.Items.Clear();
            ListItem item = new ListItem("---Select A Type---","0");
            ddlInstrumentTypes.Items.Add(item);
        }
    }
}
