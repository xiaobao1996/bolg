package com.java.blog.bean;

public class Cate {
    private Integer id;
    private String catename;
    private Integer pid;
    private  Integer type;
    private Integer level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "Cate{" +
                "id=" + id +
                ", catename='" + catename + '\'' +
                ", pid=" + pid +
                ", type=" + type +
                ", level=" + level +
                '}';
    }
}
