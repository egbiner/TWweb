<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities_list.aspx.cs" Inherits="TWweb.Web.activities_list" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/about.css">
<title>时间轴 </title>
</head>
<body>

<div class="box" style="margin-left:20px;margin-top:30px;height:650px;width:700px">
	<div  class="event_list">
	<ul>
        <br />
		<div>
			<h3 id="2018"><%=((DateTime)dt_ing.Rows[0]["use_time_start"]).ToString("yyyy")%></h3>
        <%for (int i = 0; i < dt_ing.Rows.Count; i++)
            { %>
            <li>
			<span><%=((DateTime)dt_ing.Rows[i]["use_time_start"]).ToString("M") %></span>
                
			<p><span><%=dt_ing.Rows[i]["activity"] %><br />19:00-18:00</span></p>
			</li>
        <%} %>
		
		</div>
		<div>
			<h3 id="2019"><%=Convert.ToInt32(((DateTime)dt_ing.Rows[0]["use_time_start"]).ToString("yyyy"))+1%></h3>
			<li>
			<span></span>
			<p><span>更多活动,敬请期待~</span></p>
			</li>
			
		</div>
		
	</ul>
	</div>
    <br />
	<div class="right">
		<h3>最近活动预览</h3>
		<ul >
             <%for (int i = 0; i < dt_ed.Rows.Count; i++)
            { %>
                <li><%=dt_ed.Rows[i]["activity"] %><span><%=((DateTime)dt_ed.Rows[i]["use_time_start"]).ToString("M") %></span></li>
            <%} %>
		</ul>
	</div>
	
	</div>




</body>
</html>