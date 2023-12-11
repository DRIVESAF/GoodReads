package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import org.junit.jupiter.api.Test;

import java.util.List;


/**
 * @Author ctynt
 * @Date 2023/12/7
 * @Description selectByBookName
 */

class BookServiceTest {

    private Book book = new Book();
    private final BookService bookService= new BookService();
    @Test
    void selectByBookName() {
        book = bookService.selectByBookName("教");
        System.out.println(book);
    }

    @Test
    void selectAll(){
        List<Book> books = bookService.selectAll();
        System.out.println(books);
    }


    @Test
    void insert(){
        Book book = new Book(10,"2","2",1,1,"2","3",1,1,1,"22");
        bookService.insert(book);

    }

    @Test
    void delete(){
        bookService.delete("母猪的产后护理");
    }
}