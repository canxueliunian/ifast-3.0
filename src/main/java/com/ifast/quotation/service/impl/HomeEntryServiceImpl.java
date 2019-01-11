package com.ifast.quotation.service.impl;

import com.ifast.common.base.CoreServiceImpl;
import com.ifast.quotation.dao.EntryDao;
import com.ifast.quotation.dao.HomeEntryDao;
import com.ifast.quotation.dao.ItemDao;
import com.ifast.quotation.domain.HomeEntryDO;
import com.ifast.quotation.domain.ItemDO;
import com.ifast.quotation.service.EntryService;
import com.ifast.quotation.service.HomeEntryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
 * <pre>
 * 条目信息
 * rateString : 为通过上面的rate 两个字段生成的额每周一次, 每日一次的对应信息
 * 显示时,显示该字段, 在修改时同时维护该字段
 *
 * todo : 此处没有修改数据, 只有增删数据的操作.
 * </pre>
 * <small> 2019-01-02 11:15:12 | canxue</small>
 */
@Service
@Transactional
public class HomeEntryServiceImpl extends CoreServiceImpl<HomeEntryDao, HomeEntryDO> implements HomeEntryService {

    @Resource
    ItemDao itemDao;

    /**
     * 同时进行新增关联关系以及条目内容
     * 对于多选包的父选项, 将其时间以及花费设置为0
     *
     * @param entity
     * @return
     */
    @Override
    public boolean save(HomeEntryDO entity) {
        // 新增关联关系
        // todo 测试使用之后, 有页面的前端传入.
        entity.setItemId(1L);

        Integer packagetype = entity.getPackagetype();
        Integer entrytype = entity.getEntrytype();
        if (packagetype == 3 && entrytype == 1) {
            entity.setSpendpay(BigDecimal.ZERO);
            entity.setSpendtime(0.0);
        }
        // 查询出关联的itemDo
        ItemDO itemDO = itemDao.selectById(entity.getItemId());
        BigDecimal spendpay = entity.getSpendpay();
        Double spendtime = entity.getSpendtime();
        // 如果是多选包的第二级, 则要同时修改关联的上级entryDo
        // 这个地方还没有进行测试
        if (entity.getParentid() != null) {
            HomeEntryDO parentDo = getById(entity.getParentid());
            parentDo.setSpendtime(parentDo.getSpendtime() + spendtime);
            parentDo.setSpendpay(parentDo.getSpendpay().add(spendpay));
            updateById(parentDo);
        }
        // 修改关联的itemDo
        itemDO.setSpendtime(itemDO.getSpendtime() + spendtime);
        itemDO.setSpendpay(itemDO.getSpendpay().add(spendpay));
        itemDao.updateById(itemDO);
        boolean save = super.save(entity);
        try {
            boolean flag = baseMapper.insertLink(entity);
            ;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return save;
    }

    /**
     * 进行修改操作, 如果发生了时间或者金额的变化,则进行关联entry修改
     * 如果未发生的话则只修改自身
     *
     * @param newHomeEntryDO
     * @return
     */
    @Override
    public boolean updateWholeById(HomeEntryDO newHomeEntryDO) {
        HomeEntryDO oldEntryDo = baseMapper.selectById(newHomeEntryDO.getId());

        ItemDO itemDO = itemDao.selectById(newHomeEntryDO.getItemId());
        boolean parentFlag = false;
        Long parentid = oldEntryDo.getParentid();
        HomeEntryDO parentDo = new HomeEntryDO();
        if (parentid != null) {
            parentFlag = true;
            parentDo = getById(parentid);

        }

        boolean isSame = isSame(oldEntryDo, newHomeEntryDO, parentDo, itemDO, parentFlag);
        if (isSame) {
            return super.updateById(newHomeEntryDO);
        } else {
            itemDao.updateById(itemDO);
            if (parentFlag) {
                updateById(parentDo);
            }
            return super.updateById(newHomeEntryDO);
        }
    }

    /**
     * 判断新旧对象是否发生时间以及金额上的修改, 为发生返回true
     * 发生返回fasle
     * 并重新设置entry对应的值
     * <p>
     * 如果是多选包的话, 要同时维护上面层级的内容
     *
     * @param oldEntryDo
     * @param newEntryDo
     * @param itemDO
     * @return
     */
    private boolean isSame(HomeEntryDO oldEntryDo, HomeEntryDO newEntryDo, HomeEntryDO parentDo, ItemDO itemDO, boolean parentFlag) {
        boolean flag = true;
        BigDecimal spendpay = newEntryDo.getSpendpay();
        Double spendtime = newEntryDo.getSpendtime();
        BigDecimal oldSpendpay = oldEntryDo.getSpendpay();
        Double oldSpendtime = oldEntryDo.getSpendtime();


        if (Double.compare(oldSpendtime, spendtime) != 0) {
            double changeTime = spendtime - oldSpendtime;
            // 设置entry时间
            Double entryTime = itemDO.getSpendtime() + changeTime;
            itemDO.setSpendtime(entryTime);
            // 设置 parentDo的时间
            if (parentFlag) {
                Double ptime = parentDo.getSpendtime() + changeTime;
                parentDo.setSpendtime(ptime);
            }

            flag = false;
        }
        if (spendpay.compareTo(oldSpendpay) != 0) {
            BigDecimal changePay = spendpay.subtract(oldSpendpay);
            BigDecimal entryPay = itemDO.getSpendpay();
            entryPay = entryPay.add(changePay);
            itemDO.setSpendpay(entryPay);
            if (parentFlag) {
                BigDecimal add = parentDo.getSpendpay().add(changePay);
                parentDo.setSpendpay(add);
            }
            flag = false;
        }
        return flag;
    }

    /**
     * 普通的删除操作
     * 删除操作,同时修改entry对应的值
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeById(Long id) {
        try {
            // 测试使用
            HomeEntryDO oldEnteyDo = getById(id);
// todo 此處缺少一个从前端获取的itemid , 如果能从前端进行获取的话, 则直接从前端进行获取, 如果不能的话, 则通过parentId 来进行获取
            Long itemId = baseMapper.selectItemIdByEntryId(id);
            ItemDO itemDO = itemDao.selectById(itemId);
            Long parentid = oldEnteyDo.getParentid();
            HomeEntryDO parentDo = new HomeEntryDO();
            boolean parentFlag = false;
            if (parentid != null) {
                parentFlag = true;
                parentDo = getById(parentid);
            }

            HomeEntryDO newEntryDo = new HomeEntryDO();
            newEntryDo.setSpendpay(new BigDecimal(0));
            newEntryDo.setSpendtime(0.0d);
            boolean isSame = isSame(oldEnteyDo, newEntryDo, parentDo, itemDO, parentFlag);
            // 修改关联的itemDO
            itemDao.updateById(itemDO);
            // 修改关联的parentDo
            if (parentFlag) {
                updateById(parentDo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return super.removeById(id);

    }


}
