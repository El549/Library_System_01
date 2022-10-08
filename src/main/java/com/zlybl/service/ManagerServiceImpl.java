package com.zlybl.service;

import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;

import java.util.List;

public class ManagerServiceImpl implements ManagerServiceInf{
    @Override
    public Manager managerLogin(Manager manager) {
        return null;
    }

    @Override
    public int changeManagerPassword(String managerPassword) {
        return 0;
    }

    @Override
    public List<Book> showAllBook_MS() {
        return null;
    }

    @Override
    public List<Book> showBookByConditions_MS(Book book) {
        return null;
    }

    @Override
    public Book showBookByBookId_MS(int bookId) {
        return null;
    }

    @Override
    public int addBook_MS(Book book) {
        return 0;
    }

    @Override
    public int updateBook_MS(Book book) {
        return 0;
    }

    @Override
    public int deleteBook_MS(int bookId) {
        return 0;
    }

    @Override
    public List<User> showAllUser() {
        return null;
    }

    @Override
    public User showUserByUserId(int userId) {
        return null;
    }

    @Override
    public int changeUserPassword(User user) {
        return 0;
    }

    @Override
    public int deleteUser(int userId) {
        return 0;
    }

    @Override
    public List<History> showAllHistory_MS() {
        return null;
    }

    @Override
    public List<History> showHistoryByConditions_MS(History history) {
        return null;
    }

    @Override
    public History showHistoryByHistoryId_MS(History history) {
        return null;
    }

    @Override
    public int updateHistory_MS(History history) {
        return 0;
    }

    @Override
    public int deleteHistory_MS(int historyID) {
        return 0;
    }
}
