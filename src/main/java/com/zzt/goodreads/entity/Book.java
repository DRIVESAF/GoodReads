package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description 书籍
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Book {
    private Integer bookId;
    private String bookType;
    private String bookName;
    private Integer bookPrice;
    private String imageAddress;
    private Integer bookStore;
    private String bookIntro;

}
