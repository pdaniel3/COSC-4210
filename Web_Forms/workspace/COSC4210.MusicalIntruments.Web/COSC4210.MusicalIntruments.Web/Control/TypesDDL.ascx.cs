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
    public partial class TypesDDL : System.Web.UI.UserControl
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
            IList<InstrumentType> types = miInterface.GetInstrumentTypes();
            dgTypeList.DataSource = types;
            dgTypeList.DataBind();
        }

        private void ClearForm()
        {
            name.Text = string.Empty;
            btnSave.CommandArgument = "0";
        }

        protected void btnNewInstrumentType_OnClick(object s, EventArgs e)
        {
            ClearForm();
            ShowForm(0);
        }



        protected void btnSave_OnCommand(object s, CommandEventArgs e)
        {
            if (Page.IsValid)
            {
                InstrumentType type = ScrapeForm();
                miInterface.SaveInstrumentType(type);
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

        private InstrumentType ScrapeForm()
        {
            InstrumentType type = new InstrumentType();

            type.ID = Convert.ToInt32(btnSave.CommandArgument);
            type.TypeName = name.Text;
            return type;
        }

        private void ShowForm(int formIndex)
        {
            typesForm.ActiveViewIndex = formIndex;
        }

        protected void dgTypeList_OnItemCommmand(object s, DataGridCommandEventArgs e)
        {
            int ID = Convert.ToInt32(dgTypeList.DataKeys[e.Item.ItemIndex]);
            InstrumentType type = miInterface.GetInstrumentType(ID);
            ClearForm();
            BindForm(type);
            ShowForm(0);

        }

        protected void btnCancel_OnClick(object s, EventArgs e)
        {
            ShowForm(1);
        }

        private void BindForm(InstrumentType type)
        {
            name.Text = type.TypeName;
            btnSave.CommandArgument = type.ID.ToString();
        }
    }
}
