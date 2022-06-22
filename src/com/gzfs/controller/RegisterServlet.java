package com.gzfs.controller;


import com.gzfs.entity.User;
import com.gzfs.service.LoginService;
import com.gzfs.service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    RegisterService registerService = new RegisterService();
    LoginService loginService = new LoginService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");
        String check="";
        if (password1.equals(password2))
        {
            //如果数据库已经有了
            User user = loginService.Login(username,password1);
            if(user!=null)
            {
                check = "has";
            }


            else {
                boolean Inserter  =registerService.Register(username,password1);
                if (Inserter)
                    check = "yes";
                else
                    check = "no";
            }
        }
        else
        {
            check="error";
        }
        resp.sendRedirect("login.jsp?RError="+check);
    }
}
