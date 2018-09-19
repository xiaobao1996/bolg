package com.java.blog.dao;

import com.java.blog.bean.Cate;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
@Repository("cate")
public interface CateDao {

    List<Cate> selectAll();

    List<Cate> selectChildrens( List<Integer> ids);
    void delChildrens( List<Integer> ids);
    @Delete("delete from cate where id = #{id}")
    void delete(@Param("id")Integer id);

    @Select("select * from cate where id = #{id}")
    Cate select(@Param("id") Integer id);
    boolean insert(Cate cate);

    boolean update(Cate cate);
}
