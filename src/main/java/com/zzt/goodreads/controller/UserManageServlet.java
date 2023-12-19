package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.UserService;
import com.zzt.goodreads.utils.ResponseUtils;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @Author ctynt
 * @Date 2023/12/19
 * @Description
 */
@WebServlet("/userManage")
public class UserManageServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        resp.setContentType("text/html:charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ResponseUtils respU = new ResponseUtils();
        try {
            User user = userService.select(phone);
            HttpSession session = req.getSession();
            session.setAttribute("user",user);
            req.getRequestDispatcher("manager-user.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
            respU = new ResponseUtils(e.getClass().getSimpleName(), e.getMessage());
        }
        // 返回JSON结果
        resp.getWriter().println(respU.toJsonString());
    }
}

