<%@ page import="com.gzfs.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/5/29
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() +
            "://"
            + request.getServerName() +
            ":"
            + request.getServerPort() + path +
            "/";
    request.setCharacterEncoding("UTF-8");
    String Buy_msg=request.getParameter("Buy_msg");
    System.out.println(Buy_msg);
%>
<link href="css/index.css" type="text/css" rel="stylesheet">
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%--   导航栏部分--%>
<%@include file="top.jsp" %>
<%--   轮播图部分 --%>
<%@include file="banner.jsp" %>


<%--经典推荐--%>
<%@include file="showMovie1.jsp" %>
<%--爱情--%>
<%@include file="showMovie2.jsp" %>
<%--喜剧--%>
<%@include file="showMovie3.jsp" %>
<%--动漫--%>
<%@include file="showMovie4.jsp" %>
<%--公告栏--%>
<%@include file="notice.jsp" %>
<%--在线视频部分--%>
<%@include file="video.jsp" %>
<%--底部部分--%>
<%@ include file="footer.jsp" %>
</body>
<script>
    var msg="<%=Buy_msg%>";
    if("success"===msg){
        alert("购买成功");
    }
    var add = '<%=request.getParameter("add")%>';
    if(add=='yes')
    {
        alert("收藏成功");
    }
    else if(add=='no')
    {
        alert("收藏失败");
    }

</script>
</html>
