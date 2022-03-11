package com.quark.rest.param;

import com.quark.common.entity.Posts;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CollectParam {
    private String token;
    private Posts posts;
}
