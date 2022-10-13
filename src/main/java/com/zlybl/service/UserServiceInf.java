package com.zlybl.service;

import com.github.pagehelper.PageInfo;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;

import java.util.List;

public interface UserServiceInf {

    //注册新用户
    int userRegisterService(User user);

    //用户登录
    User userLogin(User user);

    //ID查询用于回显
    User selectUserByUserId(int userId);

    //修改密码
    int changeUserPassword(User user);


    //注销用户
    int deleteUser_US(int userId);

    //查询所有书籍
    /*List<Book> showAllBook_US();*/

    //分页显示所有书籍
    PageInfo<Book> showAllBook_US(Integer pageNum, Integer pageSize);

    //可选择条件查询
    List<Book> showBooksByConditions_US(Book book);

    //展示该用户所有借书记录
    List<History> showHistoryByConditions_US(History history);

    //借书
    int borrowBook(int bookId,int userId);

    //还书
    int returnBook(History history);

    //通过id查询借阅记录
    History selectHistoryByHistoryId(int historyId);

    //根据用户id查询未还的书
    List<Book> selectBorrowedBook_US(int userId);

}
