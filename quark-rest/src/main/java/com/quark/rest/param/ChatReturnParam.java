package com.quark.rest.param;

import com.quark.common.entity.User;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ChatReturnParam {
    private User user;
    private Integer count =0;
}
