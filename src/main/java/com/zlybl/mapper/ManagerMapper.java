package com.zlybl.mapper;

import com.zlybl.pojo.Manager;

public interface ManagerMapper {

    //可选条件查询
    Manager selectManagerByConditions(Manager manager);

    //根据多个或单个条件查询单个用户（准确值，用于登录验证）
    Manager managerLoginCheck(Manager manager);
    
    //根据id查询一个管理员
    Manager selectManagerByManagerId(int managerId);

    //增加
    int addManager(Manager manager);

    //修改
    int updateManager(Manager manager);

    //删除
    int deleteManager(int managerId);
}