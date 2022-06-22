package com.gzfs.repositiory.impl;

import com.gzfs.entity.User;
import com.gzfs.service.UserInfoService;
import com.gzfs.utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserInfoImpl implements UserInfoService {

    @Override
    public int User_Update(int id,String username,String sex,String tel) {
        int result=0;
        String sql="update tb_user set username='"+username+"',sex='"+sex+"', tel='"+tel+
                "' where id = "+id+";";
        Connection con= JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            pst=con.prepareStatement(sql);
            result=pst.executeUpdate(sql);
            System.out.println("id="+id+",username="+username+",sex="+sex+",tel="+tel);
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
             JDBCTools.release(con,pst,rs);
        }
        return result;
    }

    @Override
    public User User_selectOne(int user_id) {
        User user=new User();
        String sql="select * from tb_user where id= "+user_id+";";
        Connection con=JDBCTools.getConnection();
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()){
               user.setId(rs.getInt("id"));
               user.setUsername(rs.getString("username"));
               user.setPassword(rs.getString("password"));
               user.setSex(rs.getString("sex"));
               user.setTel(rs.getString("tel"));
                System.out.println(user.toString());
            }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            JDBCTools.release(con,pst,rs);
        }
        return user;
    }
}
