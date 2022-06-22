package com.gzfs.controller;

import com.gzfs.entity.Movie;
import com.gzfs.service.MovieService;
import jdk.nashorn.internal.ir.RuntimeNode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/sale")

public class SaleMovieServlet extends HttpServlet
{
    MovieService movieservice=new MovieService();
    Movie movie=null;
    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int movie_id= Integer.parseInt(req.getParameter("movie_id"));
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        movie=movieservice.findMovieById(movie_id);
        HttpSession session=req.getSession();
        session.setAttribute("MovieInformation",movie);
        resp.sendRedirect("moviesale.jsp");
    }
}
