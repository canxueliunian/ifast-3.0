package com.ifast.common.base;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 通用业务层实现
 * </pre>
 *
 * <small> 2018年1月9日 | Aron</small>
 *
 * @param <M>
 *            mapper
 * @param <T>
 *            entity
 */
public abstract class CoreServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> implements CoreService<T> {
    public Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public List<T> findByKv(Object... params) {
        if (params == null) {
            return new ArrayList<>();
        }
        return baseMapper.selectByMap(convertToMap(params));
    }

    @Override
    public T findOneByKv(Object... params) {
        return getOne(this.convertToQueryWrapper(params));
    }

    @Override
    public Map<String, Object> convertToMap(Object... params) {
        Map<String, Object> map = new HashMap<>();
        if (params == null) {
            return map;
        }
        for (int i = 0; i < params.length; i++) {
            if (i % 2 == 1 && params[i] != null && StringUtils.isNotBlank(params[i].toString())) {
                map.put((String) params[i - 1], params[i]);
            }
        }
        return map;
    }
    @Override
    public QueryWrapper<T> convertToQueryWrapper(Object... params) {
        QueryWrapper<T> ew = new QueryWrapper<>();
        if (params == null) {
            return ew;
        }
        for (int i = 0; i < params.length; i++) {
            if (i % 2 == 1 && params[i] != null && StringUtils.isNotBlank(params[i].toString())) {
                ew.eq((String) params[i - 1], params[i]);
            }
        }
        return ew;
    }
}
