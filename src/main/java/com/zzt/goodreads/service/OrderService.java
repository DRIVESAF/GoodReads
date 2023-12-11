package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Order;
import com.zzt.goodreads.entity.OrderItem;
import com.zzt.goodreads.mapper.OrderItemMapper;
import com.zzt.goodreads.mapper.OrderMapper;
import com.zzt.goodreads.mapper.UserMapper;
import com.zzt.goodreads.utils.MyBatisUtils;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public class OrderService {
    Order selectCart(Integer userId){
        return (Order) MyBatisUtils.executeQuery(sqlSession -> {
            OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
            return mapper.selectOrderById(userId);
        });
    }

    public void insert(Order order){
        MyBatisUtils.executeUpdate(sqlSession -> {
            OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
            mapper.insert(order);
            return order;
        });
    }

    public void deleteByOrderId(Integer orderId){
        MyBatisUtils.executeUpdate(sqlSession -> {
            OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
            mapper.deleteByOrderId(orderId);
            return orderId;
        });
    }
}
