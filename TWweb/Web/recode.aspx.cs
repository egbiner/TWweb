using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class recode : System.Web.UI.Page
    {
        public string re_code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["recode"] != null)
            {
                re_code = Request["recode"];
            }
        }
    }
}