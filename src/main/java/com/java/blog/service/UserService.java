package com.java.blog.service;

import com.java.blog.bean.User;

import java.util.List;

public interface UserService {
    List<User> getAll();
    User get(Integer id);
    boolean edit(User user);
    boolean add(User user);
    boolean del(Integer id);
    int count();
}
