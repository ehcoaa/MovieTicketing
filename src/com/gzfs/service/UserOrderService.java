package com.gzfs.service;

import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.TicketRecord;

import java.util.ArrayList;

public interface UserOrderService {
    public ArrayList<TicketRecord> FindAllRecordById(int user_id);
    public int DeleteRecordById(int user_id, int movie_id, String movie_showDate);
    public ArrayList<MovieWantSee> FindAllWantById(int user_id);
    public int DeleteWantById(int user_id, int movie_id, String movie_name);
}
