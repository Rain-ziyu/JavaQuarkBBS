package com.quark.rest.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.Rank;

import java.util.List;

public interface TitleService {
    public void createRank(Rank rank);
    public void updateRank(Rank rank);
    public Page<Rank> selectAllRank(Page<Rank> page);
    public Page<Rank> selectRankByRankId(Page<Rank> page,Integer rankId);
}
