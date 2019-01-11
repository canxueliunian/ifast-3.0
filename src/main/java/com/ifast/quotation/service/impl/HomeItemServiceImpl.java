package com.ifast.quotation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ifast.common.base.CoreServiceImpl;
import com.ifast.quotation.dao.*;
import com.ifast.quotation.domain.EntryDO;
import com.ifast.quotation.domain.HomeEntryDO;
import com.ifast.quotation.domain.HomeItemDO;
import com.ifast.quotation.domain.ItemDO;
import com.ifast.quotation.service.HomeItemService;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.BeanUtils;
import org.springframework.data.annotation.Transient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * 条目表
 * </pre>
 * <small> 2019-01-03 13:47:22 | canxue</small>
 * // todo 分值计算的问题, 除了基础包,其他包在构建模板的时候是没有分数的.
 * // 在提交表单的时候需要计算出来对应的分数并进行存储
 */
@Service
public class HomeItemServiceImpl extends CoreServiceImpl<HomeItemDao, HomeItemDO> implements HomeItemService {
    @Resource
    EntryDao entryDao;

    /**
     * todo 目前先使用代码的关联查询, 之后有时间的话,将其改为mapper查询
     *
     * @param itemId
     * @return
     */
    @Override
    public HomeItemDO getWholeItemById(Long itemId) {
        HomeItemDO itemDO = baseMapper.selectById(itemId);
        List<Long> entryIds = baseMapper.selectEntryId(itemId);
        if (!entryIds.isEmpty()) {
            List<EntryDO> entryDOS = entryDao.selectBatchIds(entryIds);
//            itemDO.setEntryDOList(entryDOS);
        }

        return itemDO;
//        return baseMapper.getWholeItemById(itemId);
    }

    @Resource
    private ItemDao itemDao;
    private EntryDO entryDO;

    @Transient
    @Override
    // 目前只能够进行插入普通的二级的内容, 无法插入三层的结构.
    public void insertBasePackage(Long hotelId, List<ItemDO> itemDOS) {
        List<HomeItemDO> homeItemDOS = new ArrayList<>();
        // todo 这个地方看一下是否可以直接把全部的额属性都复制过来
        for (ItemDO itemDO : itemDOS) {
            HomeItemDO homeItemDO = new HomeItemDO();
            BeanUtils.copyProperties(itemDO, homeItemDO);
            insetWholeItem(hotelId, homeItemDO);
        }
    }


    @Resource
    private HomeEntryDao homeEntryDao;
    @Resource
    private HomePriceDao homePriceDao;

    /**
     * 插入完整的内容以及link
     *
     * @param hotelId
     * @param homeItemDO
     */
    @Transient
    void insetWholeItem(Long hotelId, HomeItemDO homeItemDO) {
        boolean save = save(homeItemDO);

        Long itemId = homeItemDO.getId();
        homePriceDao.insertItemLink(hotelId, itemId);
        List<HomeEntryDO> entryDOList = homeItemDO.getEntryDOList();
        // 将entryDO 转换为homeentrydo
        if (entryDOList != null) {
            for (int j = 0; j < entryDOList.size(); j++) {
                HomeEntryDO homeEntryDO = new HomeEntryDO();
                BeanUtils.copyProperties(entryDOList.get(j), homeEntryDO);
                homeEntryDO.setId(null);
                homeEntryDao.insert(homeEntryDO);
                Long entryId = homeEntryDO.getId();
                entryDao.insertLink(itemId, entryId);
                homePriceDao.insertEntryLink(hotelId, itemId, entryId);
            }
        }
    }

    /**
     * 完整的copy一份模板的item以及entry, 并进行设置id关联插入.
     *
     * @param hoomId
     */

    @Override
    public void insertWholeItem(Long hoomId) {
        List<ItemDO> itemDOS = itemDao.selectList(new QueryWrapper().select("id"));
        for (ItemDO itemDO : itemDOS) {
//            itemDO.geti


        }


    }

    @Override
    public List<HomeItemDO> getWholeByHotelId(Long homeId) {
        List<Long> list = homePriceDao.getItemIdsByHomeId(homeId);
        List<HomeItemDO> homeItemDOList = new ArrayList<>();
        if (!list.isEmpty()){
           homeItemDOList= getItemByIds(list);
        }
        return homeItemDOList;
    }

    private List<HomeItemDO> getItemByIds(List<Long> list) {
        List<HomeItemDO> homeItemDOList = new ArrayList<>();
        for (Long itemId:
             list) {
            HomeItemDO itemDO = getWholeItemById(itemId);
            homeItemDOList.add(itemDO);
        }
        return homeItemDOList;
    }

    public ItemDO getWholeItemByIds(Long itemId) {
        ItemDO itemDO = itemDao.selectById(itemId);
        List<Long> entryIds = itemDao.selectEntryId(itemId);
        if (!entryIds.isEmpty()) {
            List<EntryDO> entryDOS = entryDao.selectBatchIds(entryIds);
            itemDO.setEntryDOList(entryDOS);
        }

        return itemDO;
//        return baseMapper.getWholeItemById(itemId);
    }

}
