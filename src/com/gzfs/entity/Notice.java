package com.gzfs.entity;

import java.util.Date;

public class Notice {
    private  Integer id;
    private  String text;
    private  Date time;

    public Notice(Integer id, String text, Date time) {
        this.id = id;
        this.text = text;
        this.time = time;
    }

    public Notice() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
