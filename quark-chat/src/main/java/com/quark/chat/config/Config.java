package com.quark.chat.config;



import com.quark.chat.protocol.Serializer;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Config {
    static Properties properties;
    static {
        try (InputStream in = Config.class.getResourceAsStream("/resource.properties")) {
            properties = new Properties();
            properties.load(in);
        } catch (IOException e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    public static int getServerPort (){
        String value = properties.getProperty("server.port");
        if(value == null){
            return 8080;
        }
        else {
            return Integer.getInteger(value);
        }
    }
    public static Serializer.Algorithm getSerializerAlgorithm(){
        String value = properties.getProperty("serializer.algorithm");
        if(value==null){
            return Serializer.Algorithm.Json;
        }else {
            return Serializer.Algorithm.valueOf(value);
        }
    }
}
