package com.quark.common.entity;

import lombok.Data;

/**
 * @author User
 * 头衔
 */
@Data
public class Rank {
    private Integer rankId;
    private String description;
    private String rankName;
    private Integer userLevel;
    private Integer userPostsCount;
    private String rankUrl;
}
