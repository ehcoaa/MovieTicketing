<%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/5/30
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--      导航栏的css--%>
<link rel="stylesheet" href="css/top.css">
<%--      导航栏的js--%>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<nav>
    <div class="menu-icon">
        <span class="fas fa-bars"></span>
    </div>
    <div class="logo">
        电影购票系统</div>
    <div class="nav-items">
        <li><a href="#">首页</a></li>
        <li><a href="findMovie?type2=classify">电影分类</a></li>
        <li><a href="person.jsp">个人中心</a></li>
    </div>
    <div class="search-icon">
        <span class="fas fa-search"></span>
    </div>
    <div class="cancel-icon">
        <span class="fas fa-times"></span>
    </div>
    <form action="findMovie" method="post">
        <input type="search" name="keyword" class="search-data" placeholder="搜索影片" required>
        <button type="submit" class="fas fa-search"></button>
    </form>
</nav>
<script>
    const menuBtn = document.querySelector(".menu-icon span");
    const searchBtn = document.querySelector(".search-icon");
    const cancelBtn = document.querySelector(".cancel-icon");
    const items = document.querySelector(".nav-items");
    const form = document.querySelector("form");
    menuBtn.onclick = () => {
        items.classList.add("active");
        menuBtn.classList.add("hide");
        searchBtn.classList.add("hide");
        cancelBtn.classList.add("show");
    }
    cancelBtn.onclick = () => {
        items.classList.remove("active");
        menuBtn.classList.remove("hide");
        searchBtn.classList.remove("hide");
        cancelBtn.classList.remove("show");
        form.classList.remove("active");
        cancelBtn.style.color = "#ff3d00";
    }
    searchBtn.onclick = () => {
        form.classList.add("active");
        searchBtn.classList.add("hide");
        cancelBtn.classList.add("show");
    }
</script>