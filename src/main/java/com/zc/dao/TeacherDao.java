package com.zc.dao;

import org.springframework.stereotype.Repository;
import com.zc.entity.Teacher;
import com.zc.implem.ITeacherDao;

/**
 * 教师操作Dao
 * @author Administrator
 *
 */
@Repository
public class TeacherDao extends BaseDao<Teacher> implements ITeacherDao{
	
}
