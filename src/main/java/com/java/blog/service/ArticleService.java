package com.java.blog.service;

import com.java.blog.bean.Article;
import com.java.blog.utils.PageUtil;

import java.util.List;

public interface ArticleService {
    Article get(Integer id);
    int edit(Integer id);
    int remove(Integer id);
    void add(Article article);
    List<Article> getAll();
    PageUtil getByPage(String cateid,String title, String num);
    void editClick(Integer id);
    List<Article> clickDesc();
 }
