<%@ page import="com.gzfs.service.MovieService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gzfs.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/4
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/movie.css">
<!-- 显示电影商品3-->
<div class="img-box">
    <h2><a href="findMovie?type=3" style="text-decoration: none; color:#7595be;">喜剧</a></h2>
    <%
        MovieService movieService3 = new MovieService();
        request.setCharacterEncoding("UTF-8");
        User user3= (User) session.getAttribute("user");
        List<Movie> movies3 =movieService3.findMovieBySortId(3);

        if(movies3!=null)
        {
    %>
    <%

        for (int i=0;i<5;i++)
        {
    %>
    <div class="single-img">
        <img src="<%=movies3.get(i).getImgurl()%>" class="image">
        <div class="img-overlay">
            <div class="text"><%= movies3.get(i).getName()%><br>
                <span>￥<%= movies3.get(i).getPrice()%></span><br><br>
                <a href="sale?user_id=<%=user3.getId()%>&movie_id=<%=movies3.get(i).getId()%>">选座购票</a>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
<br>