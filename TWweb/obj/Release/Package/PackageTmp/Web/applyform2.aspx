<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyform2.aspx.cs" Inherits="TWweb.Web.applyform2" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset="utf-8" />
		<meta charset="utf-8">
		<title>大活表格</title>

        <script type="text/javascript" src="js/jquery.js"></script>
        <link href="css/new_file.css" rel="stylesheet" />
        <link href="css/layer.css" rel="stylesheet" />
        <script type="text/javascript" src="js/layer.js"></script>
        <script src="js/lq.datetimepick.js"></script>
        <script src="js/selectUi.js"></script>
        <script type="text/javascript">

            function sub() {
                layer.open({
                    title:'申请须知',
                    type: 1,
                    shade: 0,
                    area: ['600px', '420px'], //宽高
                    content: '<div style="padding:20px;line-height:30px"><p>1、	仔细阅读《演艺厅使用注意事项》，凡提交《演艺厅使用登记表》即默认同意《演艺厅使用注意事项》的规章制度，请爱护演艺厅的设施设备，如有损坏，照价赔偿。</p><p>2、	现场不允许拉横幅、贴装饰品。</p><p>3、	提前致电了解使用空挡，填表后一式两份交到大学生活动中心406文如冰老师处（存档，0773-2328357）和大学生艺术团团长于梦龙处（安排开门，15078380908）</p></div>',
                    btn: '确定',
                    btnAlign: 'c',
                     yes: function(index, layero){
                            subajax();
                           layer.close(index);
                     }
                });
            }

            function subajax() {
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
                        alert("服务器er")
                    }
                });
            }
        </script>
	</head>
	<body >
        <br />
		<div class="content">
            <form id="form1">
			<table style="float: left;" width="100%" height="100%" border="1">
					<tr>
						<td width="30%" rowspan="2" align="center">使用时间</td>

					</tr>  
					<tr>
						<td width="75%" colspan="3"> 
            <div class="table-form service-form">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-cell">
                        <tbody>
                            <tr>
                                <th width="10%"><span>日期：</span></th>
                                <td width="100px">
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="date" id="datetimepicker3" class="form-control" value="<%=now %>"/>
                                    </div>

                                </td>
                                <th width="10%"><span>时间：</span></th>
                                <td>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="start_time" id="datetimepicker1" class="form-control" value="18:00"/>
                                    </div>
                                    <div class="float-left form-group-txt">至</div>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="end_time" id="datetimepicker2" class="form-control" value="22:00"/>
                                    </div>

                                </td>                                
                            </tr>
                        </tbody>
                    </table>
</div>								
						</td>
					</tr>
					<tr>
						<td width="25%" align="center">申请单位负责人</td>
						<td width="25%"><input name="fz_user" class="txt" type="text" /></td>
						<td width="20%" align="center">电话</td>
						<td width="25%"><input name="fz_phone" class="txt" type="text" /></td>
					</tr>
					<tr>
						<td width="25%" align="center">申请人</td>
						<td width="25%"><input name="ap_user"  class="txt" type="text" /></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ap_phone"  class="txt" type="text" /></td>
					</tr>
					<tr>
						<td width="25%" align="center">活动联系人</td>
						<td width="25%"><input  name="ac_linkman" class="txt" type="text" /></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ac_linkman_phone"  class="txt" type="text" /></td>
					</tr>
					<tr>
						<td style="height: 70px;" align="center">主要出席人员姓名及其职务</td>
						<td colspan="3"><textarea name="main_attend"></textarea></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">活动名称</td>
						<td colspan="3"><input name="activity" class="txt" type="text" /></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">活动参与人数</td>
						<td colspan="3"><input name="participants_num" class="txt" type="text" /></td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">是否阅读演艺厅使用注意事项</td>
						<td colspan="3">
							<select name="isReadNotice">
					        <option value="1">是</option>
					        <option value="0">否</option>
					      </select> 
						</td> 
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请事由</td>
						<td colspan="3"><textarea name="ap_reason"></textarea></td> 
					</tr>
					<tr>
						<td style="height: 120px;" align="center">需要设备</td>
						<td style="word-break: break-all;" colspan="3">
							<p><input type="checkbox" name="device_need" value="LED屏" />LED屏</p>
							<p><input type="checkbox" name="device_need" value="无线话筒" />无线话筒（<input  class="txt" type="text" style="width: 30px; border-bottom: solid 1px black;"/>个，最多四个，自备电池，一个话筒2个5号电池）</p>
						    <p><input type="checkbox" name="device_need" value="折叠椅" />折叠椅（<input  class="txt" type="text" style="width: 30px; border-bottom: solid 1px black;"/>张，最多400张）</p>
						    <p><input type="checkbox" name="device_need" value="台式电脑" />台式电脑</p>
						    <p><input type="checkbox" name="device_need" value="灯光" />灯光</p></td> 
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请单位意见</td>
						<td colspan="3">
							<textarea name="ap_opinion"></textarea>
						</td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">该时间段教室是否为空</td>
						<td colspan="3">
					      <select name="isNullRoom">
					        <option value="1">是</option>
					        <option value="0">否</option>
					      </select> 							
						</td> 
					</tr>
			<tr>
                 <td colspan="4"><input type="button" onclick="sub()" class="send" value="提交" /></td>
            </tr>
			</table>
                </form>
		</div>
<script type="text/javascript">
$(function (){
    	$("#datetimepicker1").on("click",function(e){
		e.stopPropagation();
		$(this).lqdatetimepicker({
            css: 'datetime-hour',
             offset: {
                left : -220, //向左偏移的位置
                top : 10 //向上偏移的位置
            },
		});

	});


	$("#datetimepicker2").on("click",function(e){
		e.stopPropagation();
		$(this).lqdatetimepicker({
            css: 'datetime-hour',
            offset: {
                left : -356, //向左偏移的位置
                top : 10 //向上偏移的位置
            },
		});
         
	});

	$("#datetimepicker3").on("click",function(e){
		e.stopPropagation();
		$(this).lqdatetimepicker({
            css: 'datetime-day',
             offset: {
                left : -70, //向左偏移的位置
                top : 10 //向上偏移的位置
            },
			dateType : 'D',
			selectback : function(){

			}
		});

	});
    });
</script>		
	</body>
</html>
