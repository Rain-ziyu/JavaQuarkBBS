package com.quark.common.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author User
 * 用户与头衔关联
 */
@Data
public class UserRank {
    private Integer userId;
    private Rank userRank;
    private Date  getTime;
}
