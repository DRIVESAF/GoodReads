package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.OrderItem;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public interface OrderItemMapper {
    List<OrderItem> selectAll();

    void insert(OrderItem item);
}
