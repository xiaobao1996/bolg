package com.java.blog.dao;

import com.java.blog.bean.Article;
import com.java.blog.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("article")
public interface ArticleDao {

    List<Article> selectAll();

    Article select(Integer id);

    int update(Article article);

    void insert(Article article);

    int delete(Integer id);

    @Select("select count(*) from article ")
    int  getCount();

    List<Article> getByPage(@Param("pageUtil")PageUtil pageUtil);

}
