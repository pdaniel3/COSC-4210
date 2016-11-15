using COSC4210.MusicalIntruments.Web.Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web
{
    public partial class Homework7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userControlCollectIt_OnInfoCollected(object o, InformationEventArgs e)
        {
            userControlDisplayIt.DisplayThatInfo(e);
            userControlCollectIt.Visible = false;
            userControlDisplayIt.Visible = true;
        }

    }
}