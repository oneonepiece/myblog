package com.site.blog.my.core.entity;



public class WebSocketUser {

    //用户是临时的，前期不打算入库
    private int id;
    private String name;
    //用户根据userid识别自身
    private int userid;
    //用户的消息
    private String message;
    //消息时间
    private String message_time ;
    //private String message_time = "2019-07-19 13:29";

    public WebSocketUser(){

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage_time() {
        return message_time;
    }

    public void setMessage_time(String message_time) {
        this.message_time = message_time;
    }
}
