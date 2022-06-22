package com.gzfs.controller;

import com.gzfs.entity.User;
import com.gzfs.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        if(username.equals("admin")&&password.equals("123456"))
        {
            resp.sendRedirect("admin.jsp");
        }
        else {
            User user = loginService.Login(username,password);

            //如果没找到这个用户，说明输入数据有误
            if (user==null)
            {
                resp.sendRedirect("login.jsp?LError=yes");
            }
            else{
                HttpSession session = req.getSession();
                session.setAttribute("user",user);
                resp.sendRedirect("index.jsp");
            }
        }


    }
}
