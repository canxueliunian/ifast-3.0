package com.ifast.quotation.domain;

import java.util.Date;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.*;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ifast.common.annotation.*;


/**
 * <pre>
 * 房型价格表
 * </pre>
 * <small> 2019-01-09 10:12:39 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_home_price")
@EqualsAndHashCode(callSuper = true)
public class HomePriceDO extends Model<HomePriceDO> {
    @TableId
    @Excel(name = "id")
    private Long id;

    /**
     * 门店id
     */
    @Excel(name = "门店id")
    private Long hotelid;

    /**
     * 房型名称
     */
    @Excel(name = "房型名称")
    private String name;

    /**
     * 花费时间
     */
    @Excel(name = "花费时间")
    private Double spendtime;

    /**
     * 花费金额
     */
    @Excel(name = "花费金额")
    private BigDecimal spendpay;

    /**
     * 0 正常 1冻结 , 2 为创建后未使用的内容, 在新建房型的时候, 会先到数据表里找是否有status为2的类型, 如果有直接进行拉取, 如果没有的话, 则进行create的初始化操作
     */
    @Excel(name = "0 正常 1冻结")
    @TableLogic
    private Integer status;

    /**  */
    @Excel(name = "")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtcreate;

    /**  */
    @Excel(name = "")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtmodify;

}
