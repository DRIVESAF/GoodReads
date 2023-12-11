package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.BookSort;

/**
 * @author: DRIVESAF
 * @createTime: 2023/12/11 8:25
 * @description:
 **/
public interface BookSortMapper {
    BookSort selectByBookSortName(String bookType);

    void insert(BookSort bookSort);

    void delete(String sortId);
}
