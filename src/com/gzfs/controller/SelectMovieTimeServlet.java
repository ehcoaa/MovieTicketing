package com.gzfs.controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@WebServlet("/selectmovietime")
public class SelectMovieTimeServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
       // SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("HH:mm:ss");
        String room= req.getParameter("R3");
        String movie_showDate1=req.getParameter("R1");
        String movie_showTime1=req.getParameter("R2");

        HttpSession session1=req.getSession();
        session1.setAttribute("movie_Date",movie_showDate1);
        System.out.println(movie_showDate1);

        HttpSession session2=req.getSession();
        session2.setAttribute("movie_time",movie_showTime1);
        System.out.println(movie_showTime1);

        HttpSession session3=req.getSession();
        session3.setAttribute("movie_room",room);

        req.getRequestDispatcher("choose_seat.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     this.doGet(req,resp);
    }
}
