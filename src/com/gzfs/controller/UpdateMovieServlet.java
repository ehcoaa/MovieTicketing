package com.gzfs.controller;

import com.gzfs.service.ManageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UpdateMovieServlet")
public class UpdateMovieServlet extends HttpServlet {
    ManageService manageService = new ManageService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
              String type = req.getParameter("type");
              int id   = Integer.parseInt(req.getParameter("id"));
              String add="";
              String del="";

              switch (type)
              {
                  case "add":
                      if(!manageService.show(id))
                          add = "no";
                      else
                          add = "yes";
                      resp.sendRedirect("admin1.jsp?add="+add);
                      break;
                  case "del":
                      if(!manageService.close(id))
                          del = "no";
                      else
                          del = "yes";
                      resp.sendRedirect("admin1.jsp?del="+del);
                      break;
                  default:
                      resp.sendRedirect("admin1.jsp");
                      break;
              }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id   = Integer.parseInt(req.getParameter("id"));
        double  price = Double.parseDouble(req.getParameter("price").trim());
        double  score = Double.parseDouble(req.getParameter("score").trim());
        String upd="";
        if(!manageService.update(id,price,score))
            upd = "no";
        else
            upd = "yes";
        resp.sendRedirect("admin1.jsp?upd="+upd);
    }
}
