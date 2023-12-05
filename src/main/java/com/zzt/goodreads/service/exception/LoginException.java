package com.zzt.goodreads.service.exception;

/**
 * @author ctynt
 * @Date 2023/2/27
 * @Description 登录自定义异常
 **/
public class LoginException extends RuntimeException {
    public LoginException(String message) {
        super(message);
    }
}
