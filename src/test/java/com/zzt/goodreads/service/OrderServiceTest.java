package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Order;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

class OrderServiceTest {
    private final OrderService orderService = new OrderService();



    @Test
    void selectCart() {
        Order order =orderService.selectCart(1);
        System.out.println(order);
    }


    @Test
    void insert() {
        LocalDateTime localDateTime = LocalDateTime.now();
        Order order = new Order(2,20F,1,true,true,"张三",123456,"南京",localDateTime,1);
        orderService.insert(order);
    }

    @Test
    void deleteByOrderId() {
        orderService.deleteByOrderId(2);
    }
}