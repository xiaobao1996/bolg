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

        return articleDao.select(id);
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
        articleDao.insert(article);
    }

    @Override
    public List<Article> getAll() {
        return null;
    }

    @Override
    public PageUtil getByPage(String cateid, String title, String num) {
        if(num == null || num.equals("")){
            num = "1";
        }
        PageUtil pu=null;

        if((cateid==null|| cateid.equals("")) && title==null){
            int count = articleDao.getCountByPage(null,title);
            pu = new PageUtil(Integer.parseInt(num),count);
            List<Article> articles = articleDao.getByPage(pu);
            pu.setRecords(articles);
        }else if((cateid!=null&&!cateid.equals(""))&& title==null){
            int count = articleDao.getCountByPage(Integer.parseInt(cateid),title);
            pu = new PageUtil(Integer.parseInt(num),count);
            List<Article> articles = articleDao.getByCate(Integer.parseInt(cateid),pu);
            pu.setRecords(articles);
        }else if((cateid==null|| cateid.equals("")) && title!=null){
            int count = articleDao.getCountByPage(null,title);
            pu = new PageUtil(Integer.parseInt(num),count);
            List<Article> articles = articleDao.getByTitle(title,pu);
            pu.setRecords(articles);
        }else if((cateid!=null|| !cateid.equals("")) && title!=null){
            int count = articleDao.getCountByPage(Integer.parseInt(cateid),title);
            pu = new PageUtil(Integer.parseInt(num),count);
            List<Article> articles = articleDao.getBy(Integer.parseInt(cateid),title,pu);
            pu.setRecords(articles);
        }
        return pu;
    }


    public List<Article> clickDesc(){
        return articleDao.clickDesc();
    }
    public void editClick(Integer id){
     Integer count = articleDao.getClick(id);
      count = count+1;
      Article article =new Article();
      article.setClick(count);
      article.setId(id);
      articleDao.update(article);
    }
}
