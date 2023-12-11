package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.BookSort;

/**
 * @Author ctynt DRIVESAF
 * @Date 2023/12/11
 * @Description
 */

public interface BookSortMapper {
    BookSort selectByBookSortName(String bookType);

    void insert(BookSort bookSort);

    void deleteByBookType(String bookType);

    void deleteBySortId(Integer sortId);
    <List> BookSort selectAll();

}
