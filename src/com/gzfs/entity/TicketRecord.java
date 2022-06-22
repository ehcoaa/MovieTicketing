package com.gzfs.entity;

import java.sql.Time;
import java.util.Date;

public class TicketRecord {
    int user_id; //用户id
    int movie_id; //电影id
    String movie_name;//电影名
    String movie_img; //电影海报图片的链接
    double ticket_price;//电影票单价
    int ticket_count;//购买的票数
    String movie_showDate;//电影播放日期
    String  movie_showTime; //电影播放开始时间
    String room; //电影播放展厅

    public TicketRecord(int user_id, int movie_id, String movie_name, String movie_img, double ticket_price, int ticket_count, Date movie_showDate, Time movie_showTime, String room) {
        //有参构造
        System.out.println("实例化一个有参构造的TicketRecord对象");
        this.user_id = user_id;
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.movie_img = movie_img;
        this.ticket_price = ticket_price;
        this.ticket_count = ticket_count;
        this.movie_showDate = String.valueOf(movie_showDate);
        this.movie_showTime = String.valueOf(movie_showTime);
        this.room = room;
    }
    public TicketRecord(){
        //无参构造
        System.out.println("实例化一个无参构造的TicketRecord对象");
    }

    @Override
    public String toString() {
        return "TicketRecord{" +
                "user_id='" + user_id + '\'' +
                ", movie_id=" + movie_id +
                ", movie_name='" + movie_name + '\'' +
                ", movie_img='" + movie_img + '\'' +
                ", ticket_price=" + ticket_price +
                ", ticket_count=" + ticket_count +
                ", movie_showDate=" + movie_showDate +
                ", movie_showTime=" + movie_showTime +
                ", room='" + room + '\'' +
                '}';
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getMovie_img() {
        return movie_img;
    }

    public void setMovie_img(String movie_img) {
        this.movie_img = movie_img;
    }

    public double getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(double ticket_price) {
        this.ticket_price = ticket_price;
    }

    public int getTicket_count() {
        return ticket_count;
    }

    public void setTicket_count(int ticket_count) {
        this.ticket_count = ticket_count;
    }

    public String getMovie_showDate() {
        return movie_showDate;
    }

    public void setMovie_showDate(String movie_showDate) {
        this.movie_showDate = movie_showDate;
    }

    public String  getMovie_showTime() {
        return movie_showTime;
    }

    public void setMovie_showTime(String movie_showTime) {
        this.movie_showTime = movie_showTime;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
}
