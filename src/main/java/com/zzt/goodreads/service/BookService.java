package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

public class BookService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    public Book selectByBookName(String bookName){
        SqlSession sqlSession = factory.openSession();
        return sqlSession.selectOne(bookName);
    }
}