package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Book;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

public interface BookMapper {
   Book selectByBookName(String bookName);

   List<Book> selectAll();

   void insert(Book book);

   void delete(String bookName);

}
