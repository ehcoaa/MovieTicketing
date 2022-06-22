<%@ page import="com.gzfs.entity.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86159
  Date: 2022/6/12
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影分类</title>
    <link href="css/classify.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/movie.css">
</head>
<%
    List<Movie> movies = (List<Movie>) session.getAttribute("movies");
%>
<body>
<%-- 顶部菜单栏 --%>
   <div class="top-bar">
      <ul>
          <li><a href="findMovie?type=1&type2=classify">经典</a></li>
          <li><a href="findMovie?type=2&type2=classify">喜剧</a></li>
          <li><a href="findMovie?type=3&type2=classify">爱情</a></li>
          <li><a href="findMovie?type=4&type2=classify">动漫</a></li>
          <li><a href="findMovie?type2=classify">全部电影</a></li>
          <li style="float: right"><a href="index.jsp">返回主页</a></li>
      </ul>
   </div>

<%-- 下面为所选不同类型而对应展示的电影  --%>
   <div class="show-type-movies">
       <h1>展示电影</h1>
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
   </div>
</body>
</html>
