package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Book;

/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

public interface BookMapper {
   Book selectByBookName(String bookName);

   void insert(Book book);

   void delete(String bookName);
}
