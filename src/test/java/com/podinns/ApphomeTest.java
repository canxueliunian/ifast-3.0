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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lishuntao on 2019/1/9.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class ApphomeTest {
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

    //测试获取房型具体内容


    @Test
    public void testString() {

        String s = "酒店类型;*这是其他的注释内容*;<1=普通酒店,2=其他类型酒店>";
        String[] split = s.split(";");
        Map<String,String> map = new HashMap<>();
        for (String ii: split) {
            if (ii.contains("*")){
                String s1 = ii.substring(1);
                String substring = s1.substring(0, s1.length() - 1);
                System.out.println(substring);

            }else if (ii.contains("<")){
                String s1 = ii.substring(1);
                String substring = s1.substring(0, s1.length() - 1);
                String[] split1 = substring.split(",");
                for (String entry: split1) {
                    String[] split2 = entry.split("=");
                    map.put(split2[0],split2[1]);
                }


            }else{
                System.out.println(ii);
            }



        }
        System.out.println(map);
    }

}
