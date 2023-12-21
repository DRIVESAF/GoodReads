package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.service.BookService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @Author ctynt
 * @Date 2023/12/21
 * @Description
 */
@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {
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
            Book book =(Book)req.getSession().getAttribute("book");
            try {
                bookService.delete(book);
                req.getRequestDispatcher("manage.jsp").forward(req,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }

    }
}
