<%@ page import="com.gzfs.service.MovieService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gzfs.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/2
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/movie.css">
<!-- 显示电影商品1-->
<div class="img-box">
    <h2><a href="findMovie?type=1" style="text-decoration: none; color:#7595be;">经典推荐</a></h2>
        <%
    MovieService movieService = new MovieService();
    request.setCharacterEncoding("UTF-8");
    User user= (User) session.getAttribute("user");
    List<Movie> movies =movieService.findMovieBySortId(1);

    if(movies!=null)
    {
%>
        <%

    for (int i=0;i<8;i++)
       {
%>
        <div class="single-img">
            <img src="<%=movies.get(i).getImgurl()%>" class="image">
            <div class="img-overlay">
                <div class="text"><%= movies.get(i).getName()%><br>
                    <span>￥<%= movies.get(i).getPrice()%></span><br><br>
                    <a href="sale?user_id=<%=user.getId()%>&movie_id=<%=movies.get(i).getId()%>"> 选座购票</a>
                </div>
            </div>
        </div>
        <%
       }
    }
        %>
    </div>
<br>