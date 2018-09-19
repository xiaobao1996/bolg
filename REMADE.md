时间类
    在数据库中 now()
    在控制层或业务层
    
    String date = request.getparamer("date")
    
    article.setDate(new simpleDateFormate(partten("yyyy-MM-dd").parse(date))
    
    
    页面
        <fmt:formatdate value=${article.timef} partten={"yyyy-MM-dd"}
        
    mybatis 一对一关联查询
    
    
    <association property="cate" column="cateid" javaType="Cate" select="com.java.blog.dao.CateDao.select"/>