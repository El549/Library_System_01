package com.zlybl.service;

import com.zlybl.pojo.Book;

import java.util.List;

public interface UserServiceInf {
    //查询所有书籍
    List<Book> showAllBook_US();

    //可选择条件查询
    List<Book> showBooksByConditions_US(Book book);

    //单条件查询
    Book selectBookByConditions_US(Book book);
}
