package com.zlybl.service;

import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;

import java.util.List;

public interface UserServiceInf {
    //查询所有书籍
    List<Book> showAllBook_US();
    //可选择条件查询
    List<Book> showBooksByConditions_US(Book book);


    //展示该用户所有借书记录
    List<History> showHistoryByConditions_US(History history);
    //借书
    int borrowBook(int bookId,int userId);
    //还书
    int returnBook(History history);

    History selectHistoryByHistoryId(int historyId);

    User selectUserByUserId(int userId);
}
