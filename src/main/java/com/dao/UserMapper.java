package com.dao;

import com.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Select("select * from user where userName = #{userName} AND passWord=#{passWord}")
    User userLogin(@Param(value = "userName") String userName, @Param(value = "passWord") String passWord);
}
