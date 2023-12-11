package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.service.BookService;
//import com.zzt.goodreads.service.impl.BookServiceImpl;
import com.zzt.goodreads.utils.ResponseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.util.List;

/**
 * @Description BookServlet
 * @Author zhy
 * @Date 2023/12/11 8:23
 */
@WebServlet("/book/*")
@Slf4j
public class BookServlet extends HttpServlet {
//    private final BookService bookService = new BookServiceImpl();

    public BookServlet() {
        log.info("init");
    }

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        log.info(requestURI);
        int position = requestURI.lastIndexOf("/");
//        author/list
        String method = requestURI.substring(position + 1);
        log.info(method);
        switch (method) {
            case "list" -> {
                selectList(req, resp);
            }
        }
    }

    private void selectList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResponseUtils responseUtils;
//        List<Book> books = bookService.selectAll();
//        responseUtils = new ResponseUtils().put("list", books);
        resp.setContentType("application/json;charset=UTF-8");
//        resp.getWriter().println(responseUtils.toJsonString());
//        resp.addHeader("Accept-Ranges","bytes");
    }

    @Override
    public void destroy() {
        log.info("destroy");
    }
}
