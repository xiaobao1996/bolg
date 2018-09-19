package com.java.blog.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.java.blog.utils.QiniuUtils;
import org.json.JSONString;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller("imgController")
public class imgController  {
    public void upload(HttpServletRequest request, HttpServletResponse response){
        boolean flag =  true;
        try{
            Part part = request.getPart("image");
            String sysPath = request.getSession().getServletContext().getRealPath("upload");
            File filepath=new File(sysPath);
            if(!filepath.exists()){ filepath.mkdirs(); }
            String fileName = UUID.randomUUID().toString() ;
            String contentDispostion = part.getHeader("content-disposition");
            String suffix = contentDispostion.substring(contentDispostion.lastIndexOf("."), contentDispostion.length() - 1);
            fileName= String.valueOf(fileName)+suffix;
            part.write(sysPath+"/"+fileName);
            File file =new File(sysPath+"/"+fileName);
            flag = QiniuUtils.upload(file,fileName);
            String url = QiniuUtils.getDomain();
            Map<String,Object> map = new HashMap<>();
            String img = url+"/"+fileName;
            map.put("img",img);
            String str = JSONObject.toJSONString(map);
            PrintWriter out =  response.getWriter();
           out.write(str);
           out.flush();
           out.close();
            file.delete();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
