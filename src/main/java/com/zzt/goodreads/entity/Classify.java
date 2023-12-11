package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description Classify
 * @Author zhy
 * @Date 2023/12/11 15:28
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Classify {
    private int classId;
    private String className;
    private String content;
    private String classifyCover;
}
