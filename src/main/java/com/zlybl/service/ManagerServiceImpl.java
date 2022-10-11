package com.zlybl.service;

import com.zlybl.mapper.BookMapper;
import com.zlybl.mapper.HistoryMapper;
import com.zlybl.mapper.ManagerMapper;
import com.zlybl.mapper.UserMapper;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ManagerServiceImpl implements ManagerServiceInf{
    @Autowired
    private ManagerMapper managermapper;
    @Autowired
    private BookMapper bookmapper;
    @Autowired
    private UserMapper usermapper;
    @Autowired
    private HistoryMapper historymapper;

    @Override
    public Manager managerLogin(Manager manager) {
        Manager m = managermapper.managerLoginCheck(manager);
        System.out.println(m);
        return m;
    }

    @Override
    public Manager selectManagerByManagerId_MS(int managerId) {
        return managermapper.selectManagerByManagerId(managerId);
    }

    @Override
    public int changeManagerInfo(Manager manager) {
        return managermapper.updateManager(manager);
    }

    @Override
    public List<Book> showAllBook_MS() {
        return bookmapper.selectAllBook();
    }

    @Override
    public List<Book> showBookByConditions_MS(Book book) {
        return bookmapper.selectBooksByConditions(book);
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

        return bookmapper.deleteBook(bookId);
    }

    @Override
    public List<User> showAllUser() {
        return usermapper.selectAllUser();
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
    public int addUser(User user) {
        return 0;
    }

    @Override
    public int deleteUser(int userId) {
        return usermapper.deleteUser(userId);
    }

    @Override
    public List<History> showAllHistory_MS() {
        return historymapper.selectAllHistory();
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
    public int deleteHistory_MS(int historyId) {
        return historymapper.deleteHistory(historyId);
    }
}
