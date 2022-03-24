package com.quark.common.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.quark.common.utils.Constants;

import java.io.Serializable;
import java.util.Date;

public class MyRereply implements Serializable {

    private Integer id;

    private String content;

    @JsonFormat(pattern = Constants.DATETIME_FORMAT, timezone = "GMT+8")
    private Date initTime;

    //点赞个数
    private Integer up = 0;


    private User hfuser;


    private User bhfuser;

    private Integer replyId;

    @Override
    public String toString() {
        return "MyRereply{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", initTime=" + initTime +
                ", up=" + up +
                ", hfuser=" + hfuser +
                ", bhfuser=" + bhfuser +
                ", replyId=" + replyId +
                '}';
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

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

}
