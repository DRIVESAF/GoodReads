package com.zzt.goodreads.service;


import com.zzt.goodreads.entity.BookSort;
import org.junit.jupiter.api.Test;


/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

class BookSortServiceTest {
    private BookSort bookSort = new BookSort();
    private final BookSortService bookSortService =new BookSortService();
    @Test
    void selectBySortName() {
        bookSort = bookSortService.selectBySortName("哲学");
        System.out.println(bookSort);
    }

    @Test
    void insert() {
        bookSort.setBookType("社科");
        bookSortService.insert(bookSort);
    }

    @Test
    void delete() {
        bookSortService.delete("社科");
    }
}