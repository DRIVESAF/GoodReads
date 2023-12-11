package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.BookSort;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.mapper.BookSortMapper;
import com.zzt.goodreads.utils.MyBatisUtils;
import com.zzt.goodreads.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSessionFactory;

/**
 * @author: DRIVESAF
 * @createTime: 2023/12/11 8:28
 * @description:
 **/
public class BookSortService {


    public BookSort selectByBookSortName(String bookType){
        return (BookSort) MyBatisUtils.executeQuery(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            return mapper. selectByBookSortName(bookType);

        });
    }

    public void insert(BookSort bookSort){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            mapper.insert(bookSort);
            return bookSort;
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