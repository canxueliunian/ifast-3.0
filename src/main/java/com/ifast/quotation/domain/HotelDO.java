package com.ifast.quotation.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import com.ifast.common.base.BaseDO;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.ifast.common.annotation.*;


/**
 * 
 * <pre>
 * 酒店表 

 * </pre>
 * <small> 2019-01-09 13:42:17 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_hotel")
@EqualsAndHashCode(callSuper=true) 
public class HotelDO extends Model<HotelDO> {
	@TableId
	@Excel(name = "id")
	private Long id;

    /** 酒店名称 */
	@Excel(name = "酒店名称")
    private String hotelname;

    /** 酒店类型 */
	@Excel(name = "酒店类型")
    private Integer hoteltype;

    /** 店主姓名 */
	@Excel(name = "店主姓名")
    private String managename;

    /** 店长手机号码 */
	@Excel(name = "店长手机号码")
    private String managerphone;

    /** 开业时间 */
	@Excel(name = "开业时间")
    private Date openingdate;

    /** 省id */
	@Excel(name = "省id")
    private String provinceid;

    /** 省name */
	@Excel(name = "省name")
    private String provincename;

    /** 城市id */
	@Excel(name = "城市id")
    private String cityid;

    /** 城市name */
	@Excel(name = "城市name")
    private String cityname;

    /** 地区id */
	@Excel(name = "地区id")
    private String districtid;

    /** 地区name */
	@Excel(name = "地区name")
    private String districtname;

    /**  */
	@Excel(name = "")
    private String detailaddress;

    /** 登记时间 */
	@Excel(name = "登记时间")
    private Date registtime;

    /** 市场人员id */
	@Excel(name = "市场人员id")
    private Long marketmanid;

    /** 市场人员名称 */
	@Excel(name = "市场人员名称")
    private String marketmanname;

    /**  */
	@Excel(name = "")
    private Integer status;

    /**  */
	@Excel(name = "")
    private Date gmtcreate;

    /**  */
	@Excel(name = "")
    private Date gmtmodify;

    /** 图片路径 */
	@Excel(name = "图片路径")
    private String imgpath;

    /** 日期查询开始日期 */
    @TableField(exist = false)
    private String starttime;
    /** 日期查询结束日期 */
    @TableField(exist = false)
    private String endtime;

}
