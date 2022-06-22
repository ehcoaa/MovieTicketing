<%@ page import="com.gzfs.entity.Movie" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线选座</title>
    <meta name="keywords" content="jQuery在线选座,jQuery选座系统" />

    <meta name="description" content="jquery.seat-charts是一款适合电影票、高铁票的在线选座插件。" />
</head>
<body>
<link rel="stylesheet" href="css/purchase.css">
<%
    Movie movie= (Movie) session.getAttribute("MovieInformation");
%>
<div class="introduction">
    <div><%-- 图片--%>
        <script type="text/javascript" language="JavaScript">
            function exit()
            {
                window.document.location.href="index.jsp";
            }
        </script>
        <button style="float: right;margin-top: 5px;margin-right: 5px" onclick="exit()">返回></button>
        <img class="img-set" src="<%=movie.getImgurl()%>">
    </div>
    <div class="introduction-detail">
        <div class="introduction-text"><%-- 说明--%>
            <h1 style="font-size: 30px "><%=movie.getName()%></h1>
            <hr style="margin-top: 50px">
            <p style="font-size: 20px;margin-top: 20px">导演：<%=movie.getDirector()%></p>
            <p style="font-size: 20px;margin-top: 10px">主演：<%= movie.getActor()%></p>
            <p style="font-size: 20px;margin-top: 10px">简介：</p>
            <p style="font-size: 10px;margin-top: 10px">&nbsp;&nbsp;&nbsp;&nbsp;<%= movie.getDescribe()%></p>
        </div>
        <div class="introduction-button">
            <form method="post" action="/wantsee">
                <input type="hidden" value="">
                <input type="submit" class="button1" value="想看"/>
            </form>
        </div>
    </div>
</div>
<%
    request.setCharacterEncoding("UTF-8");
    String Want_msg=request.getParameter("Want_msg");
    System.out.println(Want_msg);
%>
<script>
    var msg=<%=Want_msg%>;
    if(msg=="failure")
    {
        alert("添加失败！");
    }
</script>
<link rel="stylesheet" href="css/choose.css">
<div class="choose">
    <form method="post" action="selectmovietime">
        <fieldset>
            <legend>时间</legend>
            <%
                SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
                Calendar calendar=new GregorianCalendar();
                calendar.setTime(new Date());
                String today=formatter.format(calendar.getTime());
                calendar.add(calendar.DATE,+1);
                String tomorrow=formatter.format(calendar.getTime());
                calendar.add(calendar.DATE,+1);
                String after_tomorrow=formatter.format(calendar.getTime());
            %>
            <input id="today" type="radio" name="R1" checked="checked" value=<%=today%> /><%=today%>&nbsp;&nbsp;
            <input id="tomorrow" type="radio" name="R1" value=<%=tomorrow%> /><%=tomorrow%>&nbsp;&nbsp;
            <input id="ttomorrow" type="radio" name="R1" value=<%=after_tomorrow%> /><%=after_tomorrow%>&nbsp;&nbsp;<br/>
        </fieldset>
        <fieldset>
            <legend>放映时间</legend>
            <input id="time1" type="radio" value="09:50:00" name="R2" checked="checked"/>09:50&nbsp;&nbsp;
            <input id="time2" type="radio" value="12:30:00" name="R2"/>12:30&nbsp;&nbsp;
            <input id="time3" type="radio" value="16:30:00" name="R2"/>16:30&nbsp;&nbsp;<br/>
        </fieldset>
        <fieldset>
            <legend>影厅</legend>
            <input id="room1" type="radio" value="1" name="R3" checked="checked"/>1号影厅&nbsp;&nbsp;
            <input id="room2" type="radio" value="2" name="R3"/>2号影厅&nbsp;&nbsp;
            <input id="room3" type="radio" value="3" name="R3"/>3号影厅&nbsp;&nbsp;<br/>
        </fieldset>
        <script>
            document.getElementById()
            function ChooseSeat()
            {
                document.forms[0].submit();
            }
        </script>
        <button onclick="ChooseSeat()" class="button3" style="height: 50px;width: 100px;margin-top: 10px;background:mediumpurple">选座购票</button>
    </form>

</div>

</body>
</html>
