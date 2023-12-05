package com.zzt.goodreads.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author ctynt
 * @Date 2023/12/4
 * @Description 用户
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    private Integer userId;
    private String name;
    private String email;
    private String userName;
    private String password;
    private Boolean isAdmin;
    private Boolean isValidate;
    private String userStatus;
    private String address;
    private Integer phone;

}
