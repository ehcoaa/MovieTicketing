package com.gzfs.controller;

import com.gzfs.repositiory.impl.UserInfoImpl;
import com.gzfs.service.UserInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {//修改个人信息
    UserInfoService u_service=new UserInfoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
         String i=request.getParameter("update_user_id");
         int id=Integer.parseInt(i);
         String username=request.getParameter("update_user_name");
         String sex=request.getParameter("update_user_sex");
         String tel=request.getParameter("update_user_tel");

         int result=u_service.User_Update(id,username,sex,tel);
         response.setCharacterEncoding("UTF-8");
         if(result>0){
             response.sendRedirect("person.jsp?msg=success");
         } else {
             response.sendRedirect("person.jsp?msg=failure");
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
