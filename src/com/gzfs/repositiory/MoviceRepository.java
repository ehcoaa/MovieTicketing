package com.gzfs.repositiory;

import com.gzfs.entity.Movie;
import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.TicketRecord;

import java.util.List;

public interface MoviceRepository {
    public List<Movie> findBySortid(int sortid);
    public List<Movie> findByName(String name);
    public List<Movie> findAll();
    public Movie findMovieById(int id);
    public int BuyMovie(TicketRecord ticketRecord);
    public boolean WantMovie(MovieWantSee movieWantSee);
}
