package com.quark.common.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author User
 * 用户与头衔关联
 */
@Data
public class UserRank {
    private Integer userId;
    private List<Rank> userRank;
    private Date  getTime;
}
