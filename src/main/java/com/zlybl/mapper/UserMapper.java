package com.zlybl.mapper;

import com.zlybl.pojo.User;

import java.util.List;

public interface UserMapper {
    //查询所有用户
    List<User> selectAllUser();
    //根据多个条件查询一组用户
    List<User> selectUsersByConditions(User user);
    //根据多个条件查询单个用户
    User selectUserByConditions(User user);
    //添加用户
    int addUser(User user);
    //修改用户信息
    int updateUser(User user);
    //删除用户
    int deleteUser(int userId);

}
