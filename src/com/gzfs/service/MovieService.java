package com.gzfs.service;

import com.gzfs.entity.Movie;
import com.gzfs.entity.MovieWantSee;
import com.gzfs.entity.TicketRecord;
import com.gzfs.repositiory.MoviceRepository;
import com.gzfs.repositiory.impl.MovieRepositoryImpl;

import java.util.List;

public class MovieService {
       MoviceRepository moviceRepository = new MovieRepositoryImpl();
       public List<Movie> findMovieBySortId(int id)
       {
           return moviceRepository.findBySortid(id);
       }
       public List<Movie> findMovieByName(String name)
       {
           return moviceRepository.findByName(name);
       }
       public List<Movie> findAllMovie(){
           return  moviceRepository.findAll();
       }
       public Movie findMovieById(int id){return moviceRepository.findMovieById(id);}
       public int SuccessBuy(TicketRecord ticketRecord)
       {
           int result=moviceRepository.BuyMovie(ticketRecord);
           return result;
       }
        public boolean SuccessWant(MovieWantSee movieWantSee)
        {
            boolean result=moviceRepository.WantMovie(movieWantSee);
            return result;
        }
}
