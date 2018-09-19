package com.java.blog.servlet;

import com.java.blog.bean.User;
import com.java.blog.service.SelfService;
import com.java.blog.service.UserService;
import com.java.blog.utils.GetRandom;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller("selfController")
public class selfController {
    @Autowired
    private UserService userService;
    @Autowired
    private SelfService selfService;
    public void login(HttpServletRequest request, HttpServletResponse response){
        List<User> list = userService.getAll();
        System.out.println(list);
    }
    public void doLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String username= request.getParameter("username");
        String password = request.getParameter("password");
        Map<String,Object> map = selfService.login(username,password);

        if((int)map.get("code")==0){
            request.getSession().setAttribute("USER",map.get("msg"));
            request.getRequestDispatcher("WEB-INF/admin/main.jsp").forward(request,response);
        }else{
           String msg = (String) map.get("msg"+" ");
           request.getRequestDispatcher("toLogin.do").forward(request,response);
        }
    }
    public void toLogin(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(request,response);
    }
    public void toReg(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/admin/login_reg.jsp").forward(request,response);
    }
    public void reg(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
       User user = new User();
       String username = request.getParameter("username");
       String password = request.getParameter("password");
       Integer sex = Integer.parseInt(request.getParameter("sex"));
       String birthday = request.getParameter("birthday");
       String img = request.getParameter("img");
       String code = GetRandom.getFourRandom();
       user.setUsername(username);
       user.setPassword(DigestUtils.md5Hex(password+code));
       user.setSex(sex);
       user.setImg(img);
       user.setCode(code);
        try {
            user.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        boolean flag = userService.add(user);
        if(flag){
            request.getSession().setAttribute("USER",user);
            request.getRequestDispatcher("WEB-INF/admin/main.jsp").forward(request,response);
        }else{
            response.sendRedirect(request.getContextPath()+"/WEB-INF/admin/login_reg.jsp");
        }
    }

    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().setAttribute("USER",null);
        response.sendRedirect("toLogin.do");
    }

}
