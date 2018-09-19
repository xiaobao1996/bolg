package com.java.blog.service.impl;

import com.java.blog.bean.Article;
import com.java.blog.dao.ArticleDao;
import com.java.blog.service.ArticleService;
import com.java.blog.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;
    @Override
    public Article get(Integer id) {
        return null;
    }

    @Override
    public int edit(Integer id) {
        return 0;
    }

    @Override
    public int remove(Integer id) {
        return 0;
    }

    @Override
    public void add(Article article) {
        article.setClick(0);
        System.out.println(article.toString()+"888888888888888888888888888888888");
        articleDao.insert(article);
    }

    @Override
    public List<Article> getAll() {
        return null;
    }

    @Override
    public PageUtil getByPage(String num) {
        if(num == null || num.equals("")){
            num = "1";
        }
        int count = articleDao.getCount();
        System.out.println(count+"---------------------------------------------------------");
        PageUtil pu = new PageUtil(Integer.parseInt(num),count);
        List<Article> articles = articleDao.getByPage(pu);
        pu.setRecords(articles);
        return pu;
    }
}
