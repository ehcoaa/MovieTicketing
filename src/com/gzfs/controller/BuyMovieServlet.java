package com.gzfs.controller;

import com.gzfs.entity.Movie;
import com.gzfs.entity.TicketRecord;
import com.gzfs.entity.User;
import com.gzfs.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Console;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

@WebServlet("/buymovie")
public class BuyMovieServlet extends HttpServlet
{
    MovieService movieService=new MovieService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TicketRecord ticketRecord=new TicketRecord();
        HttpSession session= req.getSession();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("HH:mm:ss");
        User user= (User) session.getAttribute("user");
        Movie movie= (Movie) session.getAttribute("MovieInformation");
        String room= (String) session.getAttribute("movie_room");
        System.out.println("放映厅："+room);
        String date1= (String) session.getAttribute("movie_Date");
        String time1= (String) session.getAttribute("movie_time");
        System.out.println("日期："+date1+"\n时间："+time1);
/*        Date date = null;
        try {
            date = simpleDateFormat.parse(date1);
        } catch (ParseException e) {
            e.printStackTrace();
        }*/

/*        Time time= null;
        try {
            time= (Time) simpleDateFormat1.parse(time1);
        } catch (ParseException e) {
            e.printStackTrace();
        }*/

        ticketRecord.setMovie_id(movie.getId());
        ticketRecord.setMovie_img(movie.getImgurl());
        ticketRecord.setMovie_showDate(date1);
        ticketRecord.setMovie_showTime(time1);
        ticketRecord.setRoom(room);
        ticketRecord.setMovie_name(movie.getName());
        ticketRecord.setUser_id(user.getId());
        ticketRecord.setTicket_count(1);
        ticketRecord.setTicket_price(10.0);
        int result=movieService.SuccessBuy(ticketRecord);
        if(result>0){
            resp.sendRedirect("index.jsp?Buy_msg=success");
        }
        else {
            resp.sendRedirect("choose_seat?Buy_msg=failure");
        }

//        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
