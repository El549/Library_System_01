package com.zlybl.mapper;

import com.zlybl.pojo.Book;

import java.util.List;

public interface BookMapper {
    //全查
    List<Book> selectAllBook();

    //可选择条件查询
    List<Book> selectBooksByConditions(Book book);

    //通过id查询书籍
    Book selectBookByBookId(int bookId);

    //增加书籍
    int addBook(Book book);

    //修改数据
    int updateBook(Book book);

    //删除数据
    int deleteBook(int bookId);
}
