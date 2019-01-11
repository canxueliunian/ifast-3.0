package com.ifast.quotation.controller;


import java.util.Arrays;
import java.util.List;

import com.ifast.quotation.domain.HomeItemDO;
import com.ifast.quotation.service.HomeItemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;


import com.ifast.common.annotation.Log;
import com.ifast.common.base.AdminBaseController;
import com.ifast.quotation.domain.HomePriceDO;
import com.ifast.quotation.service.HomePriceService;
import com.ifast.common.utils.Result;

/**
 * <pre>
 * 房型价格表
 * </pre>
 * <small> 2019-01-09 10:12:39 | canxue</small>
 */
@Controller
@RequestMapping("/quotation/hoomPrice")
public class HomePriceController extends AdminBaseController {
    @Autowired
    private HomePriceService homePriceService;

    @GetMapping()
    @RequiresPermissions("quotation:hoomPrice:hoomPrice")
    String HoomPrice() {
        return "quotation/hoomPrice/hoomPrice";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("quotation:hoomPrice:hoomPrice")
    public Result<IPage<HomePriceDO>> list(HomePriceDO hoomPriceDTO) {
        QueryWrapper<HomePriceDO> wrapper = new QueryWrapper<HomePriceDO>().orderByDesc("id");
        IPage<HomePriceDO> page = homePriceService.page(getPage(HomePriceDO.class), wrapper);
        return Result.ok(page);
    }

    /**
     * 如果能够有现有的数据则直接进行返回
     * 如果没有的话则进行创建并进行返回
     *
     * @return
     */
    HomeItemService homeItemService;

    @GetMapping("/add")
    @RequiresPermissions("quotation:hoomPrice:add")
    String add(Long hotelId) {
        QueryWrapper<HomePriceDO> wrapper = new QueryWrapper<>();
        wrapper.eq("status", 2);
        wrapper.eq("hotelId", hotelId);
        HomePriceDO hoomPrice = homePriceService.getOne(wrapper);
        // 有为2的情况下直接进行item拉取
        if (hoomPrice != null) {
            List<HomeItemDO> list = homeItemService.getWholeByHotelId(hoomPrice.getId());

        }
        // 没有的情况下进行新建并进行返回
        else {
            HomePriceDO homePriceDO = new HomePriceDO();
            homePriceDO.setHotelid(hotelId);
            homePriceDO.setStatus(2);
            boolean save = homePriceService.save(homePriceDO);
            // 进行创建
            homeItemService.insertWholeItem(homePriceDO.getId());
            // 进行返回
            List<HomeItemDO> list = homeItemService.getWholeByHotelId(homePriceDO.getId());
        }

        return "quotation/hoomPrice/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("quotation:hoomPrice:edit")
    String edit(@PathVariable("id") Long id, Model model) {
        HomePriceDO hoomPrice = homePriceService.getById(id);
        model.addAttribute("hoomPrice", hoomPrice);
        return "quotation/hoomPrice/edit";
    }

    @Log("添加房型价格表")
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("quotation:hoomPrice:add")
    public Result<String> save(HomePriceDO hoomPrice) {
        homePriceService.save(hoomPrice);
        return Result.ok();
    }

    @Log("修改房型价格表")
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("quotation:hoomPrice:edit")
    public Result<String> update(HomePriceDO hoomPrice) {
        boolean update = homePriceService.updateById(hoomPrice);
        return update ? Result.ok() : Result.fail();
    }

    @Log("删除房型价格表")
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("quotation:hoomPrice:remove")
    public Result<String> remove(Long id) {
        homePriceService.removeById(id);
        return Result.ok();
    }

    @Log("批量删除房型价格表")
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("quotation:hoomPrice:batchRemove")
    public Result<String> remove(@RequestParam("ids[]") Long[] ids) {
        homePriceService.removeByIds(Arrays.asList(ids));
        return Result.ok();
    }

    @Log("保存item yiji duiying de entry" )
    @PostMapping("/savePrice")
    @ResponseBody
/**
 * 过程:
 * 传入的两个分别是勾选以及生效的id
 * 查出全部id, 将非list中的所有元素status设置为1
 * 查出全部的entry , 计算得出item对应的分数, 以及parententry对应的分数, 进行设置,
 * 计算出homeprice对应的分数, 并对其进行设置.
 */
    public Result<String> savePrice(Long homePriceId,List<Long > itemIds , List<Long> entryIds) {
        homePriceService.updateHomePrice(homePriceId,itemIds,entryIds);

        return Result.ok();
    }



}
