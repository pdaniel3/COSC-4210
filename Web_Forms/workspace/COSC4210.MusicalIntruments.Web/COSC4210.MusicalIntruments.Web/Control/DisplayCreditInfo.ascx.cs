using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public partial class DisplayCreditInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void DisplayThatInfo(CreditEventArgs arguments)
        {
            //string brand = "Brand: " + arguments.Brand + "<br>";
            string firstName = "First Name: " + arguments.FirstName + "<br>";
            string lastName = "Last Name: " + arguments.LastName + "<br>";
            string address = "Address: " + arguments.StreetAddress + "<br>";
            string city = "City: " + arguments.City + "<br>";
            string state = "State: " + arguments.State + "<br>";
            string zipCode = "Zip Code: " + arguments.ZipCode + "<br>";
            string invoiceTotal = "Invoice Total: $" + arguments.InvoiceTotal + "<br>";

            //found this from here http://stackoverflow.com/questions/8203900/how-get-yesterday-and-tomorrow-datetime-in-c-sharp
            string tomorrow = "Will be shipped: "
                             + DateTime.Now.AddDays(1).ToLongDateString()
                             + "<br>";
            outputLabel.Text = firstName + lastName + address + city + state + zipCode + invoiceTotal + tomorrow;
            
        }
    }
}