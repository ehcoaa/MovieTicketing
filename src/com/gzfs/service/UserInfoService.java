package com.gzfs.service;

import com.gzfs.entity.User;

public interface UserInfoService {
    public int User_Update(int id,String username,String sex,String tel);

    public User User_selectOne(int user_id);
}
