package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.Book;
import com.zzt.goodreads.entity.User;
import org.junit.jupiter.api.Test;

import java.util.List;


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
    void login1() {
        User user = userService.login("13456783456", "11");
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
    @Test
    void add(){
        a.setUserName("h");
        a.setEmail("123@121");
        a.setPhone("12345678911");
        a.setPassword("123456");
        userService.register(a);
    }

    @Test
    void resetPassword() {
        a.setUserId(1000);
        a.setPassword("10000");
        userService.resetPassword(a);
    }

    @Test
    void resetUserInfo(){
        a.setAddress("翻斗花园");
        a.setName("爷爷");
        a.setUserId(10000);
        a.setUserName("666");
        a.setPhone("123456");
        a.setEmail("123@qq.com");
        userService.resetUserInfo(a);
    }

    @Test
    void selectAll(){
        List<User> users = userService.selectAll();
        System.out.println(users);
    }
}