package com.ifast.common.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ifast.common.annotation.Excel;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lishuntao on 2019/1/8.
 */
public class MyBaseDo implements Serializable {


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
}
