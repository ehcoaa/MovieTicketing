package com.gzfs.entity;
public class MovieWantSee {
    private  int user_id; //用户id
    private int movie_id; //电影id
    private String movie_name;//电影名
    private String movie_img; //电影海报图片的链接
    private String movie_director;//电影导演
    private String movie_actor;//电影主演

    public MovieWantSee(int user_id, int movie_id, String movie_name, String movie_img, String movie_director, String movie_actor) {
        //有参构造
        System.out.println("实例化一个有参构造的MovieWantSee对象");
        this.user_id = user_id;
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.movie_img = movie_img;
        this.movie_director = movie_director;
        this.movie_actor = movie_actor;
    }
    public MovieWantSee(){
        //无参构造
        System.out.println("实例化一个无参构造的MovieWantSee对象");
    }

    @Override
    public String toString() {
        return "MovieWantSee{" +
                "user_id='" + user_id + '\'' +
                ", movie_id=" + movie_id +
                ", movie_name='" + movie_name + '\'' +
                ", movie_img='" + movie_img + '\'' +
                ", movie_director=" + movie_director +
                ", movie_actor=" + movie_actor + '\'' +
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

    public String getMovie_director() {
        return movie_director;
    }

    public void setMovie_director(String movie_director) {
        this.movie_director = movie_director;
    }

    public String getMovie_actor() {
        return movie_actor;
    }

    public void setMovie_actor(String movie_actor) {
        this.movie_actor = movie_actor;
    }
}
