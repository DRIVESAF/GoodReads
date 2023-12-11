package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.Order;
import com.zzt.goodreads.entity.OrderItem;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.mapper.OrderItemMapper;
import com.zzt.goodreads.utils.MyBatisUtils;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public class OrderItemService {
    public List<OrderItem> selectAll(){
        return (List<OrderItem>) MyBatisUtils.executeQuery(sqlSession -> {
            OrderItemMapper mapper = sqlSession.getMapper(OrderItemMapper.class);
            return mapper.selectAll();
        });
    }

    public void insert(OrderItem orderItem){
       MyBatisUtils.executeUpdate(sqlSession -> {
            OrderItemMapper mapper = sqlSession.getMapper(OrderItemMapper.class);
             mapper.insert(orderItem);
             return orderItem;
        });
    }

    public void deleteByItemId(Integer itemId){
        MyBatisUtils.executeUpdate(sqlSession -> {
            OrderItemMapper mapper = sqlSession.getMapper(OrderItemMapper.class);
            mapper.deleteByItemId(itemId);
            return itemId;
        });
    }
}
