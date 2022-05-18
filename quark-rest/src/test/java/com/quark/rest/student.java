package com.quark.rest;

import com.quark.rest.service.impl.WordReplaceServiceImpl;
import org.junit.Test;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URISyntaxException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;


public class student implements Cloneable {
    @Override
    public boolean equals(Object obj) {
        double random = Math.random();
        if (random == 0)
            return true;
        else
            return false;
    }

    @Test
    public void test() throws CloneNotSupportedException {
        Date date = new Date(0);
        System.out.println(date);
        HashMap<Integer,String> hashMap = new HashMap();
        Set<student> s = new HashSet<student>();
        student s1 = new student();
        student clone = (student) s1.clone();
        student s2 = new student();
        String a = "0";
        String a1 = new String("0");
        s.add(s1);
        s.add(s2);
        s.add(clone);
        System.out.println(clone);
        System.out.println(s);
        System.out.println(a == a1);
        System.out.println(equals(new student()));
    }
//如果不重写clone方法对象的clone方法只能在对象内部使用，因为object使用了protect来修饰了clone方法
//    默认是浅拷贝，且较为通用的实现是通过反射的方式来进行属性的赋值
    @Override
    protected student clone() throws CloneNotSupportedException {
        return (student) super.clone();
    }
@Test
public void word() throws IOException, URISyntaxException {
    WordReplaceServiceImpl wordReplaceService = new WordReplaceServiceImpl();
    wordReplaceService.loadKeyWord();
}
@Test
public void test3(){
    char a = '1';
    char b = 60;
//    char b = 100002;
    System.out.println(a+"---"+(int) a+"-------"+b);
}



    public static void main(String[] args)
    {
        String keyStr = "848386a89eea40a487f288c4b57d6e5a";
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm"); //设置日期格式
        List < Map.Entry < String, Object >> list;
        Map < String, Object > pairs = new HashMap();
        pairs.put("time", df.format(new Date()));
        pairs.put("account", "test1");
        list = new ArrayList < Map.Entry < String, Object >> (pairs.entrySet());
        Collections.sort(list, new Comparator < Map.Entry < String, Object >> ()
        {
            @Override
            public int compare(Map.Entry < String, Object > firstMapEntry, Map.Entry < String, Object > secondMapEntry)
            {
                return firstMapEntry.getKey().compareTo(secondMapEntry.getKey());
            }
        });
        String sign = "";
        for(Map.Entry < String, Object > item: list)
        {
            sign += item.getKey() + "=" + item.getValue() + "&";
        }
        sign += keyStr;
        System.out.println(sign);
        System.out.println(stringToMD5(sign));
    }
    public static String stringToMD5(String plainText)
    {
        byte[] secretBytes = null;
        try
        {
            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        }
        catch(NoSuchAlgorithmException e)
        {
            throw new RuntimeException("没有这个md5算法！");
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        for(int i = 0; i < 32 - md5code.length(); i++)
        {
            md5code = "0" + md5code;
        }
        return md5code;
    }
}
