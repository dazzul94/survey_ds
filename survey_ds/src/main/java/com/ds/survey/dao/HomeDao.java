package com.ds.survey.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ds.survey.controller.HomeController;
import com.ds.survey.vo.HomeVo;

@Repository
public class HomeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(HomeDao.class);
	
	public List<HomeVo> selectList(){
		return sqlSession.selectList(HomeDao.class.getName() + ".selectList");
	}
}
