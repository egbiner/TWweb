﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class applyform2 : System.Web.UI.Page
    {
        public string now;
        protected void Page_Load(object sender, EventArgs e)
        {
            now = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
}