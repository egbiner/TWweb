<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyform_modle.aspx.cs" Inherits="TWweb.Admin.applyform_modle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>演艺厅申请</title>
<script type="text/javascript" src="../Web/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../Web/js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../Web/css/jquery-ui.css" />
<script type="text/javascript" src="../Web/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="../Web/js/jquery.ui.datepicker-zh-CN.js"></script><!--星期中文化-->                                                                               
<script type="text/javascript" src="../Web/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="../Web/js/jquery-ui-timepicker-zh-CN.js"></script><!--文字中文化--> 
<script>
$(function(){
		   $("div").click(function(){
		   $(this).addClass("select");		
    });
})
</script>
<link href="../Web/css/zzsc.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="exlist">
  <div class="exlist_title"><img src="../Web/img/paper-clip.png" /></div>
  <div id="title">
    <legend>演艺厅申请表</legend>
  </div>
    <fieldset>
    <legend>基本信息</legend>
    <div class="row">
      <label>1. 申请人:</label>
      <input  class="txt" type="text" name="ap_user" value="<%=dt.Rows[0]["ap_user"] %>"/>

    </div>
    <div class="row">
      <label>2. 申请人电话:</label>
      <input  class="txt" type="text" name="ap_phone" value="<%=dt.Rows[0]["ap_phone"] %>"/>    	
    </div>
    <div class="row">
      <label>3. 单位负责人:</label>
      <input  class="txt" type="text" name="fz_user" value="<%=dt.Rows[0]["fz_user"] %>"/>

    </div>
    <div class="row">
      <label>4. 单位负责人电话:</label>
      <input  class="txt" type="text" name="fz_phone"  value="<%=dt.Rows[0]["fz_phone"] %>"/>    	
    </div>
        <div class="row">
      <label>5. 活动联系人:</label>
      <input  class="txt" type="text" name="fz_phone"  value="<%=dt.Rows[0]["ac_linkman"] %>"/>    	
    </div>
        <div class="row">
      <label>6. 活动联系人电话:</label>
      <input  class="txt" type="text" name="fz_phone"  value="<%=dt.Rows[0]["ac_linkman_phone"] %>"/>    	
    </div>
    <div class="row">

       <label>7.活动时间:</label>
        <input name="act_start_time" type="text"  class="txt" value="<%=((DateTime)dt.Rows[0]["use_time_start"]).ToString("yyyy-MM-dd HH:mm")%>" readonly="readonly" />-
        <input name="act_stop_time" type="text" class="txt" value="<%=((DateTime)dt.Rows[0]["use_time_end"]).ToString("yyyy-MM-dd HH:mm")%>"  readonly="readonly" />
    </div>
  
    </fieldset>
    <fieldset>
    <legend>活动信息</legend>
        <div class="row">
      <label>1. 活动名称:</label>
      <input class="txt"   type="text" name="activity" value="<%=dt.Rows[0]["activity"] %>"/>
    </div>
   
    <div class="row">
      <label>2. 活动参与人数:</label>
	<input  class="txt" type="text" name="ac_type" value="<%=dt.Rows[0]["participants_num"] %>"/>    	
    </div> 
        <div class="row">
      <label>3. 主要出席人员姓名及其职务:</label>
        <input class="txt" style="width:260px" type="text" name="or_type" value="<%=dt.Rows[0]["main_attend"] %>"/>

    </div>
    <div class="row">
      <label>4. 需要设备:</label>
      <input class="txt" style="width:400px" type="text" name="organization" value="<%=dt.Rows[0]["device_need"] %>"/>
    </div>
    
    </fieldset>

     <fieldset>
    <legend>其他信息</legend>
        <div class="row">
      <label>1. 申请事由:</label>
      <input class="txt" style="width:300px"  type="text" name="activity" value="<%=dt.Rows[0]["ap_reason"] %>"/>
    </div>
    <div class="row">
      <label>2. 申请单位意见:</label>
        <input class="txt" style="width:300px" type="text" name="or_type" value="<%=dt.Rows[0]["ap_opinion"] %>"/>

    </div>
    <div class="row">
      <label>3. 该时间段教室是否有空:</label>
	<input  class="txt" type="text" name="ac_type" value="<%= Convert.ToInt32(dt.Rows[0]["isNullRoom"]) == 0 ? "否" : "是" %>"/>    	
    </div>
    
    </fieldset>

        <fieldset>
    <legend>处理状态</legend>
        <div class="row">
            <div style="text-align:center">
          <%if (int.Parse(dt.Rows[0]["status"].ToString()) == 0) { %>
                <h2 style="color:blue">未处理</h2>
            <%} else if (int.Parse(dt.Rows[0]["status"].ToString()) == 2) { %>
                <h2 style="color:red">已拒接申请</h2>
                <p><%=((DateTime)dt.Rows[0]["handle_time"]).ToString("F") %></p>
                <p>拒绝原因:<%=dt.Rows[0]["reason"]%></p>
            <%} else{%>
                <h2 style="color:green">已接受申请</h2>
                <p><%=((DateTime)dt.Rows[0]["handle_time"]).ToString("F") %></p>
            <%} %>
            </div>
        </div>
    </fieldset>
</div>
</body>
</html>