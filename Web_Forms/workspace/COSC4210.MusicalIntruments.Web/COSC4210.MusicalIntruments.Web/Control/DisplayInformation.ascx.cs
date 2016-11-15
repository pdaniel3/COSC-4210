using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public partial class DisplayInfoControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void DisplayThatInfo(InformationEventArgs arguments)
        {
            string output = "Data entered:" + "<br>" + "<br>";
            string brand = "Brand: " + arguments.Brand + "<br>";
            string price = "Price: " + arguments.Price + "<br>";
            string name = "Name: " + arguments.Name + "<br>";
            string type = "Type: " + arguments.Type + "<br>" + "<br>";
            string checkBoxes = arguments.CheckBoxes + "<br>";

            output = output + brand + price + name + type + "Attributes:" + "<br>" + checkBoxes;
            outputLabel.Text = output;
        }
    }
}