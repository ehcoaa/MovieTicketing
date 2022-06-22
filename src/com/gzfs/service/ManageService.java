package com.gzfs.service;

import com.gzfs.repositiory.ManageRepository;
import com.gzfs.repositiory.impl.ManageRepositoryImpl;

public class ManageService {
    ManageRepository manageRepository = new ManageRepositoryImpl();
    public boolean show(int id) {
        return manageRepository.ShowMovie(id);
    }

    public boolean close(int id) {
        return manageRepository.CloseMovie(id);
    }

    public boolean update(int id,double price,double score) {
        return manageRepository.UpdateMovie(id,price,score);
    }
}
