package com.quark.common.entity;


import java.io.Serializable;
import java.util.Date;

public class MyRereply implements Serializable {

    private Integer id;

    private String content;

    private Date initTime;

    //点赞个数
    private Integer up = 0;


    private User hfuser;


    private User bhfuser;


    public User getHfuser() {
        return hfuser;
    }

    public void setHfuser(User hfuser) {
        this.hfuser = hfuser;
    }

    public User getBhfuser() {
        return bhfuser;
    }

    public void setBhfuser(User bhfuser) {
        this.bhfuser = bhfuser;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getInitTime() {
        return initTime;
    }

    public void setInitTime(Date initTime) {
        this.initTime = initTime;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    @Override
    public String toString() {
        return "MyRereply{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", initTime=" + initTime +
                ", up=" + up +
                ", hfuser=" + hfuser +
                ", bhfuser=" + bhfuser +
                '}';
    }
}
