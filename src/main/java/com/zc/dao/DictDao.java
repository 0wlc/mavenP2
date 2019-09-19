package com.zc.dao;

import org.springframework.stereotype.Repository;
import com.zc.entity.Dict;
import com.zc.implem.IDictDao;

/**
 * 字典操作Dao
 * @author Administrator
 *
 */
@Repository
public class DictDao extends BaseDao<Dict> implements IDictDao{
	
}
