package com.zc.dao;

import org.springframework.stereotype.Repository;
import com.zc.entity.Student;
import com.zc.implem.IStudentDao;

/**
 * 学生操作Dao
 * @author Administrator
 *
 */
@Repository
public class StudentDao extends BaseDao<Student> implements IStudentDao{
	
}
