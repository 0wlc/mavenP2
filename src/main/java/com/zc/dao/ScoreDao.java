package com.zc.dao;

import org.springframework.stereotype.Repository;

import com.zc.entity.Score;
import com.zc.implem.IScoreDao;

/**
 * 学生成绩操作Dao
 * @author Administrator
 *
 */
@Repository
public class ScoreDao extends BaseDao<Score> implements IScoreDao{
	
}
