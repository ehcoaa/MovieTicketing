<%@ page import="com.gzfs.service.MovieService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gzfs.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/4
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/movie.css">
<!-- 显示电影商品4-->
<div class="img-box">
    <h2><a href="findMovie?type=4&type2=classify1" style="text-decoration: none; color:#7595be;">动漫电影</a></h2>
    <%
        MovieService movieService4 = new MovieService();
        request.setCharacterEncoding("UTF-8");
        User user4= (User) session.getAttribute("user");
        List<Movie> movies4 =movieService4.findMovieBySortId(4);

        if(movies4!=null)
        {
    %>
    <%

        for (int i=0;i<6;i++)
        {
    %>
    <div class="single-img">
        <img src="<%=movies4.get(i).getImgurl()%>" class="image">
        <div class="img-overlay">
            <div class="text"><%= movies4.get(i).getName()%><br>
                <span>￥<%= movies4.get(i).getPrice()%></span><br><br>
                <a href="sale?user_id=<%=user4.getId()%>&movie_id=<%=movies4.get(i).getId()%>">选座购票</a>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>