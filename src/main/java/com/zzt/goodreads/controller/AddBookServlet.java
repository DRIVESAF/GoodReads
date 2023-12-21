package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.service.BookService;
import com.zzt.goodreads.utils.ResponseUtils;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;

/**
 * @Author ctynt
 * @Date 2023/12/19
 * @Description
 */

@WebServlet("/addBook")
@Slf4j
public class AddBookServlet extends HttpServlet {

    private BookService bookService;

    private Book book;

    @Override
    public void init(ServletConfig config) throws ServletException {
        bookService = new BookService();
        book = new Book();
    }

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookPrice = request.getParameter("bookPrice");
        String stock = request.getParameter("stock");

        Book book = new Book();
        book.setBookName(request.getParameter("bookName"));
        book.setAuthor(request.getParameter("author"));
        book.setBookPrice(Integer.parseInt(bookPrice));
        book.setBookStork(Integer.parseInt(stock));
        book.setBookType(request.getParameter("type"));
        try {
            bookService.insert(book);
            request.getRequestDispatcher("manage.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
