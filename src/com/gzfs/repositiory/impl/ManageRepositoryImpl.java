package com.gzfs.repositiory.impl;

import com.gzfs.entity.Movie;
import com.gzfs.entity.Notice;
import com.gzfs.repositiory.ManageRepository;
import com.gzfs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageRepositoryImpl implements ManageRepository {

    @Override
    public boolean ShowMovie(int id) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result =0;
        String sql  ="UPDATE tb_movie SET able=1 WHERE id =?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
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

    @Override
    public boolean CloseMovie(int id) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result =0;
        String sql  ="UPDATE tb_movie SET able=0 WHERE id =?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
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

    @Override
    public boolean UpdateMovie(int id,double price,double score) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        String sql  ="UPDATE tb_movie SET price=?,score=? WHERE id =?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDouble(1,price);
            preparedStatement.setDouble(2,score);
            preparedStatement.setInt(3,id);
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

    @Override
    public boolean AddNotice(String text) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        String sql  ="INSERT INTO tb_notice(text,time) VALUES(?,NOW())";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,text);
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

    @Override
    public List<Notice> FindAllNotice() {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        List<Notice> notices = null;

        String sql = "SELECT * FROM tb_notice";

        try {
            notices = new ArrayList<>();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                  Notice notice = new Notice(
                          resultSet.getInt("id"),
                          resultSet.getString("text"),
                          resultSet.getDate("time"));
                  notices.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.release(connection,preparedStatement,resultSet);
        }
        return notices;
    }

    @Override
    public boolean DelNotice(int id) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        String sql  ="DELETE FROM tb_notice WHERE id=?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
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
}
