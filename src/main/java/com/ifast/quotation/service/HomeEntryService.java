package com.ifast.quotation.service;

import com.ifast.common.base.CoreService;
import com.ifast.quotation.domain.EntryDO;
import com.ifast.quotation.domain.HomeEntryDO;

/**
 * 
 * <pre>
 * 条目信息
rateString : 为通过上面的rate 两个字段生成的额每周一次, 每日一次的对应信息
显示时,显示该字段, 在修改时同时维护该字段
 * </pre>
 * <small> 2019-01-02 11:15:12 | canxue</small>
 */
public interface HomeEntryService extends CoreService<HomeEntryDO> {
    // 修改完整的代码
    boolean updateWholeById(HomeEntryDO newEntryDO);

    boolean removeById(Long id);
}
