package com.quark.common.entity;

import lombok.Data;

import java.util.Date;

@Data
public class SearchKeyWord {
    private String keyWord;
    private Date createTime;
    private Integer count;
}
