using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public partial class CollectCreditInfo : System.Web.UI.UserControl
    {
        public event EventHandler<CreditEventArgs> InfoCollected;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cvCardNumber_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            bool valid = false;
            if (ccTypeDD.SelectedItem.Text == "Discover")
            {
                valid = checkDiscover(cardNumberBox.Text);
            }
            else if(ccTypeDD.SelectedItem.Text == "American Express")
            {
                valid = checkAmex(cardNumberBox.Text);
            }
            else if(ccTypeDD.SelectedItem.Text == "Visa")
            {
                valid = checkVisa(cardNumberBox.Text);
            }
            else if (ccTypeDD.SelectedItem.Text == "MasterCard")
            {
                valid = checkMasterCard(cardNumberBox.Text);
            }
            else
            {
                valid = false;
            }

            e.IsValid = valid;
        }

        private bool checkVisa(string cardNumber)
        {
            bool valid = false;
            if((cardNumber.Length == 16 || cardNumber.Length == 13) && cardNumber[0] == '4')
            {
                valid = luhn(cardNumber);
            }
            return valid;
        }

        private bool checkMasterCard(string cardNumber)
        {
            bool valid = false;
            if(cardNumber.Length == 16)
            {
                if(cardNumber[0] == '5' && (cardNumber[1]-'0' >= 1 || cardNumber[1]-'0' <= 5))
                {
                    valid = luhn(cardNumber);
                }
            }
            return valid;
        }

        private bool checkAmex(string cardNumber)
        {
            bool valid = false;
            if (cardNumber.Length == 15)
            {
                if (cardNumber[0] == '3' && (cardNumber[1] == '4' || cardNumber[1] == '7'))
                {
                    valid = luhn(cardNumber);
                }
            }
            return valid;
        }

        private bool checkDiscover(string cardNumber)
        {
            bool valid = false;
            if (cardNumber.Length == 16)
            {
                if (cardNumber[0] == '6' && 
                    cardNumber[1] == '0' &&
                    cardNumber[2] == '1' &&
                    cardNumber[3] == '1')
                {
                    valid = luhn(cardNumber);
                }
            }
            return valid;
        }

        //4388576018402625
        private bool luhn(string cardNumber)
        {
            bool valid = false;
            int counter = 0;
            int evensum = 0;
            int oddsum = 0;
            for (int i = cardNumber.Length - 1; i >= 0; i = i - 1)
            {
                if (counter % 2 != 0)
                {
                    int doubleCurrentEntry = 2 * (cardNumber[i]-'0');
                    if (doubleCurrentEntry > 9)
                    {
                        doubleCurrentEntry = doubleCurrentEntry - 9;
                    }
                    evensum = evensum + doubleCurrentEntry;
                }
                else
                {
                    oddsum = oddsum + (cardNumber[i]-'0');
                }
                counter++;
            }

            int totalsum = evensum + oddsum;
            if (totalsum % 10 == 0)
            {
                valid = true;
            }
            return valid;
        }

        protected void submit_OnClick(object o, EventArgs e)
        {
            if (Page.IsValid)
            {
                this.OnInfoCollected();
            }
        }

        private void OnInfoCollected()
        {
            EventHandler<CreditEventArgs> mrHandler = InfoCollected;

            if (mrHandler != null)
            {
                CreditEventArgs arguments = new CreditEventArgs();
                arguments.FirstName = firstNameBox.Text;
                arguments.LastName = lastNameBox.Text;
                arguments.StreetAddress = addressBox.Text;
                arguments.City = cityBox.Text;
                arguments.State = stateDD.SelectedItem.Text;
                arguments.ZipCode = zipBox.Text;
                arguments.InvoiceTotal = invoiceBox.Text;
                arguments.CreditCardType = ccTypeDD.SelectedItem.Text;
                arguments.CreditCardNumber = cardNumberBox.Text;
                arguments.ExpirationDate = monthDD.SelectedItem.Text + "/" + yearDD.SelectedItem.Text;
                
                mrHandler(this, arguments);
            }
        }
    }
}
