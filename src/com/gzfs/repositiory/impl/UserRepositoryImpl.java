package com.gzfs.repositiory.impl;

import com.gzfs.entity.User;
import com.gzfs.repositiory.UserRepository;
import com.gzfs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepositoryImpl implements UserRepository {
    @Override
    public User login(String username, String password) {
        User user =null;
        String sql = "select * from tb_user where username = ? and password = ?";
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement=connection.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,password);
            resultSet = statement.executeQuery();
            if (resultSet.next())
            {
                Integer id = resultSet.getInt(1);
                user = new User(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(connection,statement,resultSet);
        }
        return user;
    }

    @Override
    public boolean Register(String username, String password) {
        Connection conn = JDBCTools.getConnection();
        PreparedStatement ps=null;
        String sql="insert into tb_user(username,password) values(?,?)";
        int result =0;
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            result=ps.executeUpdate();
            if(result==0) {
                return false;
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCTools.release(conn,ps,null);
        }
        return true;
    }

    public static void main(String[] args) {
        UserRepository userRepository = new UserRepositoryImpl();
        String username = "戏子衿";
        String password = "123";
        boolean r = userRepository.Register(username,password);
        System.out.println(r);
    }
}
