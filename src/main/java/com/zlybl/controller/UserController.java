package com.zlybl.controller;


import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;
import com.zlybl.service.UserServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceInf userServiceInf;

    //全查页面
    @RequestMapping("/bookList")
    public ModelAndView showAllBook(int userId){
        ModelAndView mv=new ModelAndView();
        List<Book> booklist=userServiceInf.showAllBook_US();
        User user=userServiceInf.selectUserByUserId(userId);
        mv.addObject("user",user);
        mv.addObject("booklist",booklist);
        mv.setViewName("fullSearchBook");
        return mv;
    }
    // List<Book> selectBooksByConditions(Book book);
    @RequestMapping("/foundBook")
    public ModelAndView selectBooksByConditions(Book book,int userId){
        ModelAndView mv=new ModelAndView();
        List<Book> booklist=userServiceInf.showBooksByConditions_US(book);
        mv.addObject("user",userServiceInf.selectUserByUserId(userId));
        mv.addObject("booklist",booklist);
        mv.setViewName("foundBook");
        return mv;
    }

    @RequestMapping("/borrowBook")
    public ModelAndView borrowBook(int bookId,int userId){
        ModelAndView mv=new ModelAndView();
        int flag=userServiceInf.borrowBook(bookId,userId);
        if(flag==0){
            mv.setViewName("error");
        }else{
            mv.addObject("userId",userId);
            mv.setViewName("redirect:bookList");
        }
        return mv;
    }
    //查看我的借书记录
    @RequestMapping("/showHistorysByUserId")
    public ModelAndView showHistoryByConditions(int userId){
        ModelAndView mv=new ModelAndView();
        History history=new History();
        history.setUserId(userId);
        List<History> histories=userServiceInf.showHistoryByConditions_US(history);
        mv.addObject("histories",histories);
        mv.addObject("userId",userId);
        mv.setViewName("showHistory");
        return  mv;
    }
    //还书
    @RequestMapping("/returnBook")
    public ModelAndView returnBook(int historyId,int userId){
        History history=userServiceInf.selectHistoryByHistoryId(historyId);
        ModelAndView mv=new ModelAndView();
        int flag=userServiceInf.returnBook(history);
        System.out.println(flag);
        if(flag==0){
            mv.setViewName("error");
        }else {
            mv.addObject("userId",userId);
            mv.setViewName("redirect:showHistorysByUserId");
        }
        return mv;
    }
}
