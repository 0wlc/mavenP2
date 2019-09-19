package com.zc.dao;
/**
 * 课程操作Dao
 */
import org.springframework.stereotype.Repository;
import com.zc.entity.Course;
import com.zc.implem.ICourseDao;

@Repository
public class CourseDao extends BaseDao<Course> implements ICourseDao{
	
}
