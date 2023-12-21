package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.service.BookService;
import com.zzt.goodreads.utils.ResponseUtils;
import com.zzt.goodreads.utils.StringUtil;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.util.List;


/**
 * @Description BookServlet
 * @Author zhy
 * @Date 2023/12/11 8:23
 */
@WebServlet("/book")
@Slf4j
public class BookServlet extends HttpServlet {

    private BookService bookService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        bookService = new BookService();
    }

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
            try {
                Book book =bookService.selectByBookName(bookName);
                HttpSession session = req.getSession();
                session.setAttribute("book",book);
                req.getRequestDispatcher("manage.jsp").forward(req,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }



}
