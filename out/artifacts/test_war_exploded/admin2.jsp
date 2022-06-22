<%@ page import="com.gzfs.entity.Notice" %>
<%@ page import="com.gzfs.service.NoticeService" %>
<%@ page import="java.util.ArrayList" %><%--
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
            NoticeService noticeService = new NoticeService();
            ArrayList<Notice> notices = (ArrayList<Notice>) noticeService.FindAllNotice();
            if (notices == null){
                notices = new ArrayList<Notice>();
            }
        %>


        全部公告 <span><%=notices.size() %>&nbsp;&nbsp;&nbsp;</span>
        <a href="#" style="text-decoration: none;color: #00FF00" onclick="dialog_show()">发布公告</a>

        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="90">
                    <col width="">
                    <col width="120">
                    <col width="90">
                </colgroup>
                <thead>
                <tr>
                    <th>公告编号</th>
                    <th>发布内容</th>
                    <th>发布时间</th>
                    <th>公告操作</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Notice notice:notices){
                %>

                <tr>
                    <td><%=notice.getId()%></td>
                    <td><%=notice.getText()%></td>
                    <td><%=notice.getTime()%></td>
                    <td><button  style="background: red" class="layui-btn"  onclick="javascrtpt:window.location.href='UpdateNotice?type=del&id=<%=notice.getId()%>'"  >删除</button></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>



        <dialog id="update_dialog">
            <h1 align="center">公告内容</h1>
            <form action="UpdateNotice" method="post">
                <table>
                    <tr> <textarea class="textarea" id="baidu_translate_input" data-height="70" style="height: 100px;" name="text"></textarea></tr>
                    <tr>
                        <td align="center"> <input type="button" id="update_cancel" value="取消" onclick="dialog_close()"></td>
                        <td></td>
                        <td align="center"> <input type="submit" id="update_submit" value="发布"></td>
                    </tr>
                </table>
            </form>
        </dialog>

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


    var del ='<%=request.getParameter("del")%>';
    if(del=='no'){
        alert("公告删除失败");
    }
    else if(del=='yes')
    {
        alert("公告删除成功");
    }

    var update_dialog=document.querySelector('#update_dialog');
    function dialog_show() {
        update_dialog.showModal();
    }
    function dialog_close() {
        update_dialog.close();
    }
</script>
</body>
</html>