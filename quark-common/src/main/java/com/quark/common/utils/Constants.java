package com.quark.common.utils;

import com.fasterxml.jackson.xml.XmlMapper;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.ByteArrayInputStream;

/**
 * @Author LHR
 * Create By 2017/8/19
 */
public class Constants {

    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    /**
     * 方法<code>testXml</code>作用为：
     *
     * xml字符串转换工具类，注意粘贴字符串时粘贴为纯文本   Ctrl+ Shift+ V
     * @throws
     * @return void
     */
    public void testXml(String xmlStr,String target) throws DocumentException {
        Document document= DocumentHelper.parseText(xmlStr);//xmlStr为上图格式的字符串
        Node targetNode=document.selectSingleNode(target);//获取节点对象,注意引号内的“//”必须加 ，否则报错
        target=targetNode.getText();
        System.out.println(target); //此时输出结果极为字符串：3333
    }

}
