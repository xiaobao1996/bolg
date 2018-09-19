package com.java.blog.servlet;

import com.java.blog.bean.Cate;
import com.java.blog.service.CateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller("cateController")
public class cateController {
    @Autowired
    private CateService cateService;

    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cate> cates = cateService.getAll();
        request.setAttribute("cates",cates);
        request.getRequestDispatcher("/WEB-INF/admin/cate_list.jsp").forward(request,response);
    }
    public void toAdd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Cate> cates = cateService.getAll();
        request.setAttribute("cates",cates);
        request.getRequestDispatcher("/WEB-INF/admin/cate_add.jsp").forward(request,response);
    }
    public void add(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        Integer pid = Integer.parseInt(request.getParameter("pid"));
        String catename = request.getParameter("catename");
        Cate cate = new Cate();
        cate.setPid(pid);
        cate.setCatename(catename);
        boolean flag = cateService.add(cate);
        if(flag){
            response.sendRedirect("list.do");
        }else{
            request.getRequestDispatcher("/WEB-INF/admin/cate_add.jsp").forward(request,response);
        }
    }
    public void toEdit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Cate cate = cateService.get(id);
        List<Cate> cates = cateService.getAll();
        request.setAttribute("CATE",cate);
        request.setAttribute("cates",cates);
        request.getRequestDispatcher("/WEB-INF/admin/cate_edit.jsp").forward(request,response);
    }
    public  void edit(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Integer pid = Integer.parseInt(request.getParameter("pid"));
        String catename = request.getParameter("catename");
        Cate cate = new Cate();
        cate.setId(id);
        cate.setPid(pid);
        cate.setCatename(catename);
        boolean flag = cateService.edit(cate);
        if(flag){
            response.sendRedirect("list.do");
        }else{
           request.getRequestDispatcher("/WEB-INF/admin/cate_edit.jsp").forward(request,response);
        }
    }
    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Integer id =Integer.parseInt(request.getParameter("id"));
        cateService.del(id);
        response.sendRedirect("list.do");
    }
}
