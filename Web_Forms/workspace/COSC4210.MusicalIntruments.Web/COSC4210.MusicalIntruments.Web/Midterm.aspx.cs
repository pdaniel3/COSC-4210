using COSC4210.MusicalIntruments.Web.Control;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COSC4210.MusicalIntruments.Web
{
    public partial class Midterm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userControlCollectCreditInfo_OnInfoCollected(object o, CreditEventArgs e)
        {
            userControlDisplayCreditInfo.DisplayThatInfo(e);
            userControlCollectCreditInfo.Visible = false;
            userControlDisplayCreditInfo.Visible = true;
        }
    }
}