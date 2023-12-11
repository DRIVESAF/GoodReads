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
    private final BookSortService bookSortService = new BookSortService();

    @Test
    void selectByBookSortName() {
        bookSort = bookSortService.selectByBookSortName("小说");
        System.out.println(bookSort);

    }

    @Test
    void insert() {
        bookSort.setBookType("医药");
        bookSortService.insert(bookSort);

    }

    @Test
    void deleteByBookSortName(){
        bookSortService.deleteByBookType("医药");
    }

    @Test
    void deleteBySortId(){
        bookSortService.deleteBySortId(8);
    }

}