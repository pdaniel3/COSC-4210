using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COSC4210.MusicalIntruments.Web.Data_Contracts
{
    public class MusicalInstrument
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public int TypeID { get; set; }

        public string Brand { get; set; }
   
        public decimal Price { get; set; }

        public DateTime LastModified { get; set; }

        public string LastModifiedBy { get; set; }

        public IList<InstrumentCategory> Categories { get; set; }
    }
}