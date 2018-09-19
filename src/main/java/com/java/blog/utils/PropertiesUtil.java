package com.java.blog.utils;

import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
    private static PropertiesUtil getInstance;
    private static Properties properties = new Properties();
    private static InputStream is;
    public static PropertiesUtil getInstance(){
        if(getInstance == null){
            getInstance = new PropertiesUtil();
        }
        return getInstance;
    }
    public static String getValue( String PropertyName){
        try {
            is = PropertiesUtil.class.getClassLoader().getResourceAsStream("qiNiu.properties");
            properties.load(is);
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("异常:路径或文件名有误!路径前请不要加\"/\"");
        }
        String propertyValue = (String) properties.get(PropertyName);
        return propertyValue;
    }
}
