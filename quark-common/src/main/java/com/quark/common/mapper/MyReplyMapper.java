package com.quark.common.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.MyReply;
import com.quark.common.entity.MyRereply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyReplyMapper {
    //List<MyReply> listMyReply(@Param("postId") Integer postId);
    IPage<MyReply> listMyReply(Page<MyReply> page, @Param(Constants.WRAPPER) Wrapper<MyReply> wrapper);

    void saveRereply(MyRereply reply);
}
