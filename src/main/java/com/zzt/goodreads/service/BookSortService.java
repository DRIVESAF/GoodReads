package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.BookSort;
import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.mapper.BookSortMapper;
import com.zzt.goodreads.utils.MyBatisUtils;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public class BookSortService {
    public BookSort selectBySortName(String bookType){
//        return (BookSort) MyBatisUtils.executeQuery(sqlSession -> {
//            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
//            return mapper.selectBySortName(bookType);
//        });
        BookSort bookSort = (BookSort) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("com.zzt.goodreads.mapper.BookSortMapper.selectBySortName",bookType));
        return bookSort;
    }

    public void insert(BookSort sort){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            mapper.insert(sort);
            return sort;
        });
    }

    public void delete(String bookType){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            mapper.delete(bookType);
            return bookType;
        });
    }
}
