package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author ctynt
 * @Date 2023/12/4
 * @Description 订单项
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderItem {
    private Integer itemId;
    private Float itemPrice;
    private Integer itemAmount;
    private Integer bookId;
    private Integer orderId;

}
