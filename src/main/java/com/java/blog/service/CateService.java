package com.java.blog.service;

import com.java.blog.bean.Cate;

import java.util.List;

public interface CateService {

    List<Cate> getAll();

    void del(Integer id);
    Cate get(Integer id);
    boolean add(Cate cate);
    boolean edit(Cate cate);
}
