package com.ifast.quotation.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.ifast.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * <pre>
 * 条目表
 * </pre>
 * <small> 2019-01-03 13:47:22 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_home_item")
@EqualsAndHashCode(callSuper = true)
public class HomeItemDO extends Model<HomeItemDO> {
    @TableId
    @Excel(name = "id")
    private Long id;

    /**
     * 项目名称
     */
    @Excel(name = "项目名称")
    private String itemname;

    /**
     * 项目类型
     */
    @Excel(name = "项目类型")
    private Integer packagetype;

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
     * 状态
     */
    @Excel(name = "状态")
    @TableLogic
    private Integer status;

    /**  */
    @Excel(name = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtcreate;

    /**  */
    @Excel(name = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtmodify;
    /**
     * 开关 0 表示正常使用 1 表示关闭
     */
    @Excel(name = "开关")
    private Integer onoff;
    /**
     * 其关联的entrydo, 用来进行构造完整对象时进行使用
     */
    @TableField(exist = false)
    private List<HomeEntryDO> entryDOList;

    public List<HomeEntryDO> getEntryDOList() {
        return entryDOList;
    }

    public void setEntryDOList(List<HomeEntryDO> entryDOList) {
        this.entryDOList = entryDOList;
    }

//    @TableField(exist = false)
//    private Long entryId;

}
