package com.gzfs.entity;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String sex;
    private String tel;
    private String img;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public User(Integer id, String username, String password, String sex, String tel, String img) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.tel = tel;
        this.img = img;
    }

    public User(){

    }
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", tel='" + tel + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
