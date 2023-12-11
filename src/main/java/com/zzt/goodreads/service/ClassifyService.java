package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.BookSort;
import com.zzt.goodreads.entity.Classify;
import com.zzt.goodreads.mapper.BookSortMapper;
import com.zzt.goodreads.mapper.ClassifyMapper;
import com.zzt.goodreads.utils.MyBatisUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Description ClassifyService
 * @Author zhy
 * @Date 2023/12/11 15:36
 */
public class ClassifyService {
    public List<Classify> selectAll() {
        return (List<Classify>) MyBatisUtils.executeQuery(sqlSession -> {
            ClassifyMapper mapper = sqlSession.getMapper(ClassifyMapper.class);
            return mapper.selectAll();
        });
    }
}
