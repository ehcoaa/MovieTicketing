package com.gzfs.repositiory.impl;

import com.gzfs.entity.Movie;
import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.TicketRecord;
import com.gzfs.repositiory.MoviceRepository;
import com.gzfs.utils.JDBCTools;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieRepositoryImpl implements MoviceRepository {
    @Override
    public List<Movie> findBySortid(int sortid) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        List<Movie> movies = null;

        String sql = "SELECT * FROM tb_movie WHERE sortid=? AND able = 1";

        try {
            movies = new ArrayList<>();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,sortid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                Movie movie = new Movie(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getString("director"),
                        resultSet.getString("actor"),
                        resultSet.getString("imgurl"),
                        resultSet.getString("describe"),
                        resultSet.getDate("time"),
                        resultSet.getInt("sortid"),
                        resultSet.getString("company"),
                        resultSet.getInt("able"),
                        resultSet.getDouble("score")
                        );
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return movies;
    }

    @Override
    public List<Movie> findByName(String name) {

        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        List<Movie> movies = null;

        String sql = "SELECT * FROM tb_movie WHERE name LIKE ? AND able=1";

        try {
            movies = new ArrayList<>();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+name+"%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                Movie movie = new Movie(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getString("director"),
                        resultSet.getString("actor"),
                        resultSet.getString("imgurl"),
                        resultSet.getString("describe"),
                        resultSet.getDate("time"),
                        resultSet.getInt("sortid"),
                        resultSet.getString("company"),
                        resultSet.getInt("able"),
                        resultSet.getDouble("score")
                );
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return movies;
    }

    @Override
    public List<Movie> findAll() {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        List<Movie> movies = null;

        String sql = "SELECT * FROM tb_movie";

        try {
            movies = new ArrayList<>();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                Movie movie = new Movie(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getString("director"),
                        resultSet.getString("actor"),
                        resultSet.getString("imgurl"),
                        resultSet.getString("describe"),
                        resultSet.getDate("time"),
                        resultSet.getInt("sortid"),
                        resultSet.getString("company"),
                        resultSet.getInt("able"),
                        resultSet.getDouble("score")
                );
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return movies;
    }

    @Override
    public Movie findMovieById(int id) {

        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        Movie movie = null;

        String sql = "SELECT * FROM tb_movie where id=?";

        try {

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                movie = new Movie(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("price"),
                        resultSet.getString("director"),
                        resultSet.getString("actor"),
                        resultSet.getString("imgurl"),
                        resultSet.getString("describe"),
                        resultSet.getDate("time"),
                        resultSet.getInt("sortid"),
                        resultSet.getString("company"),
                        resultSet.getInt("able"),
                        resultSet.getDouble("score"));
            }
            }

         catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return movie;
    }

    @Override
    public int BuyMovie(TicketRecord ticketRecord) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            String sql = "insert into order_record values(" + ticketRecord.getUser_id() +
                    " ," + ticketRecord.getMovie_id() + ",'" + ticketRecord.getMovie_name() +
                    "','" + ticketRecord.getMovie_img() + "'," + ticketRecord.getTicket_price() +
                    "," + ticketRecord.getTicket_count() + ",'" + ticketRecord.getMovie_showDate() +
                    "','" + ticketRecord.getMovie_showTime() + "','" + ticketRecord.getRoom() + "')";

            preparedStatement = connection.prepareStatement(sql);
            result = preparedStatement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, preparedStatement, null);
        }
        return result;
    }

    @Override
    public boolean WantMovie(MovieWantSee movieWantSee) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        String sql  ="insert into want_see values(?,?,?,?,?,?);";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,movieWantSee.getUser_id());
            preparedStatement.setInt(2,movieWantSee.getMovie_id());
            preparedStatement.setString(3, movieWantSee.getMovie_name());
            preparedStatement.setString(4,movieWantSee.getMovie_img());
            preparedStatement.setString(5,movieWantSee.getMovie_director());
            preparedStatement.setString(6,movieWantSee.getMovie_actor());
            result = preparedStatement.executeUpdate();
            if(result==0)
            {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,null);
        }
        return true;
    }


    public  static  void  main(String[] args)
   {
       MoviceRepository moviceRepository = new MovieRepositoryImpl();
       List<Movie> movies =  moviceRepository.findBySortid(1);
       List<Movie> movies1 = moviceRepository.findByName("大");
       List<Movie> movies2 = moviceRepository.findAll();
       int i=0;
   }
}
