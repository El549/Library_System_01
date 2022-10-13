package com.zlybl.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zlybl.mapper.BookMapper;
import com.zlybl.mapper.HistoryMapper;
import com.zlybl.mapper.UserMapper;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserServiceInf{
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private HistoryMapper historyMapper;
    @Autowired
    private UserMapper usermapper;



    @Override
    public int userRegisterService(User user) {
        int id=usermapper.selectLastUserId();
        id++;
        user.setUserId(id);
        int flag=usermapper.addUser(user);
        if(flag>0){

            return id;
        }else {
            return flag;
        }
    }

    @Override
    public User userLogin(User user) {
        return usermapper.userLoginCheck(user);
    }

    @Override
    public User selectUserByUserId(int userId) {
        return usermapper.selectUserByUserId(userId);
    }

    @Override
    public int changeUserPassword(User user) {
        return usermapper.updateUser(user);
    }

    @Override
    public int deleteUser_US(int userId) {
        return usermapper.deleteUser(userId);
    }

    //查询所有书籍
    /*@Override
    public List<Book> showAllBook_US() {
        return bookMapper.selectAllBook();
    }*/

    //分页显示所有书籍
     public PageInfo<Book> showAllBook_US(Integer pageNum, Integer pageSize){
         PageHelper.startPage(pageNum,pageSize);
         List<Book> list = bookMapper.selectAllBook();
         return new PageInfo<>(list);
    }

    //可选择条件查询书籍
    @Override
    public List<Book> showBooksByConditions_US(Book book) {
        return bookMapper.selectBooksByConditions(book);
    }

    //查询历史
    @Override
    public List<History> showHistoryByConditions_US(History history) {
        return historyMapper.selectHistorysByConditions(history);
    }

    //借书
    @Override
    public int borrowBook(int bookId,int userId) {
        if(bookId==0||userId==0){
            return 0;
        }
        Book book=bookMapper.selectBookByBookId(bookId);
        if(!book.getBookStatus()){
            return 0;
        }else {
            book.setBookStatus(false);
        }
        bookMapper.updateBook(book);

        Date date1=new Date();
        History history=new History();
        history.setBookId(bookId);
        history.setUserId(userId);
        history.setBorrowedTime(date1);
        return historyMapper.addHistory(history);
    }

    //还书
    @Override
    public int returnBook(History history) {
        Book book=bookMapper.selectBookByBookId(history.getBookId());
        if(!book.getBookStatus()){
            book.setBookStatus(true);
        }else {
            return 0;
        }
        bookMapper.updateBook(book);

        history.setReturnedTime(new Date());
        return historyMapper.updateHistory(history);
    }

    //通过id查历史记录
    @Override
    public History selectHistoryByHistoryId(int historyId) {
        return historyMapper.selectHistoryByHistoryId(historyId);
    }

    //根据用户id查询未归还的书
    @Override
    public List<Book> selectBorrowedBook_US(int userId) {
        return bookMapper.selectBorrowedBook(userId);
    }

}
