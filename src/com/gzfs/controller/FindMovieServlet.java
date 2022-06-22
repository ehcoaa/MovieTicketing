package com.gzfs.controller;

import com.gzfs.entity.Movie;
import com.gzfs.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/findMovie")
public class FindMovieServlet extends HttpServlet {
    MovieService movieService = new MovieService();

    /***
     * 做出用户查看分类电影全部信息的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =  req.getSession();
        String type = req.getParameter("type");
        String type2 = req.getParameter("type2");
        if(type == null){
            type = "findAll";
        }
        switch (type)
        {
            case "findAll":
                List<Movie> movies = movieService.findAllMovie();
                session.setAttribute("movieSort","全部");
                session.setAttribute("movies",movies);
                break;
            case "1":
                List<Movie> movies1 = movieService.findMovieBySortId(1);
                session.setAttribute("movieSort","经典推荐");
                session.setAttribute("movies",movies1);
                break;
            case "2":
                List<Movie> movies2 = movieService.findMovieBySortId(2);
                session.setAttribute("movieSort","爱情");
                session.setAttribute("movies",movies2);
                break;
            case "3":
                List<Movie> movies3 = movieService.findMovieBySortId(3);
                session.setAttribute("movieSort","喜剧");
                session.setAttribute("movies",movies3);
                break;
            case "4":
                List<Movie> movies4 = movieService.findMovieBySortId(4);
                session.setAttribute("movieSort","动漫");
                session.setAttribute("movies",movies4);
                break;
        }
        if(type2.equals("classify"))
            req.getRequestDispatcher("classify.jsp").forward(req,resp);
        else if(type2.equals("classify2")){
            req.getRequestDispatcher("show.jsp").forward(req,resp);
        }

    }

    /***
     * 搜索电影的操作
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
              String keyword = req.getParameter("keyword");
              HttpSession session = req.getSession();
              List<Movie> movieList = movieService.findMovieByName(keyword);
              int size = movieList.size();
              String text = "共搜索到"+String.valueOf(size)+"条记录";
              session.setAttribute("movieSort",text);
              session.setAttribute("movies",movieList);
              req.getRequestDispatcher("show.jsp").forward(req,resp);
    }
}
