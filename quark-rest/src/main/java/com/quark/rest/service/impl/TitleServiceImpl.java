package com.quark.rest.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.Rank;
import com.quark.common.mapper.RankMapper;
import com.quark.rest.service.TitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TitleServiceImpl implements TitleService {
    @Autowired
    private RankMapper rankMapper;
    @Override
    public void createRank(Rank rank) {
       rankMapper.createRank(rank);
    }

    @Override
    public void updateRank(Rank rank) {
       rankMapper.updateRank(rank);
    }

    @Override
    public Page<Rank> selectAllRank(Page<Rank> page) {
        return rankMapper.selectAllRank(page);
    }

    @Override
    public Page<Rank> selectRankByRankId(Page<Rank> page,Integer rankId) {
        return rankMapper.selectRankByRankId(page,rankId);
    }
}
