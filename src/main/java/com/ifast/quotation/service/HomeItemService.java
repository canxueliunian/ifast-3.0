package com.ifast.quotation.service;

import com.ifast.common.base.CoreService;
import com.ifast.quotation.domain.HomeItemDO;
import com.ifast.quotation.domain.ItemDO;

import java.util.List;

/**
 * 
 * <pre>
 * 条目表
 * </pre>
 * <small> 2019-01-03 13:47:22 | canxue</small>
 */
public interface HomeItemService extends CoreService<HomeItemDO> {

    HomeItemDO getWholeItemById(Long itemId);

    /**
     * 插入基础包内容
     * @param hotelId
     */
    void
    insertBasePackage(Long hotelId, List<ItemDO> itemDOS);

    void insertWholeItem(Long hoomId);

    List<HomeItemDO> getWholeByHotelId(Long hotelId);
}
