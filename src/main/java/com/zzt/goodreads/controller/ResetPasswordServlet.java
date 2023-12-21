package com.zzt.goodreads.controller;

import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @Author ctynt
 * @Date 2023/12/21
 * @Description
 */
@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try {
            String phone = req.getParameter("phone");
            String originP = req.getParameter("originP");
            String newP = req.getParameter("newP");
            User user = new User();
            user.setPhone(phone);
            user.setPassword(newP);
            if (userService.login(phone, originP) == null) {
                req.getRequestDispatcher("/repsw.jsp").forward(req, resp);
            } else {
                userService.resetPassword(user);
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            String script = "<script>alert('账号与密码不匹配！');setTimeout(function(){window.location.href='/repsw.jsp';},1000);</script>";
            resp.getWriter().println(script);
        }
    }
}
