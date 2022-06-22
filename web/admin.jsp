<%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/6/10
  Time: 8:04
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
    <link rel="stylesheet" href="css/images.css">
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
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">欢迎您管理员</div>
        <!-- 背景div -->
        <div id="bgDIV"></div>
        <section>
            <!-- 外圈 -->
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <!-- 内圈 -->
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </section>
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
</script>

<%--相册js--%>
<script>
    const background = new MyBg({
        faBoxId: 'bgDIV'
    });
    background.CanvasInit();
</script>
<script>
    var section = document.querySelector('section');

    section.addEventListener('mouseover', function() {
        this.style.animation = 'circle 8s linear infinite';

    })
    section.addEventListener('mouseout', function() {
        this.style.animation = 'rotate 8s linear infinite';
    })
</script>
</body>
</html>