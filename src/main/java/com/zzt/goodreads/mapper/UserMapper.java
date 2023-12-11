package com.zzt.goodreads.mapper;

import com.zzt.goodreads.entity.User;

/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description
 */

public interface UserMapper {
    User selectByUserPhone(String phone);

    void add(User user);

    void updatePasswordByUserId(User user);

    void updateInfoByUserId(User user);
}
