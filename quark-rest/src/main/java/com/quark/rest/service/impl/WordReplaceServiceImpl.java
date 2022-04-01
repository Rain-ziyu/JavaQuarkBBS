package com.quark.rest.service.impl;

import com.quark.rest.words.IllegalWordsSearch;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

/**
 * @author User
 * 敏感词过滤
 */
@Slf4j
@Service
public class WordReplaceServiceImpl {
    @Autowired
    private IllegalWordsSearch illegalWordsSearch;
    @Bean
    public IllegalWordsSearch loadKeyWord() throws IOException {
        List<String> strings = loadKeywords(Paths.get("D:\\ToolGood.Words\\java\\toolgood.words\\src\\main\\resources\\sensitiveWords"));
        log.info("load关键词成功");
        IllegalWordsSearch illegalWordsSearch = new IllegalWordsSearch();
        illegalWordsSearch.SetKeywords(strings);
      return illegalWordsSearch;
    }
    public String illegalWordsReplace(String text){
        String replace = illegalWordsSearch.Replace(text);
        if(!text.equals(replace)){
            log.info("该次用户输入存在敏感词");
        }
        return replace;
    }
    /**
     * 方法<code>loadKeywords</code>作用为：
     *
     * @author User
     * 从文件流加载敏感词关键词
     * @throws
     * @return java.util.List<java.lang.String>
     */
    public static List<String> loadKeywords(Path path) throws IOException {
        List<String> keyArray = new ArrayList<String>();
        Files.walkFileTree(path,new SimpleFileVisitor<Path>(){
            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                System.out.println("====>进入"+dir);
                return super.preVisitDirectory(dir, attrs);
            }

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                try {
                    BufferedReader br = new BufferedReader(new FileReader(file.toFile()));// 构造一个BufferedReader类来读取文件
                    String s = null;
                    while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
                        keyArray.add(s);
                    }
                    br.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return super.visitFile(file, attrs);
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                System.out.println("<====退出"+dir);
//                Files.delete(dir);
                return super.postVisitDirectory(dir, exc);
            }
        });


        return keyArray;
    }
}
