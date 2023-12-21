package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.UserService;
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
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    private UserService userService;

    private User user;

    @Override
    public void init(ServletConfig config) throws ServletException {
        userService = new UserService();
        user = new User();
    }

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        user=(User)request.getSession().getAttribute("user");
        try {
            userService.delete(user);
            request.getRequestDispatcher("manager-user.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
