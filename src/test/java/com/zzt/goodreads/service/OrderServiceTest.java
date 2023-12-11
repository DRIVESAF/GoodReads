package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Order;
import org.junit.jupiter.api.Test;

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
}