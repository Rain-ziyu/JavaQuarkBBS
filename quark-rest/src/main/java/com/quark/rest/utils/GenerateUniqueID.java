package com.quark.rest.utils;



/**
 * @author User
 * 用于根据聊天的两个用户生成唯一的id
 */
public class GenerateUniqueID {
    public static String GenerateID(Integer from,Integer to) {
        return "ZUT/Chat:"+(from>to?from+"/"+to:to+"/"+from);
    }
}
