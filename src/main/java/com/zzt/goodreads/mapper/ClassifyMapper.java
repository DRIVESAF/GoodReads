package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Classify;

import java.util.List;

/**
 * @Description ClassifyMapper
 * @Author zhy
 * @Date 2023/12/11 15:34
 */
public interface ClassifyMapper {

    List<Classify> selectAll();
}
