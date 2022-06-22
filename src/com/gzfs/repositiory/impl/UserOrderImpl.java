package com.gzfs.repositiory.impl;

import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.TicketRecord;
import com.gzfs.service.UserOrderService;
import com.gzfs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserOrderImpl implements UserOrderService {
    @Override
    public ArrayList<TicketRecord> FindAllRecordById(int user_id) {
        ArrayList<TicketRecord> trList=new ArrayList<TicketRecord>();
        String sql="select * from order_record where user_id = "+user_id+
                " order by movie_showDate desc ;";
        Connection con= JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()){
                TicketRecord tr=new TicketRecord();
                tr.setUser_id(rs.getInt("user_id"));
                tr.setMovie_id(rs.getInt("movie_id"));
                tr.setMovie_name(rs.getString("movie_name"));
                tr.setMovie_img(rs.getString("movie_img"));
                tr.setTicket_price(rs.getDouble("ticket_price"));
                tr.setTicket_count(rs.getInt("ticket_count"));
                tr.setMovie_showDate(rs.getString("movie_showDate"));
                tr.setMovie_showTime(rs.getString("movie_showTime"));
                tr.setRoom(rs.getString("room"));
                trList.add(tr);
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(con,pst,rs);
        }
        return trList;
    }

    @Override
    public int DeleteRecordById(int user_id, int movie_id, String movie_showDate) {
        int result=0;
        String sql="delete from order_record where user_id = "+user_id+
                " and movie_id = "+movie_id+" and movie_showDate='"+movie_showDate+"';";
        Connection con= JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
           pst= con.prepareStatement(sql);
           result=pst.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(con,pst,rs);
        }
        return result;
    }

    @Override
    public ArrayList<MovieWantSee> FindAllWantById(int user_id) {
        ArrayList<MovieWantSee> trList=new ArrayList<MovieWantSee>();
        String sql="select * from want_see where user_id = "+user_id+
                " order by movie_name desc ;";
        Connection con= JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()){
                MovieWantSee tr=new MovieWantSee();
                tr.setUser_id(rs.getInt("user_id"));
                tr.setMovie_id(rs.getInt("movie_id"));
                tr.setMovie_name(rs.getString("movie_name"));
                tr.setMovie_img(rs.getString("movie_img"));
                tr.setMovie_director(rs.getString("movie_director"));
                tr.setMovie_actor(rs.getString("movie_actor"));
                trList.add(tr);
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(con,pst,rs);
        }
        return trList;
    }

    @Override
    public int DeleteWantById(int user_id, int movie_id, String movie_name) {
        int result=0;
        String sql="delete from want_see where user_id = "+user_id+
                " and movie_id = "+movie_id+" and movie_name='"+movie_name+"';";
        Connection con= JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            pst= con.prepareStatement(sql);
            result=pst.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(con,pst,rs);
        }
        return result;
    }
}
