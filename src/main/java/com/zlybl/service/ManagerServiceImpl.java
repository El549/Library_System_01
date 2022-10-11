package com.zlybl.service;

import com.zlybl.mapper.BookMapper;
import com.zlybl.mapper.HistoryMapper;
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
    private BookMapper bookMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private HistoryMapper historyMapper;

    //管理员登录方法
    @Override
    public Manager managerLogin(Manager manager) {
        return null;
    }

    //修改管理员密码
    @Override
    public int changeManagerPassword(String managerPassword) {
        return 0;
    }

    //显示所有书籍
    @Override
    public List<Book> showAllBook_MS() {
        return null;
    }

    //按条件查询多本书籍
    @Override
    public List<Book> showBookByConditions_MS(Book book) {
        return null;
    }

    //按书的ID查询单本书籍
    @Override
    public Book showBookByBookId_MS(int bookId) {
        return bookMapper.selectBookByBookId(bookId);
    }

    //添加书籍
    @Override
    public int addBook_MS(Book book) {
        return bookMapper.addBook(book);
    }

    //修改书籍
    @Override
    public int updateBook_MS(Book book) {
        return bookMapper.updateBook(book);
    }

    //删除书籍
    @Override
    public int deleteBook_MS(int bookId) {
        return 0;
    }

    //显示所有用户
    @Override
    public List<User> showAllUser() {
        return null;
    }

    //根据ID显示单个用户
    @Override
    public User showUserByUserId(int userId) {
        return userMapper.selectUserByUserId(userId);
    }

    //添加用户
    @Override
    public int addUser_MS(User user) {
        return userMapper.addUser(user);
    }

    //修改用户密码
    @Override
    public int changeUserPassword(User user) {
        return userMapper.updateUser(user);
    }

    //删除用户
    @Override
    public int deleteUser(int userId) {
        return 0;
    }

    //显示所有借阅记录
    @Override
    public List<History> showAllHistory_MS() {
        return null;
    }

    //根据条件显示多条借阅记录
    @Override
    public List<History> showHistoryByConditions_MS(History history) {
        return null;
    }

    //根据ID显示单条借阅记录
    @Override
    public History showHistoryByHistoryId_MS(int historyId) {
        return historyMapper.selectHistoryByHistoryId(historyId);
    }

    //修改借阅记录
    @Override
    public int updateHistory_MS(History history) {
        return historyMapper.updateHistory(history);
    }

    //删除借阅记录
    @Override
    public int deleteHistory_MS(int historyID) {
        return 0;
    }
}
