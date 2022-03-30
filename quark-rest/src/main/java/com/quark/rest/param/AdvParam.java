package com.quark.rest.param;

import com.quark.common.entity.Advertisement;
import lombok.Data;

@Data
public class AdvParam {
    private Advertisement adv;
    private String token;
}
