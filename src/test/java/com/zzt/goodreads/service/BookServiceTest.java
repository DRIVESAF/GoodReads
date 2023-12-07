package com.zzt.goodreads.service;

import org.junit.jupiter.api.Test;



/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description
 */

class BookServiceTest {
    private final BookService bookService= new BookService();
    @Test
    void selectByBookName() {
        bookService.selectByBookName("教父");
    }
}