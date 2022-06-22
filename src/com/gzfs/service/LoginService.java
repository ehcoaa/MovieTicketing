package com.gzfs.service;

import com.gzfs.entity.User;
import com.gzfs.repositiory.UserRepository;
import com.gzfs.repositiory.impl.UserRepositoryImpl;

public class LoginService {
    private UserRepository userRepository = new UserRepositoryImpl();
    public User Login(String username,String password)
    {
        return userRepository.login(username,password);
    }
}
