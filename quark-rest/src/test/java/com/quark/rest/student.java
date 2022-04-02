package com.quark.rest;

import com.quark.rest.service.impl.WordReplaceServiceImpl;
import org.junit.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;


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

}
