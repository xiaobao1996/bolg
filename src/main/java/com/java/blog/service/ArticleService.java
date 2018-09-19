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
    PageUtil getByPage(String num);
 }
