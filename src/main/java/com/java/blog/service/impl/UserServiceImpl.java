package com.java.blog.service.impl;

import com.java.blog.bean.User;
import com.java.blog.dao.UserDao;
import com.java.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> getAll() {
        return userDao.selectAll();
    }

    @Override
    public User get(Integer id) {
        return userDao.select(id);
    }

    @Override
    public boolean edit(User user) {
        return userDao.update(user);
    }

    @Override
    public boolean add(User user) {
        return userDao.insert(user);
    }

    @Override
    public boolean del(Integer id) {
        return userDao.delete(id);
    }

    @Override
    public int count() {
        return 0;
    }
}
