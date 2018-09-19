package com.java.blog.dao;

import com.java.blog.bean.User;
import org.springframework.stereotype.Repository;
;

import java.util.List;
@Repository("user")
public interface UserDao {
    List<User> selectAll();
    User select(Integer id);
    boolean update(User user);
    boolean insert(User user);
    boolean delete(Integer id);
    int getCount();
    User selectByName(String name);
}
