package com.zzt.goodreads.service.impl;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.service.BookService;

import java.util.List;

/**
 * @Description BookServiceImpl
 * @Author zhy
 * @Date 2023/12/11 8:11
 */
public class BookServiceImpl implements BookService {
    @Override
    public <List>Book selectAll(){
        public java.util.List<Book> MyBatisUtils.executeQuery(sqlSession ->{
            BookMapper mapper = sqlSession.getMapper(BookMapper.class);
            return mapper.selectAll();
        });
    }

}
