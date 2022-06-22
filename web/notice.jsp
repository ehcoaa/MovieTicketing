<%@ page import="com.gzfs.service.NoticeService" %>
<%@ page import="com.gzfs.entity.Notice" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/12
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/notice.css">
<%
    NoticeService noticeService = new NoticeService();
    List<Notice> notices = noticeService.FindAllNotice();
%>
<ul>
    <h2>公告栏</h2>
    <%
        for (Notice notice:notices
             ) {
    %>
    <li>
        <span class="icon">H</span>
        <a href="#"><%=notice.getText()%></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="#"><%=notice.getTime()%></a>
    </li>
    <%
        }
    %>
</ul>
