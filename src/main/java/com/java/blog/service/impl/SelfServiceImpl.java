package com.java.blog.service.impl;


import com.java.blog.bean.User;
import com.java.blog.dao.UserDao;
import com.java.blog.service.SelfService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("selfService")
public class SelfServiceImpl implements SelfService {
    @Autowired
    private UserDao userDao;
    @Override
    public Map<String,Object> login(String name, String password) {
        Map<String,Object> map = new HashMap<>();
        if(name==null||password==null){
            map.put("code",1);
            map.put("msg","用户名或密码输入为空！");
        }else{
            User user = userDao.selectByName(name);
            if(user==null){
                map.put("code",1);
                map.put("msg","用户名不存在!");
            }else{
                String code = user.getCode();
                String pwd = user.getPassword();
                name = DigestUtils.md5Hex(password+code);
                if(!name.equals(pwd)){
                    map.put("code",20);
                    map.put("msg","密码错误！");
                }else{
                    map.put("code",0);
                    map.put("msg",user);
                }
            }
        }
        return map;
    }
}
