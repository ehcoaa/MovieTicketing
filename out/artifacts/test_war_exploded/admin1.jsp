<%@ page import="com.gzfs.entity.Movie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.gzfs.service.MovieService" %><%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/10
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Admin</title>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/dialog.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">影票后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="images/header.jpg" class="layui-nav-img">
                    admin
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="login.jsp">退出登陆</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">

                <li class="layui-nav-item">
                    <a href="admin1.jsp">影票管理</a>
                </li>

                <li class="layui-nav-item">
                    <a href="admin2.jsp">公告管理</a>
                </li>

                <li class="layui-nav-item">
                    <a href="admin3.jsp">用户管理</a>
                </li>
            </ul>
        </div>
    </div>








    <div class="layui-body">
        <%
            MovieService movieService = new MovieService();
            ArrayList<Movie> movies = (ArrayList<Movie>) movieService.findAllMovie();
            if (movies == null){
                movies = new ArrayList<Movie>();
            }
        %>


        全部影片 <span><%=movies.size() %></span>

        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="90">
                    <col width="90">
                    <col width="">
                    <col width="90">
                    <col width="90">
                    <col width="90">
                    <col width="90">
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>状态</th>
                    <th>影片</th>
                    <th>票价</th>
                    <th>操作1</th>
                    <th>操作2</th>
                    <th>操作3</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Movie movie:movies){
                        String able="上映中";
                        if(movie.getAbel()==0)
                        {
                            able ="未上映";
                        }
                %>

                <tr>
                    <td><%=movie.getId()%></td>
                    <td><%=able%></td>
                    <td><%=movie.getName()%></td>
                    <td><%=movie.getPrice()%></td>
                    <td><button class="layui-btn"  onclick="javascrtpt:window.location.href='UpdateMovieServlet?type=add&id=<%=movie.getId()%>'"  >上映</button></td>
                    <td><button style="background: red" class="layui-btn"  onclick="javascrtpt:window.location.href='UpdateMovieServlet?type=del&id=<%=movie.getId()%>'" >下架</button></td>
                    <td><button id="<%=movie.getId()%>-<%=movie.getName()%>-<%=movie.getPrice()%>-<%=movie.getScore()%>" name="" style="background: orange" class="layui-btn"  onclick="dialog_show(this.id)" value=<%=movie.getId()%>>修改</button></td>
                </tr>


                <%
                    }
                %>
                </tbody>
            </table>


            <dialog id="update_dialog">
                <h2 align="center">修改电影信息</h2>
                <form action="UpdateMovieServlet?type=upd" method="post">
                    <table align="center" id="dialog_table">
                        <tr>
                            <td><input size="30" id="id" type="hidden" name="id" value="" style="border:0px;"></td>
                        </tr>
                        <tr>
                            <td>电影名称：</td>
                            <td><input size="30"  name="name" value="" id="movie_name" readonly="readonly"></td>
                        </tr>
                        <tr>
                            <td>电影价格：</td>
                            <td><input type="text"  size="30" name="price" value="" id="movie_price"></td>
                        </tr>
                        <tr>
                            <td>电影评分：</td>
                            <td><input type="text"  size="30"  name="score" value="" id="movie_score"></td>
                        </tr>
                        <tr>
                            <td align="center" ><input type="button" id="update_cancel" value="取消" onclick="dialog_close()"></td>
                            <td align="center" ><input type="submit" id="update_submit" value="确定" onclick="update_submit()"></td>
                        </tr>
                    </table>
                </form>
            </dialog>
        </div>






    </div>

















    <div class="layui-footer">
        <!-- 底部固定区域 -->
        CopyRight &copy; 计算机192 卢文静 黄子曦 王佳鹏
    </div>
</div>
<script src="js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });


    var add ='<%=request.getParameter("add")%>';
    if(add=='no'){
        alert("电影上映失败");
    }
    else if(add=='yes')
    {
        alert("电影上映成功");
    }

    var del ='<%=request.getParameter("del")%>';
    if(del=='no'){
        alert("电影下架失败");
    }
    else if(del=='yes')
    {
        alert("电影下架成功");
    }

    var upd ='<%=request.getParameter("upd")%>';
    if(upd=='no'){
        alert("修改电影信息成功");
    }
    else if(upd=='yes')
    {
        alert("修改电影信息成功");
    }


    var update_dialog=document.querySelector('#update_dialog');


    var hidde_id =  document.getElementById("id");
    var movie_name=  document.getElementById("movie_name");
    var movie_price =  document.getElementById("movie_price");
    var movie_score =  document.getElementById("movie_score");

    function dialog_show(id) {
        // var movie_id = document.getElementById("update_button").value();
        // var movieid = document.getElementsByClassName().item();
        // document.getElementById("id").value()=movie_id;
        update_dialog.showModal();
        var info = id;
        var items = info.split("-");
        hidde_id.value    = items[0];
        movie_name.value  = items[1];
        movie_price.value = items[2];
        movie_score.value = items[3];
    }
    function dialog_close() {
        update_dialog.close();
    }
    function update_submit()
    {
        window.location.href="UpdateMovieServlet?id="+hidde_id
    }
    <%--onclick="javascrtpt:window.location.href='UpdateMovieServlet?id=<%=movie.getId()%>&price=<%=movie.getPrice()%>&score=<%=movie.getScore()%>'--%>


</script>
</body>
</html>