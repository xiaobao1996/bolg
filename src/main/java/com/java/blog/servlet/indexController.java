package com.java.blog.servlet;

import com.java.blog.bean.Article;
import com.java.blog.service.ArticleService;
import com.java.blog.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller("indexController")
public class indexController {
    @Autowired
    private ArticleService articleService;

    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String num = request.getParameter("num");
        if(num == null||num.equals("")){
            num = "1";
        }

        String cateid = request.getParameter("cateid");


       if(cateid!=null){
           request.setAttribute("cateid",cateid);
       }else{
           request.setAttribute("cateid",null);
       }

        String title = request.getParameter("title");
        PageUtil pu = articleService.getByPage(cateid,title,num);
        List<Article> articles = pu.getRecords();
        request.setAttribute("pager",pu);
        request.setAttribute("title",title);
        request.setAttribute("Articles",articles);
        List<Article> clikdesc =articleService.clickDesc();
        request.setAttribute("clikdesc",clikdesc);
        request.getRequestDispatcher("/WEB-INF/index/index.jsp").forward(request,response);
    }

    public void detail(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        articleService.editClick(id);
        Article article = articleService.get(id);
        request.setAttribute("Article",article);
        request.getRequestDispatcher("/WEB-INF/index/index_detail.jsp").forward(request,response);

    }
}
