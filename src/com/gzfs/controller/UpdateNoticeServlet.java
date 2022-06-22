package com.gzfs.controller;

import com.gzfs.service.ManageService;
import com.gzfs.service.NoticeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UpdateNotice")
public class UpdateNoticeServlet extends HttpServlet {
    NoticeService noticeService = new NoticeService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String del="";
        if(noticeService.DelNotice(id))
            del = "yes";
        else
            del = "no";
        resp.sendRedirect("admin2.jsp?del="+del);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String text = req.getParameter("text");
        String add ="";
        if (noticeService.AddNotice(text))
            add = "yes";
        else
            add = "no";
        resp.sendRedirect("admin2.jsp?add="+add);
    }
}
