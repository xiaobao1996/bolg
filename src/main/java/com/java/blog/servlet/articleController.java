package com.java.blog.servlet;

import com.java.blog.bean.Article;
import com.java.blog.bean.Cate;
import com.java.blog.service.ArticleService;
import com.java.blog.service.CateService;
import com.java.blog.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller("articleController")
public class articleController {
    @Autowired
    private CateService cateService;
    @Autowired
    private ArticleService articleService;
    public void list (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String num = request.getParameter("num");
        if(num == null || num.equals("")){
            num = "1";
        }
        PageUtil pu = articleService.getByPage(null,null,num);
        List<Article> articles = pu.getRecords();
        request.setAttribute("pager",pu);
        request.setAttribute("Articles",articles);

        List<Article> clikdesc =articleService.clickDesc();
        request.setAttribute("clikdesc",clikdesc);
        request.getRequestDispatcher("/WEB-INF/admin/article_list.jsp").forward(request,response);
    }


    public void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cate> cates = cateService.getAll();
        request.setAttribute("cates",cates);
        request.getRequestDispatcher("/WEB-INF/admin/article_add.jsp").forward(request,response);
    }
    public void add(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String desc = request.getParameter("des");
        String keywords = request.getParameter("keywords");
        String content = request.getParameter("content");
        String pic = request.getParameter("pic");
        Integer cateid = Integer.parseInt(request.getParameter("cateid"));
        Integer state = Integer.parseInt(request.getParameter("state"));
        Article article = new Article();
        article.setAuthor(author);article.setTitle(title);article.setDes(desc);article.setKeywords(keywords);
        article.setContent(content);article.setPic(pic);article.setCateid(cateid);article.setState(state);
        articleService.add(article);
            response.sendRedirect("list.do");
    }

}
