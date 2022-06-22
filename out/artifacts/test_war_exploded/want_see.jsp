<%@ page import="com.gzfs.entity.User" %>
<%@ page import="com.gzfs.service.UserOrderService" %>
<%@ page import="com.gzfs.repositiory.impl.UserOrderImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.gzfs.entity.MovieWantSee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    UserOrderService uos=new UserOrderImpl();
    ArrayList<MovieWantSee> trList=uos.FindAllWantById(user.getId());
    for(int i=0;i<trList.size();i++){
        MovieWantSee t=trList.get(i);
        System.out.println(t.toString());
    }

    String msg=request.getParameter("msg");
    System.out.println("msg:"+msg);
%>
<html>
<head>
    <title>收藏列表</title>
    <link href="css/person_booking.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<h1>我的收藏</h1>
<div id="button_back">
    <a href="index.jsp">返回主页</a>
</div>
<div id="to_person">
    <a href="person.jsp">个人信息</a>
</div>
<div class="main_page">

    <%--  个人收藏页面，浏览收藏记录  --%>
    <%
        for(MovieWantSee t:trList){
    %>
    <div class="content">
        <div class="left">
            <img src="<%=t.getMovie_img()%>">
        </div>
        <div class="right">
            <h2><%=t.getMovie_name()%>&nbsp;&nbsp</h2>
            <p>导演：<%=t.getMovie_director()%> <br>演员：<%=t.getMovie_actor()%></p>
        </div>
    </div>
    <div class="footer">
        <div class="delete_order">
            <a href="UserWantServlet?user_id=<%=t.getUser_id()%>&movie_id=<%=t.getMovie_id()%>&movie_name=<%=t.getMovie_name()%>">删除收藏</a>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
<script>
    var msg="<%=msg%>";
    if(msg=="delete_success"){
        alert("删除收藏成功");
    } else if(msg=="delete_failure"){
        alert("删除收藏失败");
    }
</script>
</html>
