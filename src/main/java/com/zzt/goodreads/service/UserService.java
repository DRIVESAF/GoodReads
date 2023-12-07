package com.zzt.goodreads.service;

import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.SessionFactory;
import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.service.exception.LoginException;
import com.zzt.goodreads.utils.MyBatisUtils;
import com.zzt.goodreads.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



/**
 * @Author ctynt
 * @Date 2023/12/5
 * @Description
 */


public class UserService {
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    /*登录方法*/
    public User login(String phone, String password) {
        User user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("com.zzt.goodreads.mapper.UserMapper.selectByUserPhone", phone));
        if (user == null) {
            throw new LoginException("用户不存在");
        }

        if (!password.equals(user.getPassword())) {
            throw new LoginException("密码错误");
        }
        return user;
    }

}
