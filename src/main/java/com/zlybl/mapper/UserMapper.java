package com.zlybl.mapper;

import com.zlybl.pojo.User;

import java.util.List;

public interface UserMapper {

    //查询所有用户
    List<User> selectAllUser();
    
    //登录
    User userLoginCheck(User user);

    //根据id查询单个用户
    User selectUserByUserId(int userId);

    //查询最后一条user的id
    int selectLastUserId();

    //添加用户
    int addUser(User user);

    //修改用户信息
    int updateUser(User user);

    //删除用户
    int deleteUser(int userId);
    
}