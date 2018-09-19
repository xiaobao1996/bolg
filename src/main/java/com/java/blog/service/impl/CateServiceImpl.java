package com.java.blog.service.impl;

import com.java.blog.bean.Cate;
import com.java.blog.dao.CateDao;
import com.java.blog.service.CateService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
@Service("cateService")
public class CateServiceImpl implements CateService {
    static List<Cate> list = new ArrayList<>();
    static List<Integer> childIdList = new ArrayList<>();
    @Autowired
    private CateDao cateDao;

    @Override
    public List<Cate> getAll() {
        Iterator<Cate> it=list.iterator();
        while(it.hasNext()&&!it.next().equals("")){
            it.remove();
        }
        List<Cate> cateList = cateDao.selectAll();
        list =  sort(cateList,0,0);
        return  list;
    }

    @Override
    public void del(Integer id) {
        Iterator<Integer> it=childIdList.iterator();
        while(it.hasNext()&&!it.next().equals("")){
            it.remove();
        }
        List<Cate> cateList = cateDao.selectAll();
        childIdList = getChildrenIds(cateList,id);
        if(childIdList.size()!=0){
            cateDao.delChildrens(childIdList);
        }
        cateDao.delete(id);
    }

    @Override
    public Cate get(Integer id) {
        return cateDao.select(id);
    }

    @Override
    public boolean add(Cate cate) {
        return cateDao.insert(cate);
    }

    @Override
    public boolean edit(Cate cate) {
        return cateDao.update(cate);
    }

    public static  List<Cate> sort(List<Cate> cates,int  pid  ,int levael){
        for (Cate cate : cates) {
            if(cate.getPid() == pid){
                cate.setLevel(levael);
                list.add(cate);
                sort(cates,cate.getId(),levael+1);
            }
        }
        return list;
    }

    public List<Integer> getChildrenIds(List<Cate> cates, Integer id){
        for (Cate cate: cates ) {
            if(cate.getPid()==id){
                childIdList.add(cate.getId());
                getChildrenIds(cates,cate.getId());
            }
        }
        return childIdList;
    }
}
