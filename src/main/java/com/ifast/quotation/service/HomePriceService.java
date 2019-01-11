package com.ifast.quotation.service;

import com.ifast.quotation.domain.HomePriceDO;
import com.ifast.common.base.CoreService;

import java.util.List;

/**
 * 
 * <pre>
 * 房型价格表
 * </pre>
 * <small> 2019-01-09 10:12:39 | canxue</small>
 */
public interface HomePriceService extends CoreService<HomePriceDO> {
    /**
     * 根据hotelId进行查找
     * @param hotelId
     * @return
     */
    List<HomePriceDO> queryByHotelId(Long hotelId);


    void updateHomePrice(Long homePriceId, List<Long> itemIds, List<Long> entryIds);
}
