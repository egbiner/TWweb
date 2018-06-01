<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyform.aspx.cs" Inherits="TWweb.Web.applyform" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>演艺厅申请</title>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script><!--星期中文化-->                                                                               
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-zh-CN.js"></script><!--文字中文化--> 

<script>
$(function(){
		   $("div").click(function(){
		   $(this).addClass("select");		
    });
})
</script>
<link href="css/zzsc.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <br />
<div class="exlist">
  <div class="exlist_title"><img src="img/paper-clip.png" /></div>
  <div id="title">
    <legend>演艺厅申请表</legend>
  </div>
  <form id="form1">
    <fieldset>
    <legend>基本信息</legend>
    <div class="row">
      <label>1. 申请人:</label>
      <input id="ap_user" class="txt" type="text" name="ap_user" value="申请人测试"/>

    </div>
    <div class="row">
      <label>2. 申请人电话:</label>
      <input  class="txt" type="text" name="ap_phone" value="1877877988"/>    	
    </div>
    <div class="row">
      <label>3. 单位负责人:</label>
      <input  class="txt" type="text" name="fz_user" value="单位负责人"/>

    </div>
    <div class="row">
      <label>4. 单位负责人电话:</label>
      <input  class="txt" type="text" name="fz_phone"  value="1877877988"/>    	
    </div>
    <div class="row">

       <label>5.活动时间:</label>

        <div class="activity-time">
            <input  name="act_start_time" type="text"  class="text-box" value="" placeholder="开始时间" title="开始时间≥当前时间" readonly="readonly" style="cursor:pointer;"/>
            <input  name="act_stop_time" type="text" class="text-box" value="" placeholder="结束时间>开始时间" title="结束时间>开始时间" readonly="readonly" style="cursor:pointer;"/>
        </div>

<script type="text/javascript">
	$( "input[name='act_start_time'],input[name='act_stop_time']" ).datetimepicker();
</script>
    </div>
  
    </fieldset>
    <fieldset>
    <legend>活动信息</legend>
    <div class="row">
      <label>1. 级别:</label>
      <select name="or_type" style="background-color: #fffbd4">
        <option value="校级">校级</option>
        <option value="院级">院级</option>
        <option value="学生组织">学生组织</option>

      </select>

    </div>
    <div class="row">
      <label>2. 类别:</label>
	<input  class="txt" type="text" name="ac_type" value="创新创业文化活动"/>    	
    </div>
    <div class="row">
      <label>3. 组织部门:</label>
      <input class="txt" type="text" name="organization" value="求索工作室"/>
    </div>
    <div class="row">
      <label>4. 活动名称:</label>
      <input class="txt" style="width:400px"  type="text" name="activity" value="交流活动"/>
    </div>
    </fieldset>
    <input type="button" onclick="sub()" class="send" value="提交" />
  </form>
</div>
    <script type="text/javascript">
        function sub() {
            $.ajax({
                type: "POST",
                url: 'ashx/apply.ashx',
                data: $("#form1").serialize(),
                success: function (data) {
                    if (data == "error")
                        alert("请检查表单内容是否填写完整！")
                    else
                        location.href = "recode.aspx?recode=" + data;
                },
            error: function () {
                alert("服务器睡着了？")
            }
        })
        }
    </script>
</body>
</html>