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
    User a = new User();
//    User a = new User(6,"xiaoming","123@163.com","xiaoming","123456",false,false,"翻斗花园","12345678911");
    @Test
<<<<<<< HEAD
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
=======
    void add(){
        a.setPhone("12345678911");
        a.setPassword("123456");
>>>>>>> acf1c58 (注册功能)
    }
}