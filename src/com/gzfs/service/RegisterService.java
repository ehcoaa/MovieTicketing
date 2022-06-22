package com.gzfs.service;

import com.gzfs.repositiory.UserRepository;
import com.gzfs.repositiory.impl.UserRepositoryImpl;

public class RegisterService {
    UserRepository userRepository = new UserRepositoryImpl();
    public boolean Register(String username,String password)
    {
        return userRepository.Register(username,password);
    }
}
