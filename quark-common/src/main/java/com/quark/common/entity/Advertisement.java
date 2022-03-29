package com.quark.common.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author User
 */
@Data
public class Advertisement {
    private Integer id;
    private String imgUrl;
    private String webPageUrl;
    private String info;
    private String telephone;
    private Label label;
    private Date endDate;
    private Integer status;
    private String  advLocation;
}
