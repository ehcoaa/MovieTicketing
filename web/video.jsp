<%--
  Created by IntelliJ IDEA.
  User: 越意c
  Date: 2022/5/31
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/video.css">
<div class="box">
    <h1 style="text-align: center">精彩放映室</h1>
    <div class="container">
        <div class="main-video-container">
            <video src="http://182.92.102.155:8080/movie/1.mp4" loop controls
                   class="main-video"></video>
            <h3 class="main-vid-title">千与千寻</h3>
        </div>

        <div class="video-list-container">

            <div class="list active">
                <video src="http://182.92.102.155:8080/movie/2.mp4" class="list-video"></video>
                <h3 class="list-title">铃芽户缔 </h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/3.mp4" class="list-video"></video>
                <h3 class="list-title">你的名字</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/4.mp4" class="list-video"></video>
                <h3 class="list-title">西游记之大圣娶亲</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/5.mp4" class="list-video"></video>
                <h3 class="list-title">大圣归来</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/1.mp4" class="list-video"></video>
                <h3 class="list-title">千与千寻</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/6.mp4" class="list-video"></video>
                <h3 class="list-title">我是山姆</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/7.mp4" class="list-video"></video>
                <h3 class="list-title">二代妖精之今生有幸</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/9.mp4" class="list-video"></video>
                <h3 class="list-title">白蛇·缘起</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/11.mp4" class="list-video"></video>
                <h3 class="list-title">发如雪</h3>
            </div>

            <div class="list">
                <video src="http://182.92.102.155:8080/movie/12.mp4" class="list-video"></video>
                <h3 class="list-title">手写的从前</h3>
            </div>
        </div>
    </div>
</div>


<!-- custom js file link  -->
<script src="js/video.js"></script>
