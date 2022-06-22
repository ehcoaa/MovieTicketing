<%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/5/16
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>登陆注册</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="container">
    <div class="login-box slide-up">
        <div class="center">
            <h2 class="login-title">
                <span>已有账号，去</span>登录
            </h2>
            <form action="login" method="post">
                <div class="input-box">
                    <input type="text" placeholder="用户名" name="username">
                    <input type="password" placeholder="密码" name="password">
                </div>
                <button><input style="background-color:transparent;border:0;" type="submit" value="登陆"></button>
            </form>
        </div>
    </div>
    <div class="register-box">
        <h2 class="register-title">
            <span>没有账号，去</span>注册
        </h2>
        <form method="post" action="register">
            <div class="input-box">
                <input type="text" placeholder="用户名" name="username">
                <input type="password" placeholder="密码" name="password1">
                <input type="password" placeholder="确认密码" name="password2">
            </div>
            <button><input style="background-color:transparent;border:0;" type="submit" value="注册"></button>
        </form>
    </div>
</div>
<script src="js/login.js"></script>
<script>
    //登陆
    //取出传回来的参数error并与yes比较
    var errorl ='<%=request.getParameter("LError")%>';
    if(errorl=='yes'){
        alert("登录失败!请检查用户名密码是否输入正确");
    }
    //注册失败
    var errorr = '<%=request.getParameter("RError")%>';
    if(errorr=='yes')
    {
        alert("注册成功");
    }
    else if(errorr=='no')
    {
        alert("注册失败");
    }
    else if(errorr=='has')
    {
        alert("该账号已被注册")
    }
    else if(errorr=="error")
    {
        alert("两次输入密码不一致，请重新输入");
    }
</script>

</body>
</html>
