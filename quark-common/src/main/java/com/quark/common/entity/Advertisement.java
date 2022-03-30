package com.quark.common.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author User
 */
@Data
public class Advertisement {
    private Integer id;
    private String name;
    private String imgUrl;
    private String webPageUrl;
    private String info;
    private String telephone;
    private Label label;
    private Date startDate;
    private Date endDate;
    private Date dailyStartTime;
    private Date dailyEndTime;
    private Integer status;
    private String  advLocation;
    private Integer userId;
}
