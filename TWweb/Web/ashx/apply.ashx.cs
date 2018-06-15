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
        //string organization;//组织
        string activity;//活动名称
        //string or_type;//????
        //string ac_type;//活动类型
        string ap_user, ap_phone;//活动负责人
        string fz_user, fz_phone;//负责人
        string ac_linkman;//活动联系人
        string ac_linkman_phone;
        string main_attend;
        int participants_num;
        int isReadNotice;
        string ap_reason;//申请原由
        string device_need;//所需设备
        string ap_opinion;//申请单位意见
        int isNullRoom;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            try
            {
                string date = context.Request["date"];
                string star_time = context.Request["start_time"];
                string end_time = context.Request["end_time"];

                use_time_start = DateTime.Parse(date+" "+star_time);
                use_time_end = DateTime.Parse(date +" "+end_time);
                ap_user = context.Request["ap_user"];
                ap_phone = context.Request["ap_phone"];
                fz_user = context.Request["fz_user"];
                fz_phone = context.Request["fz_phone"];
                ac_linkman = context.Request["ac_linkman"];
                ac_linkman_phone = context.Request["ac_linkman_phone"];
                main_attend = context.Request["main_attend"];
                participants_num = Convert.ToInt32(context.Request["participants_num"]);
                isNullRoom = Convert.ToInt32(context.Request["isNullRoom"]);
                ap_reason = context.Request["ap_reason"];
                ap_opinion = context.Request["ap_opinion"];
                activity = context.Request["activity"];
                device_need = context.Request["device_need"];

                //isReadNotice = Convert.ToInt32(context.Request["isReadNotice"]);
                //use_time_start = DateTime.Parse(context.Request["act_start_time"]);
                //use_time_end = DateTime.Parse(context.Request["act_stop_time"]);
                //organization = context.Request["organization"];
                //or_type = context.Request["or_type"];
                //ac_type = context.Request["ac_type"];
                ;
                int i = SqlHelper.ExecuteNonQuery("insert into yanyiting(use_time_start,use_time_end,status,activity,ap_user,ap_phone,fz_user,fz_phone,ac_linkman,ac_linkman_phone,main_attend,participants_num,isNullRoom,ap_reason,ap_opinion,device_need) values(@use_time_start, @use_time_end,0, @activity,@ap_user,@ap_phone,@fz_user,@fz_phone,@ac_linkman,@ac_linkman_phone,@main_attend,@participants_num,@isNullRoom,@ap_reason,@ap_opinion,@device_need)",
                    new SqlParameter("@use_time_start", use_time_start),
                    new SqlParameter("@use_time_end", use_time_end),
                    new SqlParameter("@activity", activity),
                    new SqlParameter("@ap_user", ap_user),
                    new SqlParameter("@ap_phone", ap_phone),
                    new SqlParameter("@fz_user", fz_user),
                    new SqlParameter("@ac_linkman", ac_linkman),
                    new SqlParameter("@ac_linkman_phone", ac_linkman_phone),
                    new SqlParameter("@main_attend", main_attend),
                    new SqlParameter("@participants_num", participants_num),
                    new SqlParameter("@isNullRoom", isNullRoom),
                    new SqlParameter("@ap_reason", ap_reason),
                    new SqlParameter("@ap_opinion", ap_opinion),
                    new SqlParameter("@device_need", device_need),
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