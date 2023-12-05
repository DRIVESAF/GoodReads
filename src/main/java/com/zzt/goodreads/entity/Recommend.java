package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author ctynt
 * @Date 2023/12/4
 * @Description 推荐
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Recommend {
    private Integer recommendId;
    private String bookType;
    private Integer bookId;
}
