package com.java.blog.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodeFilter implements Filter {
    private String Encode = "utf-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        if(filterConfig.getInitParameter("ENCODE")!=null){
            Encode = filterConfig.getInitParameter("ENCODE");
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request =(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        request.setCharacterEncoding(Encode);
        response.setCharacterEncoding(Encode);
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
