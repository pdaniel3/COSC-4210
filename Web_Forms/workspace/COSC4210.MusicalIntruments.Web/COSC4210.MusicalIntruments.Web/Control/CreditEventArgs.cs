using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public class CreditEventArgs
    {
        public string FirstName{ get; set; }
        public string LastName{ get; set; }
        public string StreetAddress{ get; set; }
        public string City{ get; set; }
        public string State{ get; set; }
        public string ZipCode{ get; set; }
        public string InvoiceTotal{ get; set; }
        public string CreditCardType { get; set; }
        public string CreditCardNumber{ get; set; }
        public string ExpirationDate{ get; set; }
    }
}