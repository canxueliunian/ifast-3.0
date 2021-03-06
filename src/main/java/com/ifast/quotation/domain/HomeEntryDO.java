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
 * 
 * <pre>
 * 条目信息
rateString : 为通过上面的rate 两个字段生成的额每周一次, 每日一次的对应信息
显示时,显示该字段, 在修改时同时维护该字段
 * </pre>
 * <small> 2019-01-02 11:15:12 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_home_entry")
@EqualsAndHashCode(callSuper=true) 
public class HomeEntryDO extends Model<HomeEntryDO> {
	@TableId
	@Excel(name = "id")
	private Long id;

    /** 父id */
	@Excel(name = "${field.comment}")
    private Long parentid;

    /** 项目名称 */
	@Excel(name = "${field.comment}")
    private String entryname;

    /** 项目类型 */
	@Excel(name = "${field.comment}")
    private Integer packagetype;

    /** 条目类型 */
	@Excel(name = "${field.comment}")
    private Integer entrytype;

    /** 频率次数 */
	@Excel(name = "${field.comment}")
    private Integer ratenum;

    /** 频率 */
	@Excel(name = "${field.comment}")
    private String ratestring;

    /** 频率类型 1为每日, 2 为每周 */
	@Excel(name = "${field.comment}")
    private Integer ratetype;

    /** 花费时间 */
	@Excel(name = "${field.comment}")
    private Double spendtime;

    /** 花费金额 */
	@Excel(name = "${field.comment}")
    private BigDecimal spendpay;


	@Excel(name = "清洁方式")
	private String cleantype;

	@TableField(exist = false)
	private Long itemId;
    /**
     * 创建时间
     */
    @Excel(name = "${field.comment}")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtcreate;

    /**
     * 修改时间
     */
    @Excel(name = "${field.comment}")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtmodify;
    /**
     * 0 正常 1冻结
     */
    @TableLogic
    @Excel(name = "${field.comment}")
    private Integer status;

    @TableField(exist = false)
    private List<HomeEntryDO> chirdEntrys;
}
