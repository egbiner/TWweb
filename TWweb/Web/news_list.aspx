﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="TWweb.Web.news_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="img/icon.ico" rel="shortcut icon" />
    <title>共青团桂林电子科技大学委员会</title>
    <link href="css/stylenewslist.css" rel="stylesheet" />
    <script src="../Admin/js/jquery-3.0.0.min.js"></script>
    <script src="js/news_list_select.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/prefixfree.min.js"></script>
</head>
<body>
    <div class="all-web">
        <div class="header">
            <div class="badge"></div>
            <div class="nav">
                <ul>
                    <li><a href="../index.aspx">首页</a>
                    </li>
                    <li><a href="#">团情快讯</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=23">团委简介</a></li>
                            <li><a href="news_list.aspx?news_type=24">组织机构</a></li>
                            <li><a href="news_list.aspx?news_type=25">团委动态</a></li>

                        </ul>
                    </li>
                    <li><a href="#">学院动态 </a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=9">学院团委风采</a></li>


                        </ul>
                    </li>
                    <li><a href="#">社团风采</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=3">社团简介</a></li>
                            <li><a href="news_list.aspx?news_type=4">社团动态</a></li>


                        </ul>
                    </li>

                    <li><a href="#">实践创新</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=5">社会实践</a></li>
                            <li><a href="news_list.aspx?news_type=6">创新创业</a></li>

                        </ul>
                    </li>

                    <li><a href="news_list.aspx?news_type=8">文件下载</a>
                    </li>
					<li><a href="yanyiting.aspx">演艺厅</a></li>

					<li><a href="#">规章制度</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=32">办事流程</a></li>
                            <li><a href="news_list.aspx?news_type=33">管理制度</a></li>

                        </ul>
                    </li>

					 <li><a href="#">联系我们</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=34">团委电子邮箱</a></li>
                            <li><a href="news_list.aspx?news_type=35">领导邮箱</a></li>
							<li><a href="news_list.aspx?news_type=36">传真</a></li>
                        </ul>
                    </li>

                </ul>
            </div>

        </div>

        <div class="line"></div>


        <div class="body">
            <%--<div class="photo"></div>--%>
            <div class="place">
                当前位置：
                <a href="../index.aspx">首页</a>>>
        		<a href="javascript:void(0);"><%=nav_name %></a>>>
                <%for (int i = 0; i < t_news_type.Rows.Count; i++)

                    { %>
                <%if (t_news_type.Rows[i]["id"].ToString() == news_type)
                    {%>
                <a id="a_pos" href="javascript:void(0);"><%=t_news_type.Rows[i]["type_name"].ToString() %></a><%}
                }%>
            </div>
            <div class="line"></div>

            <div class="sidebar">
                <div class="menu">
                    <ul>
                        <li class="menu-tit"><%=nav_name %></li>
                        <%for (int i = 0; i < t_news_type.Rows.Count; i++)
                            {%>
                        <li><a href="javascript:void(0);" id="<%=t_news_type.Rows[i]["id"] %>" class="<%=t_news_type.Rows[i]["id"].ToString()==news_type?"active":"" %>"><%=t_news_type.Rows[i]["type_name"] %></a></li>
                        <%} %>
                    </ul>
                </div>
                <div class="new">
                    <div class="new-title">
                        <div class="new-notice">热点新闻<a href="#">更多+</a></div>
                    </div>
                    <div class="new-content">
                        <ul>
                            <%for (int i = 0; i < t_news_hot.Rows.Count; i++)
                                {%>
                            <li><a href="news_detail.aspx?id=<%=t_news_hot.Rows[i]["id"] %>" target="_blank" title="<%=t_news_hot.Rows[i]["title"] %>"><%=t_news_hot.Rows[i]["title"].ToString().Length<17?t_news_hot.Rows[i]["title"].ToString():t_news_hot.Rows[i]["title"].ToString().Substring(0, 16)+"……" %></a><span style="float: right;">[<%=Convert.ToDateTime(t_news_hot.Rows[i]["publish_time"]).ToString("MM-dd") %>]</span></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main">
                <iframe class="content" id="iframe1" onload="setIframeHeight(this)" scrolling="no" style="width: 100%;" frameborder="0" src="
                    <%if (news_type == "23" || news_type == "24"||news_type=="29"||news_type=="34"||news_type=="35"||news_type=="36")
                    {%><%="introduction.aspx?type_id="+news_type %>
                    <%} %>
                    <%else { %>
                    <%="news_list_iframe.aspx?page_num=" + page_num + "&news_type=" + news_type %>
                    <%} %>"></iframe>
                <script>
                    function setIframeHeight(iframe) {
                        iframe.height = 600;
                        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
                        iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
                    }
                    window.onresize = function () {
                        setIframeHeight(document.getElementById("iframe1"));
                    };
                </script>
                <div class="page">
            </div>
            </div>

            <div class="friendly-link">
                <div class="friendly-link-tit">友情链接:</div>
                <ul>
                    <%for (int i = 0; i < t_friend_url.Rows.Count; i++)
                        {%>
                    <li><a href="<%=t_friend_url.Rows[i]["url"] %>" target="_blank"><%=t_friend_url.Rows[i]["name"] %></a></li>
                    <%} %>
                </ul>
            </div>
            <div class="webo">

                <ul class="webo-link">
                    <li><a href="https://weibo.com/guetgqt" target="_blank">官方微博</a></li>
                    <li><a href="#">官方微信 </a></li>
                    <li><a href="http://qnzs.youth.cn/" target="_blank">青年之声</a></li>
                    <li><a href="#">新媒体联盟</a></li>


                </ul>

            </div>

        </div>

    </div>
    <div class="footer">

        <div class="line"></div>
        <div class="footer-bottom">
            <p>
                Copyright ©共青团桂林电子科技大学委员会<br />
                校址:中国广西桂林市七星区金鸡路1号    邮编:541004
                <br />
                桂林电子科技大学 团委 网络中心 审核通过
                <br />
                <a style="color: white;" href="../Admin/login.aspx" target="_blank">后台管理</a>
            </p>

        </div>
    </div>

</body>
</html>
