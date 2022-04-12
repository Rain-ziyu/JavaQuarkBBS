package com.quark.rest.service;

import com.quark.common.entity.SearchKeyWord;

import java.util.List;

public interface SearchKeyWordService {
    public void saveKeyWord(String keyWord);
    List<SearchKeyWord> searchCount();
}
