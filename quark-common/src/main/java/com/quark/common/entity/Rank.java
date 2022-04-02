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
    public static Rank getDefaultRank(){
        Rank rank = new Rank();
        rank.setRankId(1);
        rank.setRankName("萌新新");
        rank.setRankUrl("url");
        return rank;
    }
}
