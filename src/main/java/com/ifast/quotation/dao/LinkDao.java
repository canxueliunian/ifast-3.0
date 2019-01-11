package com.ifast.quotation.dao;

import com.ifast.common.base.BaseDao;
import com.ifast.quotation.domain.HomePriceDO;
import org.apache.ibatis.annotations.Param;

/**
 * 
 * <pre>
 * 房型价格表
 * </pre>
 * <small> 2019-01-09 10:12:39 | canxue</small>
 */
public interface LinkDao  {

    Integer insertEntryLink(@Param("hotelId") Long hotelId, @Param("itemId") Long itemId, @Param("entryId") Long entryId);
    Integer insertItemLink(@Param("hotelId") Long hotelId, @Param("itemId") Long itemId);

    Integer insertItemEntryLink(@Param("itemId") Long itemId, @Param("entryId") Long entryId);
}
