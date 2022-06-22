<%@ page import="com.gzfs.entity.User" %>
<%@ page import="com.gzfs.service.UserInfoService" %>
<%@ page import="com.gzfs.repositiory.impl.UserInfoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 86159
  Date: 2022/5/30
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    User user= (User) session.getAttribute("user");
    UserInfoService uis=new UserInfoImpl();
    User u=uis.User_selectOne(user.getId());

    String msg=request.getParameter("msg");
    System.out.println("msg:"+msg);
%>
<html>
  <head>
    <title>个人信息</title>
    <link href="css/person.css" rel="stylesheet" type="text/css">
  </head>
  <script>
      function imageOnclick() {
          var btn_file=document.getElementById("btn_file");
          btn_file.click();
      }
      function inputFile(obj) {
          const file = obj.files[0];
          var reader=new FileReader();
          reader.readAsDataURL(file);
          reader.onload = function () {
              $("#imgimg").attr("src", this.result);
          }
      }
  </script>
  <body>
  <h1>个人信息</h1>
  <div id="button_back">
      <a href="index.jsp">返回主页</a>
  </div>
  <div id="to_person_booking">
      <a href="person_booking.jsp">个人订单</a>
      <a href="want_see.jsp">收藏列表</a>
  </div>
   <div class="main_content">
       <table>
           <tr>
               <td>头像：</td>
               <td>
                   <div id="avator">
                       <img src="images/guidao.png" alt="" class="img" id="imgimg"
                            onclick="imageOnclick()">
                   </div>
               </td>
               <td>
                   <input type="file" id="btn_file" accept="image/*"
                          onchange="inputFile(this)" hidden>
               </td>
           </tr>
           <tr>
               <td>用户ID：</td>
               <td><input type="text" size="30" readonly="readonly" id="user_id"
                          value="<%=u.getId()%>"></td>
           </tr>
           <tr>
               <td>用户名：</td>
               <td><input type="text" size="30" readonly="readonly" id="user_name"
                          value="<%=u.getUsername()%>"></td>
           </tr>
           <tr>
               <td>性别：</td>
               <td align="left"><input type="text" value="<%=u.getSex()%>" size="20" readonly="readonly"
                                       id="user_sex"></td>
           </tr>
           <tr>
               <td>绑定号码：</td>
               <td><input type="tel" size="30" maxlength="11" readonly="readonly"
                          value="<%=u.getTel()%>" id="user_phone"></td>
           </tr>
           <tr>
               <td colspan="2" align="center">
                   <div class="btn_update">
                       <button id="update_button" value="修改信息" onclick="dialog_show()">修改信息</button>
                   </div>
               </td>
           </tr>
       </table>
       <dialog id="update_dialog">
           <h2>修改个人信息</h2>
         <form action="UserInfoServlet" method="post">
             <table align="center" id="dialog_table">
                 <tr>
                     <td>用户ID：</td>
                     <td><input type="text" size="30" readonly="readonly" id="update_user_id"
                                name="update_user_id" value="<%=u.getId()%>"></td>
                 </tr>
                 <tr>
                     <td>用户名：</td>
                     <td><input type="text" size="30" id="update_user_name" name="update_user_name"></td>
                 </tr>
                 <tr>
                     <td>性别：</td>
                     <td><select name="update_user_sex" id="update_user_sex">
                         <option selected="selected" value="保密">保密</option>
                         <option value="男">男</option>
                         <option value="女">女</option>
                     </select></td>
                 </tr>
                 <tr>
                     <td>绑定号码：</td>
                     <td><input type="tel" size="30" maxlength="11" id="update_user_tel" name="update_user_tel"></td>
                 </tr>
                 <tr>
                     <td align="center"><input type="submit" id="update_submit" value="提交" onclick="update_submit()"></td>
                     <td align="center"><input type="reset" id="update_reset" value="重置"></td>
                     <td align="center"><input type="button" id="update_cancel" value="取消" onclick="dialog_close()"></td>
                 </tr>
             </table>
         </form>
       </dialog>

   </div>
  </body>
  <script>
    var update_button=document.getElementById('update_button');
    var update_dialog=document.querySelector('#update_dialog');
    var user_name=document.getElementById("update_user_name");
    var user_tel=document.getElementById("update_user_tel");
    var user_email=document.getElementById("update_user_email");
    function dialog_show() {
        update_dialog.showModal();
    }
    function dialog_close() {
        update_dialog.close();
    }
    function update_submit() {
        if(user_name.value==""||user_name.value==null){
            alert("用户名不能为空");
            return;
        }
        else if(user_tel.value==""||user_tel.value==null){
            alert("电话号码不能为空");
            return;
        }
        else {
            document.forms[0].submit();
        }
    }
    var m="<%=msg%>";
    if(m=="success"){
        alert("修改个人信息成功！");
    }
    else if(m=="failure"){
        alert("修改失败！");
    }
  </script>
</html>
