using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TWweb.Web.ashx
{
    /// <summary>
    /// apply 的摘要说明
    /// </summary>
    public class apply : IHttpHandler
    {
        DateTime use_time_start,use_time_end;
        string organization;
        string activity;
        string or_type;
        string ac_type;
        string ap_user, ap_phone;
        string fz_user, fz_phone;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            try
            {
                use_time_start = DateTime.Parse(context.Request["act_start_time"]);
                use_time_end = DateTime.Parse(context.Request["act_stop_time"]);
                organization = context.Request["organization"];
                activity = context.Request["activity"];
                or_type = context.Request["or_type"];
                ac_type = context.Request["ac_type"];
                ap_user = context.Request["ap_user"];
                ap_phone = context.Request["ap_phone"];
                fz_user = context.Request["fz_user"];
                fz_phone = context.Request["fz_phone"];
                int i = SqlHelper.ExecuteNonQuery("insert into yanyiting(use_time_start,use_time_end,status,organization,activity,or_type,ac_type,ap_user,ap_phone,fz_user,fz_phone) values(@use_time_start, @use_time_end,0, @organization, @activity, @or_type, @ac_type,@ap_user,@ap_phone,@fz_user,@fz_phone)",
                    new SqlParameter("@use_time_start", use_time_start),
                    new SqlParameter("@use_time_end", use_time_end),
                    new SqlParameter("@organization", organization),
                    new SqlParameter("@activity", activity),
                    new SqlParameter("@or_type", or_type),
                    new SqlParameter("@ac_type", ac_type),
                    new SqlParameter("@ap_user", ap_user),
                    new SqlParameter("@ap_phone", ap_phone),
                    new SqlParameter("@fz_user", fz_user),
                    new SqlParameter("@fz_phone", fz_phone));
                if (i==1)
                {
                    DataTable dt = SqlHelper.ExecuteDataTable("select * from yanyiting order by id DESC");
                    int recode = Convert.ToInt32(dt.Rows[0]["id"]);
                    context.Response.Write(recode);
                }
                else
                {
                    context.Response.Write("error");
                }
            }
            catch (Exception e)
            {
                context.Response.Write("error");
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