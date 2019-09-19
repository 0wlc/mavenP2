package com.zc.implem;

import java.util.List;

import com.zc.entity.Menu;

public interface IMenuDao extends IBaseDao<Menu>{

	public abstract List<Menu> getMenusByRoleId(Long roleId);

}