package com.zzt.goodreads.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Author ctynt
 * @Date 2023/12/4
 * @Description 订单
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
    private Integer orderId;
    private Float total;
    private Integer orderAmount;
    private String payWay;
    private String payStatus;
    private String userName;
    private Integer phone;
    private String address;
    private LocalDateTime orderDate;
}
