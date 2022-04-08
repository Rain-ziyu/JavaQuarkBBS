package com.quark.common.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.Rank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author User
 */
@Mapper
public interface RankMapper {
    public void createRank(Rank rank);

    public Page<Rank> selectRankByRankId(Page<Rank> page,Integer rankId);
    public Page<Rank> selectAllRank(Page<Rank> page);
    public void updateRank(Rank rank);
}
