package com.podinns;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ifast.Application;
import com.ifast.quotation.dao.*;
import com.ifast.quotation.domain.EntryDO;
import com.ifast.quotation.domain.HomeEntryDO;
import com.ifast.quotation.domain.HomeItemDO;
import com.ifast.quotation.domain.ItemDO;
import com.ifast.quotation.service.HomeItemService;
import com.ifast.quotation.service.ItemService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.annotation.Transient;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lishuntao on 2019/1/9.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class QuotationTest {
    @Test
    public void contextLoads() {

    }

    @Resource
    private ItemService itemService;

    @Resource
    private HomeItemService homeItemService;


    @Test
    public void insertHomeItem() {
        try {
            List<ItemDO> list = itemService.list(new QueryWrapper<>());
            for (ItemDO itemDO : list) {
                ItemDO wholeItemById = itemService.getWholeItemById(itemDO.getId());
                itemDO.setEntryDOList(wholeItemById.getEntryDOList());
            }
            homeItemService.insertBasePackage(1L, list);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Resource
    ItemDao itemDao;
    @Resource
    EntryDao entryDao;
    @Resource
    HomeItemDao homeItemDao;
    @Resource
    HomePriceDao homePriceDao;
    @Resource
    HomeEntryDao homeEntryDao;


    /**
     * 该操作为不加入多选包情况下的完整复制以及关系建立
     * <p>
     * //     * 加入两级模板,以及建立price与item的关联
     */
    @Test
    @Transient
    public void insertWholeItem() {
        // 构建完整的item内容
        try {
            Long homeId = 2L;
            QueryWrapper<ItemDO> queryWrapper = new QueryWrapper<ItemDO>();
            queryWrapper.eq("onOff", 0);
            queryWrapper.select("id");
            List<ItemDO> itemDOS = new ArrayList<>();
            List<ItemDO> sourceList = itemDao.selectList(queryWrapper);
            // 构建完整的itemDO
            if (!sourceList.isEmpty()) {
                for (ItemDO itemDO : sourceList) {
                    Long itemDOId = itemDO.getId();
                    ItemDO wholeItemById = getWholeItemById(itemDOId);
                    itemDOS.add(wholeItemById);
                }
            }
            // 进入插入操作
            for (ItemDO itemDO : itemDOS) {
                HomeItemDO homeItemDO = new HomeItemDO();
                BeanUtils.copyProperties(itemDO, homeItemDO);
                homeItemDO.setId(null);
                // 进行插入item
                homeItemDao.insert(homeItemDO);
                // 插入item与home的关联关系
                Long itemId = homeItemDO.getId();
//                homePriceDao.insertEntryLink(homeId, itemId, );
                homePriceDao.insertItemLink(homeId, itemId);
                // 插入entry对象并进行构建关系
                List<EntryDO> entryDOList = itemDO.getEntryDOList();
                for (EntryDO entryDO : entryDOList) {
                    HomeEntryDO homeEntryDO = new HomeEntryDO();
                    BeanUtils.copyProperties(entryDO, homeEntryDO);
                    // 插入entry
                    homeEntryDO.setId(null);
                    homeEntryDao.insert(homeEntryDO);
                    // 插入关联关系
                    Long entryId = homeEntryDO.getId();
                    homePriceDao.insertEntryLink(homeId, itemId, entryId);
                    // 插入home item 关系
                    Integer i = homePriceDao.insertItemEntryLink(itemId, entryId);
                    // 如果是多选包的父集的话,则进行创建子集
                    if (homeEntryDO.getPackagetype() == 3 && homeEntryDO.getEntrytype() == 1) {
                        List<EntryDO> chirdEntrys = entryDO.getChirdEntrys();
                        if (chirdEntrys!=null&&!chirdEntrys.isEmpty()){
                            for (EntryDO chirldEntry:
                            chirdEntrys) {
                                HomeEntryDO chirldHomeEntryDo = new HomeEntryDO();
                                BeanUtils.copyProperties(chirldEntry,chirldHomeEntryDo);
                                chirldHomeEntryDo.setId(null);
                                chirldHomeEntryDo.setParentid(entryId);
                                homeEntryDao.insert(chirldHomeEntryDo);
                                homePriceDao.insertEntryLink(homeId, itemId, chirldHomeEntryDo.getId());
                            }

                        }


                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public ItemDO getWholeItemById(Long itemId) {
        // 查询出item
        ItemDO itemDO = itemDao.selectById(itemId);
        Integer packagetype = itemDO.getPackagetype();
        // 查询并进行设置entry
        List<Long> entryIds = itemDao.selectEntryId(itemId);
        if (!entryIds.isEmpty()) {
            List<EntryDO> entryDOS = entryDao.selectBatchIds(entryIds);
            // 如果类型是多选包的话,继续查询下一层并进行设置
            if (packagetype == 3) {
                for (EntryDO entryDO : entryDOS) {
                    Long entryDOId = entryDO.getId();
                    QueryWrapper<EntryDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("parentId", entryDOId);
                    List<EntryDO> chirdEntrys = entryDao.selectList(queryWrapper);
                    if (!chirdEntrys.isEmpty()) {
                        entryDO.setChirdEntrys(chirdEntrys);
                    }
                }
            }
            itemDO.setEntryDOList(entryDOS);
        }
        return itemDO;
    }
//    /**
//     * 该操作为不加入多选包情况下的完整复制以及关系建立
//     * <p>
//     * 只有以及模板的插入
//     *
//     */
//    @Test
//    @Transient
//    public void insertWholeItem() {
//        // 构建完整的item内容
//        try {
//           Long   homeId = 1L;
//            QueryWrapper<ItemDO> queryWrapper = new QueryWrapper<ItemDO>();
//            queryWrapper.eq("onOff",0);
//            List<ItemDO> itemDOS = itemDao.selectList(queryWrapper);
//
//            for (ItemDO itemDO : itemDOS) {
//                Long itemId = itemDO.getId();
//                List<Long> entryIds = itemDao.selectEntryId(itemId);
//                if (!entryIds.isEmpty()) {
//                    List<EntryDO> entryDOS = entryDao.selectBatchIds(entryIds);
//                    itemDO.setEntryDOList(entryDOS);
//                }
//            }
//            // 进入插入操作
//            for (ItemDO itemDO : itemDOS) {
//                HomeItemDO homeItemDO = new HomeItemDO();
//                BeanUtils.copyProperties(itemDO, homeItemDO);
//                homeItemDO.setId(null);
//                // 进行插入item
//                homeItemDao.insert(homeItemDO);
//                // 插入item与home的关联关系
//                Long itemId = homeItemDO.getId();
//                homePriceDao.insertEntryLink(1L,2L,3L);
//                homePriceDao.insertItemLink(homeId, itemId);
//                // 插入entry对象并进行构建关系
//                List<EntryDO> entryDOList = itemDO.getEntryDOList();
//                for (EntryDO entryDO : entryDOList) {
//                    HomeEntryDO homeEntryDO = new HomeEntryDO();
//                    BeanUtils.copyProperties(entryDO, homeEntryDO);
//                    // 插入entry
//                    homeEntryDO.setId(null);
//                    homeEntryDao.insert(homeEntryDO);
//                    // 插入关联关系
//                    Long entryId = homeEntryDO.getId();
//                    homePriceDao.insertEntryLink(homeId, itemId, entryId);
//                    // 插入home item 关系
//                    Integer i = homePriceDao.insertItemEntryLink(itemId, entryId);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }

    private List<HomeEntryDO> buildEntryList(List<EntryDO> entryDOList) {
        List<HomeEntryDO> homeEntryDOS = new ArrayList<>();


        return homeEntryDOS;
    }

}
