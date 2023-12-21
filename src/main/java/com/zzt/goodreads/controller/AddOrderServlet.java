package com.zzt.goodreads.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/add")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取前端JSP页面传递的订单项信息
        String itemName = request.getParameter("itemName");
        double price = Double.parseDouble(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        // 数据库连接参数
        String url = "jdbc:mysql://localhost:3306/good_reads";
        String user = "root";
        String password = "password";

        try {
            // 加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 建立数据库连接
            Connection conn = DriverManager.getConnection(url, user, password);

            // 创建SQL语句
            String sql = "INSERT INTO orders (itemName, Price, amount) VALUES (?, ?, ?)";

            // 创建PreparedStatement对象
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, itemName);
            pstmt.setDouble(2, price);
            pstmt.setInt(3, amount);

            // 执行SQL语句
            pstmt.executeUpdate();

            // 关闭连接
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
