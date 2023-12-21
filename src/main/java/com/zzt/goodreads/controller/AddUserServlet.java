package com.zzt.goodreads.controller;


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
 * @Date 2023/12/19
 * @Description
 */
@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

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
        user.setUserName(request.getParameter("name"));
        user.setPassword(request.getParameter("password"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        user.setIsAdmin(Boolean.parseBoolean(request.getParameter("isAdmin")));

        try {
           userService.registerAdmin(user);
           request.getRequestDispatcher("manager-user.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
