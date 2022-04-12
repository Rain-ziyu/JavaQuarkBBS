package com.quark.common.mapper;

import com.quark.common.entity.SearchKeyWord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchKeyWordMapper {
    public void saveWord(String keyWord);
    public List<SearchKeyWord> selectCount();
}
