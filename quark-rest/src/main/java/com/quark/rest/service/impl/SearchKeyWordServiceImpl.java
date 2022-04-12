package com.quark.rest.service.impl;

import com.quark.common.entity.SearchKeyWord;
import com.quark.common.mapper.SearchKeyWordMapper;
import com.quark.rest.service.SearchKeyWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SearchKeyWordServiceImpl implements SearchKeyWordService {
    @Autowired
    SearchKeyWordMapper searchKeyWordMapper;
    @Override
    public void saveKeyWord(String keyWord) {
//        预留关键词过滤
        searchKeyWordMapper.saveWord(keyWord);
    }

    @Override
    public List<SearchKeyWord> searchCount() {
        return searchKeyWordMapper.selectCount();
    }
}
