<%@ page import="com.gzfs.entity.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/3
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影展示</title>
    <link rel="stylesheet" href="css/movie.css">
</head>
<body>
<!-- 显示电影分类商品-->
<%
    String sort = (String) session.getAttribute("movieSort");
    List<Movie> movies = (List<Movie>) session.getAttribute("movies");
%>
<h1 style="text-align: center"><%= sort%>电影</h1>
<br>
<br>
<div class="img-box" style="background-color: #ffeb3b;width: 1000px;height: auto;margin: 0 auto;">
    <%
        if(movies!=null)
        {
    %>
    <%

        for (int i=0;i<movies.size();i++)
        {
    %>
    <div class="single-img">
        <img src="<%=movies.get(i).getImgurl()%>" class="image">
        <div class="img-overlay">
            <div class="text"><%= movies.get(i).getName()%><br>
                <span>￥<%= movies.get(i).getPrice()%></span><br><br>
                <a href="https://cn.bing.com/images/trending?form=Z9LH">选座购票</a>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
