package com.zlybl.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    private ManagerMapper managerMapper;
    
    @Autowired
    private BookMapper bookMapper;
    
    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private HistoryMapper historyMapper;

    //管理员登录方法
    @Override
    public Manager managerLogin(Manager manager) {
        Manager m = managerMapper.managerLoginCheck(manager);
        System.out.println(m);
        return m;
    }

    //根据id查询管理员
    @Override
    public Manager selectManagerByManagerId_MS(int managerId) {
        return managerMapper.selectManagerByManagerId(managerId);
    }

    //修改管理员密码
    @Override
    public int changeManagerInfo(Manager manager) {
        return managerMapper.updateManager(manager);
    }

    //显示所有书籍
    /*@Override
    public List<Book> showAllBook_MS() {
        return bookMapper.selectAllBook();
    }*/

    //分页显示所有书籍
    @Override
    public PageInfo<Book> showAllBook_MS(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Book> list = bookMapper.selectAllBook();
        return new PageInfo<>(list);
    }

    //按条件查询多本书籍
    /*@Override
    public List<Book> showBookByConditions_MS(Book book) {
        return bookMapper.selectBooksByConditions(book);
    }*/

    //分页显示可选条件查询书籍
    @Override
    public PageInfo<Book> showBooksByConditions_MS(Book book, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Book> list = bookMapper.selectBooksByConditions(book);
        return new PageInfo<>(list);
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

        return bookMapper.deleteBook(bookId);
    }

    //显示所有用户
    /*@Override
    public List<User> showAllUser() {
        return userMapper.selectAllUser();
    }*/

    //分页显示所有用户
    @Override
    public PageInfo<User> showAllUser(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list = userMapper.selectAllUser();
        return new PageInfo<>(list);
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
        return userMapper.deleteUser(userId);
    }

    //分页显示所有借阅记录
    @Override
    public PageInfo<History> showAllHistory_MS(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<History> list = historyMapper.selectAllHistory();
        return new PageInfo<>(list);
    }

    //显示所有借阅记录
    /*@Override
    public List<History> showAllHistory_MS() {
        return historyMapper.selectAllHistory();
    }*/

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
        return historyMapper.deleteHistory(historyId);
    }
}
