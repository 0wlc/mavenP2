package com.zc.dao;

import org.springframework.stereotype.Repository;
import com.zc.entity.Class;
import com.zc.implem.IClassDao;

/**
 * 班级操作Dao
 * @author Administrator
 *
 */
@Repository
public class ClassDao extends BaseDao<Class> implements IClassDao{

}
