package com.gzfs.entity;

import java.util.Date;

public class Movie {
       private Integer id;
       private String name;
       private Double price;
       private String director;
       private String actor;
       private String imgurl;
       private String describe;
       private Date time;
       private Integer sortid;
       private String company;
       private Integer abel;
       private Double score;

    public Movie() {
    }

    public Movie(Integer id, String name, Double price, String director, String actor, String imgurl, String describe, Date time, Integer sortid, String company, Integer abel, Double score) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.director = director;
        this.actor = actor;
        this.imgurl = imgurl;
        this.describe = describe;
        this.time = time;
        this.sortid = sortid;
        this.company = company;
        this.abel = abel;
        this.score = score;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSortid() {
        return sortid;
    }

    public void setSortid(Integer sortid) {
        this.sortid = sortid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getAbel() {
        return abel;
    }

    public void setAbel(Integer abel) {
        this.abel = abel;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }
}
