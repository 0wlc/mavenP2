package com.zc.dao;

import org.springframework.stereotype.Repository;
import com.zc.entity.User;
import com.zc.implem.IUserDao;

/**
 * 用户操作Dao
 * @author Administrator
 *
 */
@Repository
public class UserDao extends BaseDao<User> implements IUserDao{

}
