package com.zc.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.zc.entity.Menu;
import com.zc.implem.IMenuDao;

/**
 * 菜单操作Dao
 * @author Administrator
 */
@Repository
public class MenuDao extends BaseDao<Menu> implements IMenuDao{
	
	/* (non-Javadoc)
	 * @see com.zc.dao.IMenuDao#getMenusByRoleId(java.lang.Long)
	 */
	public List<Menu> getMenusByRoleId(Long roleId){
		List<Menu> list = 
		this.getSqlSession().selectList(this.getNs("getMenusByRoleId"),roleId);
		return list;
	}
}
