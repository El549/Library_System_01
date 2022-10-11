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

    //管理员登录方法
    @Override
    public Manager managerLogin(Manager manager) {
        Manager m = managermapper.managerLoginCheck(manager);
        System.out.println(m);
        return m;
    }

    //根据id查询管理员
    @Override
    public Manager selectManagerByManagerId_MS(int managerId) {
        return managermapper.selectManagerByManagerId(managerId);
    }

    //修改管理员密码
    @Override
    public int changeManagerInfo(Manager manager) {
        return managermapper.updateManager(manager);
    }

    //显示所有书籍
    @Override
    public List<Book> showAllBook_MS() {
        return bookmapper.selectAllBook();
    }

    //按条件查询多本书籍
    @Override
    public List<Book> showBookByConditions_MS(Book book) {
        return bookmapper.selectBooksByConditions(book);
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

        return bookmapper.deleteBook(bookId);
    }

    //显示所有用户
    @Override
    public List<User> showAllUser() {
        return usermapper.selectAllUser();
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
    public int addUser(User user) {
        return 0;
    }

    //显示所有借阅记录
    @Override
    public int deleteUser(int userId) {
        return usermapper.deleteUser(userId);
    }

    @Override
    public List<History> showAllHistory_MS() {
        return historymapper.selectAllHistory();
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
    public int deleteHistory_MS(int historyId) {
        return historymapper.deleteHistory(historyId);
    }
}
