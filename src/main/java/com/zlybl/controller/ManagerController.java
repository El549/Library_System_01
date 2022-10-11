package com.zlybl.controller;

import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;
import com.zlybl.service.ManagerServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerServiceInf managerService;

    //添加书籍
    @RequestMapping("/addBook_method")
    public String addBook_MC(Book book){
        return managerService.addBook_MS(book)>0?"test":"addBook";
    }

    //查询单本书籍
    @RequestMapping("/showBookByBookId_method")
    public String showBookByBookId_MC(int bookId, Model model){
        Book book = managerService.showBookByBookId_MS(bookId);
        model.addAttribute("book",book);
        return "updateBook";
    }
    //修改书籍
    @RequestMapping("/updateBook_method")
    public String updateBook_MC(Book book){
        return managerService.updateBook_MS(book)>0?"test":"updateBook";
    }

    //添加用户
    @RequestMapping("/addUser_method")
    public String addUser_MC(User user){
        return managerService.addUser_MS(user)>0?"test":"addUser";
    }

    //查询单个用户
    @RequestMapping("/showUserByUserId_method")
    public String showUserByUserId(int userId,Model model){
        User user = managerService.showUserByUserId(userId);
        model.addAttribute("user",user);
        return "updateUser";
    }
    //修改用户
    @RequestMapping("/updateUser_method")
    public String updateUser_MC(User user){
        return managerService.changeUserPassword(user)>0?"test":"updateUser";
    }

    //查询单条借阅记录
    @RequestMapping("/showHistoryByHistoryId_method")
    public String showHistoryByHistoryId_MC(int historyId,Model model){
        History history = managerService.showHistoryByHistoryId_MS(historyId);
        model.addAttribute("history",history);
        return "updateHistory";
    }
    //修改借阅记录
    @RequestMapping("/updateHistory_method")
    public String updateHistory_MC(History history){
        return managerService.updateHistory_MS(history)>0?"test":"updateHistory";
    }

    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable() String page){
        return page;
    }
}
