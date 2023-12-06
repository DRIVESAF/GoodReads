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
 * @Date 2023/12/6
 * @Description
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
        //接收用户输入，前端用表单键值对的形式传参
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        //调用业务逻辑
        ResponseUtils resp;
        try {
            User user = userService.login(phone,password);
            System.out.println(user);
            // 响应结果, "0" 代表处理成功,非 "0"代表处理失败
            resp = new ResponseUtils().put("user", user);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            response.sendRedirect("/index");
        } catch (Exception e) {
            e.printStackTrace();
            // 登录失败，service会执行 throw new LoginException 操作，在这里捕获，并将失败原因返回给客户端
            resp = new ResponseUtils(e.getClass().getSimpleName(), e.getMessage());
        }
        // 返回JSON结果
        response.getWriter().println(resp.toJsonString());

    }
}
