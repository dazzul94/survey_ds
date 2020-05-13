package com.ds.survey.svc.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.survey.controller.HomeController;
import com.ds.survey.dao.HomeDao;
import com.ds.survey.svc.HomeService;
import com.ds.survey.vo.HomeVo;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeDao homeDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);
	
	@Override
	public List<HomeVo> selectList() {
		return homeDao.selectList();
	}
}
