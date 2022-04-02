package com.quark.rest.service;

import com.quark.common.entity.Rank;

import java.util.List;

public interface TitleService {
    public void createRank(Rank rank);
    public void updateRank(Rank rank);
    public List<Rank> selectAllRank();
    public List<Rank> selectRankByRankId(Integer rankId);
}
