<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities_list.aspx.cs" Inherits="TWweb.Web.activities_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1><%=((DateTime)dt_ing.Rows[0]["use_time_start"]).ToString("yyyy-MM")%></h1>
        <%for (int i = 0; i < dt_ing.Rows.Count; i++)
            { %>
            <h4><%=((DateTime)dt_ing.Rows[i]["use_time_start"]).ToString("M") %>----<%=dt_ing.Rows[i]["activity"] %></h4>
        <%} %>
    <hr />
        <%for (int i = 0; i < dt_ed.Rows.Count; i++)
            { %>
            <h3><%=((DateTime)dt_ed.Rows[i]["use_time_start"]).ToString("M") %>----<%=dt_ed.Rows[i]["activity"] %></h3>
        <%} %>
</body>
</html>
