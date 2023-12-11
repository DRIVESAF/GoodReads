package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.BookSort;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author: DRIVESAF
 * @createTime: 2023/12/11 8:35
 * @description:
 **/
class BookSortServiceTest {
    private BookSort bookSort = new BookSort();
    private final BookSortService bookSortService = new BookSortService();

    @Test
    void selectByBookSortName() {
        bookSort = bookSortService.selectByBookSortName("中国历史");
        System.out.println(bookSort);

    }

//    @Test
//    void insert() {
//        bookSort.setSortId(null);
//        bookSort.setBookType("医药");
//        bookSortService.insert(bookSort);
//
//    }
//
//    @Test
//    void delete(){
//        bookSortService.delete("医药");
//    }
}