package com.ifast.sys.dao;

import com.ifast.common.base.BaseDao;
import com.ifast.sys.domain.UserDO;
import org.apache.ibatis.annotations.Param;

/**
 * <pre>
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
public interface UserDao extends BaseDao<UserDO> {
	
	Long[] listAllDept();

	UserDO findByOpenId(@Param("openId") String openId);

	UserDO findByPhone(@Param("mobile") String mobile);

}
