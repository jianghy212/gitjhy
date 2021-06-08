package com.school.pojo;

import java.util.Date;

public class SchoolSpace {
    private Integer tId;

    private String name;

    private String userImg;

    private String content;

    private String tSrc;

    private Date time;

    private Integer tSan;

    private Integer sId;

    private Integer status;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg == null ? null : userImg.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String gettSrc() {
        return tSrc;
    }

    public void settSrc(String tSrc) {
        this.tSrc = tSrc == null ? null : tSrc.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer gettSan() {
        return tSan;
    }

    public void settSan(Integer tSan) {
        this.tSan = tSan;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}