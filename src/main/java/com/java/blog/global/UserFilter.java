package com.java.blog.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String path = request.getRequestURI();
        if(path.toLowerCase().indexOf("login")!=-1||path.toLowerCase().indexOf("index")!=-1){
            filterChain.doFilter(request,response);
        }else{
            if(request.getSession().getAttribute("USER")!=null){
                filterChain.doFilter(request,response);
            }else{
               request.getRequestDispatcher("/toLogin.do").forward(request,response);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
