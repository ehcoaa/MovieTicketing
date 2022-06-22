<%@ page import="com.gzfs.service.MovieService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gzfs.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/4
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/movie.css">
<!-- 显示电影商品2-->
<div class="img-box">
    <h2><a href="findMovie?type=2" style="text-decoration: none; color:#7595be;">爱情</a></h2>
    <%
        MovieService movieService2 = new MovieService();
        request.setCharacterEncoding("UTF-8");
        User user2= (User) session.getAttribute("user");
        List<Movie> movies2 =movieService2.findMovieBySortId(2);

        if(movies2!=null)
        {
    %>
    <%

        for (int i=0;i<4;i++)
        {
    %>
    <div class="single-img">
        <img src="<%=movies2.get(i).getImgurl()%>" class="image">
        <div class="img-overlay">
            <div class="text"><%= movies2.get(i).getName()%><br>
                <span>￥<%= movies2.get(i).getPrice()%></span><br><br>
                <a href="sale?user_id=<%=user2.getId()%>&movie_id=<%=movies2.get(i).getId()%>">选座购票</a>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
<br>