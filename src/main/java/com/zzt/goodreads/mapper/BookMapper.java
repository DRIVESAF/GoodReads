package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;

/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

public interface BookMapper {
   Book selectBookByBookName(String bookName);
}
