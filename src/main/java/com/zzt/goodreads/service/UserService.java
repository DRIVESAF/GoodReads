package com.zzt.goodreads.service;

import com.zzt.goodreads.entity.User;
import com.zzt.goodreads.mapper.BookMapper;
import com.zzt.goodreads.mapper.UserMapper;
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

    private final User user = new User();

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
    /*注册方法*/
    public void register(User user){

        String phone = user.getPhone();
        String password = user.getPassword();
        String userName = user.getUserName();
        String email = user.getEmail();

        User user1 = new User();
        user1.setPhone(phone);
        user1.setPassword(password);
        user1.setUserName(userName);
        user1.setEmail(email);

        //判断手机号是否已注册
        user = (User) MyBatisUtils.executeQuery(sqlSession -> sqlSession.<User>selectOne("com.zzt.goodreads.mapper.UserMapper.selectByUserPhone", phone));
        if (user == null) {
            MyBatisUtils.executeUpdate(sqlSession -> {
                UserMapper mapper = sqlSession.getMapper(UserMapper.class);
                mapper.add(user1);
                return user1;
            });

        }

    }
}
