package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.UserService;
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

/**
 * @Author ctynt
 * @Date 2023/12/13
 * @Description
 */
@WebServlet("/user")
@Slf4j
public class UserServlet extends HttpServlet {
    private UserService userService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address= request.getParameter("address");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        user.setUserName(userName);
        user.setEmail(email);
        user.setAddress(address);
        user.setUserId(Integer.parseInt(userId));
        user.setName(name);
        System.out.println(user);
        try {
            userService.resetUserInfo(user);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            request.getRequestDispatcher("user.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
