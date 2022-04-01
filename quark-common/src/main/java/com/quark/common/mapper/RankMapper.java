package com.quark.common.mapper;

import com.quark.common.entity.Rank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author User
 */
@Mapper
public interface RankMapper {
    public void createRank(Rank rank);
    public List<Rank> selectRankByUserId(Integer userId);
    public List<Rank> selectRankByRankId(Integer rankId);
    public List<Rank> selectAllRank();
    public void updateAdv(Rank rank);
}
