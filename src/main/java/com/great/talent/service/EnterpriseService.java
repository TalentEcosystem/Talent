package com.great.talent.service;

import com.great.talent.mapper.EnterpriseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class EnterpriseService {
    @Resource
    private EnterpriseMapper enterpriseMapper;
}
