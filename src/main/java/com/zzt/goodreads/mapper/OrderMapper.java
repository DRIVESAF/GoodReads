package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Order;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

public interface OrderMapper {
    Order selectOrderById(Integer userId);

}
