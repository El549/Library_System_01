package com.zlybl.mapper;

import com.zlybl.pojo.Manager;

public interface ManagerMapper {

    //可选条件查询
    Manager selectManagerByConditions(Manager manager);
    int addManager(Manager manager);
    //增加
    //修改
    int updateManager(Manager manager);
    //删除
    int deleteManager(int managerId);



}
