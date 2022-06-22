<%@ page import="com.gzfs.entity.User" %>
<%@ page import="com.gzfs.service.UserOrderService" %>
<%@ page import="com.gzfs.repositiory.impl.UserOrderImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.gzfs.entity.TicketRecord" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86159
  Date: 2022/6/2
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    User user = (User) session.getAttribute("user");
    UserOrderService uos=new UserOrderImpl();
    ArrayList<TicketRecord> trList=uos.FindAllRecordById(user.getId());
    for(int i=0;i<trList.size();i++){
        TicketRecord t=trList.get(i);
        System.out.println(t.toString());
    }

    String msg=request.getParameter("msg");
    System.out.println("msg:"+msg);
%>
<html>
<head>
    <title>个人订单</title>
    <link href="css/person_booking.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<h1>我的订单</h1>
<div id="button_back">
    <a href="index.jsp">返回主页</a>
</div>
<div id="to_person">
    <a href="person.jsp">个人信息</a>
</div>
<div class="main_page">

<%--  个人订票页面，浏览订票记录  --%>
<%
    for(TicketRecord t:trList){
        %>
    <div class="content">
        <div class="left">
            <img src="<%=t.getMovie_img()%>">
        </div>
        <div class="right">
            <h2><%=t.getMovie_name()%>&nbsp;&nbsp;<%=t.getTicket_count()%>张</h2>
            <p>日期：<%=t.getMovie_showDate()%> <br>开始时间：<%=t.getMovie_showTime()%></p>
            <p>演播厅：<%=t.getRoom()%></p>
        </div>
    </div>
    <div class="footer">
        <span>总价格: <%=(t.getTicket_price()*t.getTicket_count())%>元</span>
        <div class="delete_order">
            <a href="UserOrderServlet?user_id=<%=t.getUser_id()%>&movie_id=<%=t.getMovie_id()%>&movie_showDate=<%=t.getMovie_showDate()%>">删除订单</a>
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
        alert("删除订单成功");
    } else if(msg=="delete_failure"){
        alert("删除订单失败");
    }
</script>
</html>
