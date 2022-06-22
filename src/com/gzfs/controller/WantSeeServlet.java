package com.gzfs.controller;

import com.gzfs.entity.Movie;
import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.User;
import com.gzfs.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/wantsee")
public class WantSeeServlet extends HttpServlet
{
    MovieService movieService=new MovieService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieWantSee movieWantSee=new MovieWantSee();
        HttpSession session=req.getSession();
        User user=(User) session.getAttribute("user");
        Movie movie=(Movie) session.getAttribute("MovieInformation");
        movieWantSee.setMovie_id(movie.getId());
        movieWantSee.setMovie_name(movie.getName());
        movieWantSee.setMovie_img(movie.getImgurl());
        movieWantSee.setMovie_director(movie.getDirector());
        movieWantSee.setMovie_actor(movie.getActor());
        movieWantSee.setUser_id(user.getId());
        boolean result=movieService.SuccessWant(movieWantSee);
        String add="";
        if(result){
            add="yes";
            resp.sendRedirect("index.jsp?add="+add);

        }
        else{
            add="no";
            resp.sendRedirect("moviesale.jsp?add="+add);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
