package com.ifast.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by lishuntao on 2019/1/2.
 */
@Component
public class MetaObjectHandlerConfig implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {

        Object gmtCreate = getFieldValByName("gmtcreate", metaObject);
        Object gmtModify = getFieldValByName("gmtmodify", metaObject);
        if (gmtCreate == null)
            setFieldValByName("gmtcreate",new Date(), metaObject);//mybatis-plus版本2.0.9+
        if (gmtModify == null)
            setFieldValByName("gmtmodify",new Date(), metaObject);
        System.out.println();//mybatis-plus版本2.0.9+
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Object gmtModify = getFieldValByName("gmtmodify", metaObject);
        if (gmtModify == null) {
            setFieldValByName("gmtmodify", new Date(), metaObject);//mybatis-plus版本2.0.9+
        }
    }
}