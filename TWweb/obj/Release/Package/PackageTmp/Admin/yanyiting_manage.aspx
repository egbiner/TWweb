<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yanyiting_manage.aspx.cs" Inherits="TWweb.Admin.yanyiting_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/admin_index.css" rel="stylesheet" />
    <link href="css/admin_index2.css" rel="stylesheet" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/do_ajax.js"></script>
    <script src="../Web/js/layer.js"></script>
    <link href="../Web/css/layer.css" rel="stylesheet" />
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">演艺厅申请情况</h2>
        </div>
            <table class="table">
        <tr>
            <th>回执码</th>
            <th>申请使用日期</th>
            <th>具体使用时间</th>
            <th>活动名称</th>
            <th>申请人</th>
            <th>进行状况</th>
            <th colspan="5">操作</th>
        </tr>

        <% for (int i = 0; i < t.Rows.Count; i++) { %>
        <tr>
            <td><%=t.Rows[i]["id"] %></td>
            <td><%=((DateTime)t.Rows[i]["use_time_start"]).ToString("yyyy-MM-dd")%></td>
            <td><%=((DateTime)t.Rows[i]["use_time_start"]).ToString("t")+"-"+((DateTime)t.Rows[i]["use_time_end"]).ToString("t")%></td>
            <td><%=t.Rows[i]["activity"] %></td>
            <td><%=t.Rows[i]["ap_user"] %></td>
            <%if (int.Parse(t.Rows[i]["status"].ToString()) == 0) { %>
                <td style="color:blue">待处理</td>
            <%} else if (int.Parse(t.Rows[i]["status"].ToString()) == 2) { %>
                <td style="color:red">已拒绝</td>
            <%} else{%>
                <td style="color:green">已通过</td>
            <%} %>
            <td>
                <a href="javascript:opendetail(<%=t.Rows[i]["id"] %>)">查看详细</a>
            </td>
            <td>
                <a style="color:blue" href="javascript:manage('reset', '<%=t.Rows[i]["id"] %>')">重置</a>
            </td>
            <td>
                <a style="color:green" href="javascript:manage('pass', '<%=t.Rows[i]["id"] %>')">通过</a>
            </td>
            <td>
                <a style="color:orangered" href="javascript:dis_prompt(<%=t.Rows[i]["id"] %>)">拒绝</a>
            </td>
            <td>
                <a href="javascript:manage('del', '<%=t.Rows[i]["id"] %>')" class="del_but">删除</a>
            </td>
        </tr>
        <% } %>
    </table>
        <script>
            function dis_prompt(id) {
                var reason = prompt("请输入拒绝原因", "");
                if (reason!=null && reason!="")
                {
                    manage("reject", id + "$" + reason);
                }
            }
            function opendetail(id) {
                layer.open({
                    title:'申请详情',
                    type: 2,
                    area: ['720px', '80%'], //宽高
                    shade: 0,
                    content: 'applyform_modle.aspx?id='+id,
                    maxmin: true,
                });

                    //window.open('applyform_modle.aspx?id='+id, 'new', 'location=no, toolbar=no,height=770,width=720');
                   // return false;
           }
            function manage(action,id) {
                switch (action) {
                    case "reset":
                        DoAjax("你确定要重置？", "ashx/yanyiting_manage.ashx",id,action);
                        break;
                    case "pass":
                        DoAjax("你确定要通过？", "ashx/yanyiting_manage.ashx",id,action);
                        break;
                    case "reject":
                        DoAjax("你确定要拒绝？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                    case "del":
                        DoAjax("你确定要删除？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                }
            }
        </script>
    </div>
</body>
</html>