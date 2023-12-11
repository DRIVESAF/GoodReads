package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.OrderItem;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

class OrderItemServiceTest {
    private final OrderItemService orderItemService = new OrderItemService();

    @Test
    void selectAll() {
        List<OrderItem> items = orderItemService.selectAll();
        System.out.println(items);
    }

    @Test
    void insert() {
        OrderItem item = new OrderItem(1,20F,1,1,1);
        orderItemService.insert(item);

    }
}