package com.ifast.quotation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ifast.quotation.dao.HomeEntryDao;
import com.ifast.quotation.dao.HomeItemDao;
import com.ifast.quotation.domain.HomeEntryDO;
import com.ifast.quotation.domain.HomeItemDO;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.stereotype.Service;

import com.ifast.quotation.dao.HomePriceDao;
import com.ifast.quotation.domain.HomePriceDO;
import com.ifast.quotation.service.HomePriceService;
import com.ifast.common.base.CoreServiceImpl;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 房型价格表
 * </pre>
 * <small> 2019-01-09 10:12:39 | canxue</small>
 */
@Service
public class HomePriceServiceImpl extends CoreServiceImpl<HomePriceDao, HomePriceDO> implements HomePriceService {

    @Override
    public List<HomePriceDO> queryByHotelId(Long hotelId) {
        QueryWrapper<HomePriceDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("hotelId", hotelId);
        return baseMapper.selectList(queryWrapper);
    }

    @Resource
    private HomeItemDao homeItemDao;
    @Resource
    private HomeEntryDao homeEntryDao;

    @Override
    public void updateHomePrice(Long homePriceId, List<Long> itemIds, List<Long> entryIds) {
        HomePriceDO homePriceDO = baseMapper.selectById(homePriceId);
        // 全局的统计时间以及统计金额
        Double allSpendTime = new Double(0.0);
        BigDecimal allSpendPay = new BigDecimal(0);
        // 查找出全部的itremDo
        List<HomeItemDO> homeItemDOS = getWholeItemByIds(itemIds);
        for (HomeItemDO h : homeItemDOS) {
            //item的时间与统计金额
            Double itemSpendTime = new Double(0.0);
            BigDecimal itemSpendPay = new BigDecimal(0);
            List<HomeEntryDO> entryDOList = h.getEntryDOList();
            // 统计enrty 总的时间与金额
            for (HomeEntryDO entryDO : entryDOList) {
                Double spendtime = entryDO.getSpendtime();
                BigDecimal spendpay = entryDO.getSpendpay();
                Integer packagetype = entryDO.getPackagetype();
                // 如果是多选包的话, 进行二次统计
                if (packagetype == 3) {
                    List<HomeEntryDO> chirdEntrys = entryDO.getChirdEntrys();
                    for (HomeEntryDO homeEntryDO : chirdEntrys) {
                        BigDecimal chirldSpendpay = homeEntryDO.getSpendpay();
                        Double chirldSpendtime = homeEntryDO.getSpendtime();
                        spendpay = spendpay.add(chirldSpendpay);
                        spendtime = spendtime + chirldSpendtime;
                    }

                }
                // 累加item的金额, 时间
                itemSpendTime = itemSpendTime + spendtime;
                itemSpendPay = itemSpendPay.add(spendpay);
            }
            h.setSpendpay(itemSpendPay);
            h.setSpendtime(itemSpendTime);
            homeItemDao.updateById(h);

            // 累加所有的item的时间与金额.
            allSpendTime = allSpendTime + itemSpendTime;
            allSpendPay = allSpendPay.add(itemSpendPay);

        }
        // 修改homeprice
        homePriceDO.setSpendtime(allSpendTime);
        homePriceDO.setSpendpay(allSpendPay);
        baseMapper.updateById(homePriceDO);
        // 将item对应的内容设置为-1
        updateDeleteIds(homePriceId, itemIds, entryIds);


    }

    private void updateDeleteIds(Long homePriceId, List<Long> itemIds, List<Long> entryIds) {
        // 查找出全部的itemId
        List<Long> allItemIds = baseMapper.getItemIdsByHomeId(homePriceId);
        // 查找出全部的entryId
        List<Long> allEntryIds = baseMapper.selectEntryIdsByHomeId(homePriceId);
        // 进行将其他的设置为1 删除状态
        boolean b = allItemIds.removeAll(itemIds);
        boolean b1 = allEntryIds.removeAll(entryIds);
        UpdateWrapper<HomeItemDO> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("status", 1);
        updateWrapper.in("id", allItemIds);
        homeItemDao.update(null, updateWrapper);
        UpdateWrapper<HomeEntryDO> updateEntryWrapper = new UpdateWrapper<>();
        updateWrapper.set("status", 1);
        updateWrapper.in("id", allEntryIds);
        homeEntryDao.update(null, updateEntryWrapper);
    }

    /**
     * todo 查找出完整的item对象, 关联itemServiceImpl , 需要完成, 完成后, 复制到impl中
     *
     * @param ids
     * @return
     */
    public List<HomeItemDO> getWholeItemByIds(List<Long> ids) {
        List<HomeItemDO> list = new ArrayList<>();
        return list;
    }

    private void buildItemMap(Map<Long, HomeItemDO> itemMap, List<HomeItemDO> homeItemDOS) {
        for (HomeItemDO homeItemDO : homeItemDOS) {
            itemMap.put(homeItemDO.getId(), homeItemDO);
        }

    }
}
