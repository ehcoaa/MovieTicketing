package com.gzfs.controller;

import com.gzfs.repositiory.impl.UserOrderImpl;
import com.gzfs.service.UserOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserOrderServlet")
public class UserOrderServlet extends HttpServlet {//删除订单
    UserOrderService uos=new UserOrderImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String s_user_id=request.getParameter("user_id");
        int user_id=Integer.parseInt(s_user_id);
        String s_movie_id=request.getParameter("movie_id");
        int movie_id=Integer.parseInt(s_movie_id);
        String movie_showDate=request.getParameter("movie_showDate");

        int result=uos.DeleteRecordById(user_id,movie_id,movie_showDate);
        if(result>0){
            response.sendRedirect("person_booking.jsp?msg=delete_success");
        } else {
            response.sendRedirect("person_booking.jsp?msg=delete_failure");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doGet(request,response);
    }
}
