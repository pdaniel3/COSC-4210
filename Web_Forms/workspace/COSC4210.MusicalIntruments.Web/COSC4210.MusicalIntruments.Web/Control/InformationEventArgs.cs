using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace COSC4210.MusicalIntruments.Web.Control
{
    public class InformationEventArgs : EventArgs
    {
        //variables used for output
        public string Brand { get; set; }
        public string Price { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string CheckBoxes { get; set; }
    }
}