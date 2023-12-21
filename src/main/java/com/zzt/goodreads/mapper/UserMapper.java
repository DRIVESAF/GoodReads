package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;

import java.util.List;

/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description
 */

public interface UserMapper {
    User selectByUserPhone(String phone);

    void add(User user);

    void addAdmin(User user);

    void updatePasswordByUserId(User user);

    void updateInfoByUserId(User user);

    List <User> selectAll();

    void delete(User user);
}
