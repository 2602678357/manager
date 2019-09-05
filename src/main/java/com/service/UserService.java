package com.service;

import com.dao.UserMapper;
import com.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录
     */
    public User userLogin(@Param(value = "userName") String userName, @Param(value = "passWord") String passWord)
    {
        return userMapper.userLogin(userName,passWord);
    }
}
