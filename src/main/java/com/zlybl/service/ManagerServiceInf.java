package com.zlybl.service;

import com.github.pagehelper.PageInfo;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;

import java.util.List;

public interface ManagerServiceInf {
    //管理员登录方法
    Manager managerLogin(Manager manager);
    //查询一个管理员
    Manager selectManagerByManagerId_MS(int managerId);

    //修改管理员密码
    int changeManagerInfo(Manager manager);

    //显示所有书籍
    /*List<Book> showAllBook_MS();*/

    //分页显示所有书籍
    PageInfo<Book> showAllBook_MS(Integer pageNum,Integer pageSize);

    //按条件查询多本书籍
    /*List<Book> showBookByConditions_MS(Book book);*/

    //根据条件分页显示所有书籍
    PageInfo<Book> showBooksByConditions_MS(Book book, Integer pageNum, Integer pageSize);

    //按书的ID查询单本书籍
    Book showBookByBookId_MS(int bookId);

    //添加书籍
    int addBook_MS(Book book);

    //修改书籍
    int updateBook_MS(Book book);

    //删除书籍
    int deleteBook_MS(int bookId);

    //显示所有用户
    /*List<User> showAllUser();*/

    //分页显示所有用户
    PageInfo<User> showAllUser(Integer pageNum,Integer pageSize);

    //根据ID显示单个用户
    User showUserByUserId(int userId);

    //添加用户
    int addUser_MS(User user);

    //修改用户密码
    int changeUserPassword(User user);

    //删除用户
    int deleteUser(int userId);

    //显示所有借阅记录
    /*List<History> showAllHistory_MS();*/

    //分页显示所有借阅记录
    PageInfo<History> showAllHistory_MS(Integer pageNum,Integer pageSize);

    //根据条件显示多条借阅记录
    List<History> showHistoryByConditions_MS(History history);

    //根据ID显示单条借阅记录
    History showHistoryByHistoryId_MS(int historyId);

    //修改借阅记录
    int updateHistory_MS(History history);

    //删除借阅记录
    int deleteHistory_MS(int historyID);
}
