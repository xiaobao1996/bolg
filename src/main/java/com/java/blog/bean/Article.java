package com.java.blog.bean;

import java.util.Date;

public class Article {
    private Integer id;
    private String title;
    private String author;
    private String des;
    private String keywords;
    private String content;
    private String pic;
    private Integer click;
    private Integer state;
    private Date  time;
    private Integer cateid;
    private Cate cate;

    public Cate getCate() {
        return cate;
    }

    public void setCate(Cate cate) {
        this.cate = cate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCateid() {
        return cateid;
    }

    public void setCateid(Integer cateid) {
        this.cateid = cateid;
    }


}
