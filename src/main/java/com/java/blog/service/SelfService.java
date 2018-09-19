package com.java.blog.service;

import com.java.blog.bean.User;

import java.util.Map;

public interface SelfService {
    Map<String,Object> login(String name, String password);
}
