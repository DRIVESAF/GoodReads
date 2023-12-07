package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.User;
import org.junit.jupiter.api.Test;


/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description 登录测试
 */

class UserServiceTest {
    private final UserService userService = new UserService();
    @Test
    void login1() {
        User user = userService.login("1111", "ww789");
        System.out.println(user);
    }
    @Test
    void login2() {
        User user = userService.login("15896153901", "zs123");
        System.out.println(user);
    }
    @Test
    void login3() {
        User user = userService.login("15062278029", "ls456");
        System.out.println(user);
    }
}