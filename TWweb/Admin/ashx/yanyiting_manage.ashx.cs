using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// yanyiting_manage 的摘要说明
    /// </summary>
    public class yanyiting_manage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            object username = context.Session["admin"];
            if (username == null)
            {
                context.Response.Write("未登录！");
                return;
            }
            string action = context.Request["status"];
            string id = context.Request["id"];
            int i;
            switch (action)
            {
                case "pass":
                    DataTable t = SqlHelper.ExecuteDataTable("select image_url from scroll_img where id=@id",
                        new SqlParameter("@id", id));
                    i = SqlHelper.ExecuteNonQuery("update yanyiting set status=1,reason=null,handle_user=@username,handle_time=@handle_time where id=@id",
                        new SqlParameter("@id", id),
                        new SqlParameter("@username", username),
                        new SqlParameter("@handle_time", DateTime.Now));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "reject":
                    i = SqlHelper.ExecuteNonQuery("update yanyiting set status=2,handle_user=@username,handle_time=@handle_time,reason=@reason where id=@id",
                        new SqlParameter("@username", username),
                        new SqlParameter("@reason", id.Split('$')[1]),
                        new SqlParameter("@handle_time", DateTime.Now),
                        new SqlParameter("@id", id.Split('$')[0]));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "reset":
                    i = SqlHelper.ExecuteNonQuery("update yanyiting set status=0,handle_user=null,handle_time=null where id=@id",
                        new SqlParameter("@id", id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "del":
                    i = SqlHelper.ExecuteNonQuery("delete from yanyiting where id=@id",
                        new SqlParameter("@id", id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                default:
                    context.Response.Write("未知的操作！");
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}