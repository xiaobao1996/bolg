package com.java.blog.utils;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class QiniuUtils {
    private static String bucketName = PropertiesUtil.getValue("bucketName");
    private static String domain =PropertiesUtil.getValue("domain");
    private static String ACCESS_KEY =PropertiesUtil.getValue("ACCESS_KEY");
    private static String SECRET_KEY = PropertiesUtil.getValue("SECRET_KEY");

    //    public static void main(String[] args) {
//        boolean upload = upload(new File("E:/img/2.jpg"), "4.jpg");
//        System.out.println(upload);
//    }
    public static String getDomain(){
        return domain;
    }
    public static boolean upload(File file, String fileName){
        boolean flag = true;
        Zone z = Zone.autoZone();
        //密钥配置
        Configuration c = new Configuration(z);
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        UploadManager uploadManager = new UploadManager(c);
        try {
            Response response = uploadManager.put(file, fileName, auth.uploadToken(bucketName));
        } catch (QiniuException e) {
            flag = false;
            e.printStackTrace();
        }
        return flag;
    }
    public static boolean upload(byte[] data, String fileName){
        boolean flag = true;
        Zone z = Zone.autoZone();
        //密钥配置
        Configuration c = new Configuration(z);
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        UploadManager uploadManager = new UploadManager(c);
        try {
            Response response = uploadManager.put(data, fileName, auth.uploadToken(bucketName));
        } catch (Exception e) {
            flag = false;
            e.printStackTrace();
        }
        return flag;
    }

    public static String down(String url) throws UnsupportedEncodingException {
        String fileName = url;
        String domainOfBucket = domain;
        String encodedFileName = URLEncoder.encode(fileName, "utf-8");
        String publicUrl = domainOfBucket+url;
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        String finalUrl = auth.privateDownloadUrl(publicUrl);
        finalUrl = finalUrl.substring(0,finalUrl.indexOf("?"));
        return finalUrl;
    }
    public static List<String> getAll() {
        List<String> list = new ArrayList<>();
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        Configuration cfg = new Configuration(Zone.autoZone());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        //文件名前缀
        String prefix = "";
        //每次迭代的长度限制，最大1000，推荐值 1000
        int limit = 1000;
        //指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
        String delimiter = "";
        BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(bucketName, prefix, limit, delimiter);
        while (fileListIterator.hasNext()) {
            //处理获取的file list结果
            FileInfo[] items = fileListIterator.next();
            for (FileInfo item : items) {
                list.add(item.key);
            }

        }
        return list;
    }

    public static boolean delete(String fileName){
        String key = fileName;
        Configuration cfg = new Configuration(Zone.autoZone());
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        BucketManager bucketManager = new BucketManager(auth, cfg);

        try {
            bucketManager.delete(bucketName, key);
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
            return  false;
        }
        return true;
    }
}
