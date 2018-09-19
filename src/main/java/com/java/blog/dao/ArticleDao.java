package com.java.blog.dao;

import com.java.blog.bean.Article;
import com.java.blog.utils.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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


    int  getCountByPage(@Param("cateid")Integer cateid,@Param("title")String title);

    List<Article> getByPage(@Param("pageUtil")PageUtil pageUtil);

    List<Article> getByCate(@Param("cateid")Integer cateid,@Param("pageUtil")PageUtil pageUtil);

    List<Article> getByTitle(@Param("title")String title,@Param("pageUtil")PageUtil pageUtil);

    List<Article> getBy(@Param("cateid")Integer cateid,@Param("title")String title,@Param("pageUtil")PageUtil pageUtil);

    List<Article>clickDesc();

    @Select("select click from article where id = #{id}")
    int getClick(Integer id);

    @Update("update article set click = #{clickCount} where id = {id}")
    void updateClick(@Param("clickCount")Integer clickCount,@Param("id")Integer id);

}
