
package com.zzt.goodreads.service;
import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.BookSort;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.mapper.BookSortMapper;
import com.zzt.goodreads.utils.MyBatisUtils;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */
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

    public void deleteByBookType(String bookType){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            mapper.deleteByBookType(bookType);
            return bookType;
        });
    }

    public void deleteBySortId(Integer sortId){
        MyBatisUtils.executeUpdate(sqlSession -> {
            BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
            mapper.deleteBySortId(sortId);
            return  sortId;
        });
    }

    public List<BookSort> selectAll() {
            return (List<BookSort>) MyBatisUtils.executeQuery(sqlSession -> {
                BookSortMapper mapper = sqlSession.getMapper(BookSortMapper.class);
                return mapper.selectAll();
            });
    }
}

