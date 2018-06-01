using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Admin
{
    public partial class yanyiting_manage : System.Web.UI.Page
    {
        public DataTable t = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            //按时间排序就好了？
            t = SqlHelper.ExecuteDataTable("select * from yanyiting order by use_time_start DESC");
        }
    }
}