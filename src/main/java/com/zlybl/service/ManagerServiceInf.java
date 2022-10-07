package com.zlybl.service;

import com.zlybl.pojo.Book;

import java.util.List;

public interface ManagerServiceInf {
    //查询所有
    List<Book> showAllBook_MS();

    //可选择条件查询
    List<Book> showBooksByConditions_MS(Book book);

    //增加书籍
    int addBook_MS(Book book);

    //修改书籍
    int updateBook_MS(Book book);

    //删除书籍
    int deleteBook_MS(int bookId);

    //单条件查询
    Book selectBookByConditions_MS(Book book);
}
