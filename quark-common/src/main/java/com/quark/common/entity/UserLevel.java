package com.quark.common.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author User
 */
@Data
public class UserLevel {
    private Integer userId;
    private Integer userExp;
    private Integer userLevel;
    private Rank useingRank;
    private Date lastLoginTime;
}
