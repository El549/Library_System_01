package com.zlybl.service;

import com.zlybl.mapper.BookMapper;
import com.zlybl.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImpl implements UserServiceInf{
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Book> showAllBook_US() {
        return bookMapper.selectAllBook();
    }

    @Override
    public List<Book> showBooksByConditions_US(Book book) {
        return bookMapper.selectBooksByConditions(book);
    }

    @Override
    public Book selectBookByConditions_US(Book book) {
        return bookMapper.selectBookByConditions(book);
    }
}
