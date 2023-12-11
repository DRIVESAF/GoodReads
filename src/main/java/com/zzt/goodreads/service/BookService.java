package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.utils.MyBatisUtils;
import com.zzt.goodreads.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

public class BookService {


    public Book selectByBookName(String bookName){
        return (Book)MyBatisUtils.executeQuery(sqlSession -> {
            BookMapper mapper = sqlSession.getMapper(BookMapper.class);
            return mapper. selectByBookName(bookName);

        });
    }

    public void insert(Book book){
         MyBatisUtils.executeUpdate(sqlSession -> {
             BookMapper mapper = sqlSession.getMapper(BookMapper.class);
             mapper.insert(book);
             return book;
         });
    }

    public void delete(String bookName){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookMapper mapper = sqlSession.getMapper(BookMapper.class);
            mapper.delete(bookName);
            return bookName;
        });
    }
    /*
     * 查询所有热销书籍
     *
     * @return: List<Book>
     * */
//    List<Book> selectAll();

}
