package com.gzfs.repositiory;

import com.gzfs.entity.Notice;

import java.util.List;

public interface ManageRepository {
    public boolean ShowMovie(int id) ;

    public boolean CloseMovie(int id) ;


    public boolean UpdateMovie(int id,double price,double score) ;

    public boolean AddNotice(String text);

    public List<Notice> FindAllNotice();

    public boolean DelNotice(int id);

}
