package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.BookSort;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public interface BookSortMapper {
    BookSort selectBySortName(String bookType);

    void insert(BookSort bookSort);

    void delete(String bookType);

}
