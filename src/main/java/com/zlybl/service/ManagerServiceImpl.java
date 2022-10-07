package com.zlybl.service;

import com.zlybl.mapper.BookMapper;
import com.zlybl.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ManagerServiceImpl implements ManagerServiceInf{
    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<Book> showAllBook_MS() {
        return bookMapper.selectAllBook();
    }

    @Override
    public List<Book> showBooksByConditions_MS(Book book) {
        return bookMapper.selectBooksByConditions(book);
    }

    @Override
    public int addBook_MS(Book book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int updateBook_MS(Book book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public int deleteBook_MS(int bookId) {
        return bookMapper.deleteBook(bookId);
    }

    @Override
    public Book selectBookByConditions_MS(Book book) {
        return bookMapper.selectBookByConditions(book);
    }
}
