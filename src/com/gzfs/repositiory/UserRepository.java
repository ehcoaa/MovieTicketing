package com.gzfs.repositiory;

import com.gzfs.entity.User;

public interface UserRepository {
    public User login(String username, String password);
    public boolean Register(String username,String password);
}
