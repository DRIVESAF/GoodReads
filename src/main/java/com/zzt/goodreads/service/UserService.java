package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.exception.LoginException;
import com.zzt.goodreads.utils.MyBatisUtils;



/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description
 */

public class UserService {
    public User login(String phone, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("com.zzt.goodreads.mapper.UserMapper.selectByUserName", phone));
        if (user == null) {
            throw new LoginException("用户名不存在");
        }

        if (!password.equals(user.getPassword())) {
            throw new LoginException("密码错误");
        }
        return user;
    }
}
