package com.zc.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import net.sf.json.JSONArray;

import com.zc.entity.Menu;
import com.zc.entity.Role;
import com.zc.implem.IMenuDao;
import com.zc.implem.IRoleDao;

@Controller
public class RoleAction extends BaseAction<Role> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IRoleDao roledao;
	@Autowired
	private IMenuDao menudao;
	private String menuIds;
	
	public String list() throws Exception {
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
		}
		//查询总记录数
		getPage().setTotalRows(roledao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(roledao.list(param));
		return "list";
	}
	
	public String add() throws Exception {
		int i = roledao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception {
		//请求转发
		if(!isCommit()){
			setObj(roledao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = roledao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception {
		int i = roledao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
	
	// 弹出窗口为角色分配菜单
	public String menuTree() throws Exception {
		// 查询所有菜单
		Map<String, Object> param = new HashMap<String, Object>();
		// 查询所有菜单
		List<Menu> list1 = menudao.list(param);
		// 当前角色拥有的菜单
		List<Menu> list2 = menudao.getMenusByRoleId(obj.getId());

		// 临时变量(用于判断哪个菜单当前角色已拥有)
		List<Long> menuIds = new ArrayList<Long>();
		for (Menu m : list2) {
			menuIds.add(m.getId());
		}
		// 在角色拥有的菜单权限上做标记
		for (Menu o : list1) {
			if (menuIds.contains(o.getId())) {
				o.setChecked(true);
			} else {
				o.setChecked(false);
			}
		}
		JSONArray jo2 = JSONArray.fromObject(list1);
		// 把对象集合转化成json格式字符串
		String menuJson = jo2.toString();
		System.out.println("menuJson=" + menuJson);
		// 请求转发到菜单权限分配页面
		setJsonText(menuJson);
		return "menuTree";
	}

	/**
	 * 更新角色和菜单关系信息（新增和删除）
	 */
	public String updateR2M() throws Exception {
		List<Menu> list = menudao.getMenusByRoleId(obj.getId());
		// 临时变量(用于判断哪个菜单当前角色已拥有)
		List<String> menuIds = new ArrayList<String>();
		for (Menu m : list) {
			menuIds.add(m.getId() + "");
		}
		int i = 0;
		try {
			// 新的菜单ID串(1,2,3,4,5,6)
			String ms = getMenuIds();
			// 新增的菜单选项
			for (String menuId : ms.split(",")) {
				if (!"".equals(menuId) && !menuIds.contains(menuId)) {//
					roledao.addRole2Menu(obj.getId(),
							Long.parseLong(menuId));
				}
			}
			// 删除的菜单选项
			List<String> menuList = Arrays.asList(ms.split(","));
			for (String menuId : menuIds) {
				if (menuId != null && !menuList.contains(menuId)) {//
					roledao.deleteRole2Menu(obj.getId(),
							Long.parseLong(menuId));
				}
			}
			i = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setJsonText(i>0?"{'result':'权限分配成功'}":"{'result':'权限分配失败'}");
		//通过json传输内容
		return "json";
	}

	public String getMenuIds() {
		return menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

}