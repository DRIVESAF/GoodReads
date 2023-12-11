package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Classify;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @Author ctynt
 * @Date 2023/12/11
 * @Description
 */

class ClassifyServiceTest {
    private ClassifyService classifyService = new ClassifyService();
    @Test
    void selectAll() {
        List<Classify> classifies = new ArrayList<>();
        classifies = classifyService.selectAll();
        System.out.println(classifies);
    }
}