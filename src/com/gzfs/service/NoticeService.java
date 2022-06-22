package com.gzfs.service;

import com.gzfs.entity.Notice;
import com.gzfs.repositiory.ManageRepository;
import com.gzfs.repositiory.impl.ManageRepositoryImpl;

import java.util.List;


public class NoticeService {
    ManageRepository manageRepository = new ManageRepositoryImpl();

    public List<Notice> FindAllNotice() {
        return manageRepository.FindAllNotice();
    }

    public boolean AddNotice(String text) {
        return manageRepository.AddNotice(text);
    }
    public boolean DelNotice(int id)
    {
        return manageRepository.DelNotice(id);
    }
}
