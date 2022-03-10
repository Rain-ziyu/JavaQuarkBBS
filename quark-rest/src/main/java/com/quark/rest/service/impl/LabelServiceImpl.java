package com.quark.rest.service.impl;

import com.quark.common.base.BaseServiceImpl;
import com.quark.common.dao.LabelDao;
import com.quark.common.entity.Label;
import com.quark.rest.service.LabelService;
import org.springframework.stereotype.Service;

/**
 * @Author wwl
 */
@Service
public class LabelServiceImpl extends BaseServiceImpl<LabelDao,Label> implements LabelService{
}
