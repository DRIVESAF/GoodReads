package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author ctynt
 * @Date 2023/12/4
 * @Description 书籍分类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookSort {
    private Integer bookId;
    private String bookType;
}
