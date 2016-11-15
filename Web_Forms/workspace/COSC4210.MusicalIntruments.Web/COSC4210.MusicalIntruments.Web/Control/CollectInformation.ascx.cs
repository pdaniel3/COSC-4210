using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public partial class CollectItemControl : System.Web.UI.UserControl
    {
        public event EventHandler<InformationEventArgs> InfoCollected;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void checkBox_CheckChanged(object sender, EventArgs e)
        {

            if (checkBox_New.Checked == true)
            {
                checkBox_Old.Visible = false;
            }
            else
            {
                checkBox_Old.Visible = true;
            }


            if (checkBox_Old.Checked == true)
            {
                checkBox_New.Visible = false;
            }
            else
            {
                checkBox_New.Visible = true;
            }


            if (checkBox_GoodSound.Checked == true)
            {
                checkBox_PoorSound.Visible = false;
            }
            else
            {
                checkBox_PoorSound.Visible = true;
            }

            if (checkBox_PoorSound.Checked == true)
            {
                checkBox_GoodSound.Visible = false;
            }
            else
            {
                checkBox_GoodSound.Visible = true;
            }

            if (checkBox_Loud.Checked == true)
            {
                checkBox_Quiet.Visible = false;
            }
            else
            {
                checkBox_Quiet.Visible = true;
            }

            if (checkBox_Quiet.Checked == true)
            {
                checkBox_Loud.Visible = false;
            }
            else
            {
                checkBox_Loud.Visible = true;
            }

            if (checkBox_Consonant.Checked == true)
            {
                checkBox_Dissonant.Visible = false;
            }
            else
            {
                checkBox_Dissonant.Visible = true;
            }

            if (checkBox_Dissonant.Checked == true)
            {
                checkBox_Consonant.Visible = false;
            }
            else
            {
                checkBox_Consonant.Visible = true;
            }
        }

        protected void submit_OnClick(object o, EventArgs e)
        {
            this.OnInfoCollected();
        }

        private void OnInfoCollected()
        {
            EventHandler<InformationEventArgs> mrHandler = InfoCollected;

            if (mrHandler != null)
            {
                InformationEventArgs arguments = new InformationEventArgs();

                //first section
                arguments.Brand = brandBox.Text;
                arguments.Price = priceBox.Text;
                arguments.Name = nameBox.Text;

                //dropdown menu
                arguments.Type = typeDropDown.SelectedItem.Text;

                //checkboxes
                arguments.CheckBoxes = handleCheckBoxes();

                //handle these arguments
                mrHandler(this, arguments);
            }
        }

        private string handleCheckBoxes()
        {
            string checkBoxes = "";

            if (checkBox_New.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_New.Text + "<br>";
            }

            if (checkBox_Old.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_Old.Text + "<br>";
            }


            if (checkBox_GoodSound.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_GoodSound.Text + "<br>";
            }

            if (checkBox_PoorSound.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_PoorSound.Text + "<br>";
            }

            if (checkBox_Loud.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_Loud.Text + "<br>";
            }

            if (checkBox_Quiet.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_Quiet.Text + "<br>";
            }

            if (checkBox_Consonant.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_Consonant.Text + "<br>";
            }

            if (checkBox_Dissonant.Checked == true)
            {
                checkBoxes = checkBoxes + "\t" + checkBox_Dissonant.Text + "<br>";
            }

            return checkBoxes;
        }
    }
}
