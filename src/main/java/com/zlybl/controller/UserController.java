package com.zlybl.controller;


import com.github.pagehelper.PageInfo;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.User;
import com.zlybl.service.UserServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceInf userServiceInf;

    //注册新用户
    @RequestMapping("/userRegisterController")
    public ModelAndView userRegister(User user){
        int userId = userServiceInf.userRegisterService(user);
        ModelAndView mv = new ModelAndView();
        User u = new User();
        u.setUserId(userId);
        //把查询出来的user存入到mv中
        mv.addObject("user",u);
        if(userId>0){
            //跳转页面到registersucces
            mv.setViewName("userJsp/registerSucces");
        }else {
            mv.setViewName("userJsp/error");
        }
        return mv;
    }

    //登录
    @RequestMapping("/userLogin")
    public ModelAndView userLogin(User user, HttpSession session){
        ModelAndView mv = new ModelAndView();
        //调用service层的登录方法
        User u = userServiceInf.userLogin(user);
        if(u!=null){
            //把查询出来的用户放入session
            session.setAttribute("user",u);
            mv.addObject("user",u);
            //登录成功 跳转到全查页面
            mv.setViewName("userJsp/userQuery");
        }else {
            //登录失败
            mv.setViewName("userJsp/login");    //WEB-INF/jsp/login.jsp
        }
        return mv;
    }

    //用户退出登录
    @RequestMapping("/userLogout")
    public String userLogout(HttpSession session){
        //让session失效
        session.invalidate();
        return "userJsp/login";
    }

    //查询一个用于回显
    @RequestMapping("/showUser")
    public ModelAndView showUser(int userId){
        ModelAndView mv = new ModelAndView();
        //调用service层方法
        User user = userServiceInf.selectUserByUserId(userId);
        //把查询出来的user存入到mv中
        mv.addObject("user",user);
        //跳转页面到changeuserpassword
        mv.setViewName("userJsp/changeUserPassword");
        return mv;
    }

    //修改密码
    @RequestMapping("changeUserPasswordSucces")
    public String updateUser(User user){
        return userServiceInf.changeUserPassword(user)>0?"redirect:userInfo" : "userJsp/error";
    }

    //注销用户
    @RequestMapping("/deleteUser")
    public String deleteUser(int userId){
        return userServiceInf.deleteUser_US(userId)>0?"redirect:login" : "userJsp/error";
    }

    //全查页面
    /*@RequestMapping("/bookList")
    public ModelAndView showAllBook(int userId){
        ModelAndView mv=new ModelAndView();
        List<Book> booklist=userServiceInf.showAllBook_US();
        User user=userServiceInf.selectUserByUserId(userId);
        mv.addObject("user",user);
        mv.addObject("booklist",booklist);
        mv.setViewName("userJsp/fullSearchBook");
        return mv;
    }*/

    @RequestMapping("/bookList")
    public ModelAndView showAllBook(int userId,@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageInfo<Book> pi = userServiceInf.showAllBook_US(pageNum,pageSize);
        User user=userServiceInf.selectUserByUserId(userId);
        mv.addObject("user",user);
        mv.addObject("pi",pi);
        mv.setViewName("/userJsp/fullSearchBook");
        return mv;
    }

    // List<Book> selectBooksByConditions(Book book);
    /*@RequestMapping("/foundBook")
    public ModelAndView selectBooksByConditions(Book book,int userId){
        ModelAndView mv=new ModelAndView();
        List<Book> booklist=userServiceInf.showBooksByConditions_US(book);
        mv.addObject("user",userServiceInf.selectUserByUserId(userId));
        mv.addObject("booklist",booklist);
        mv.setViewName("userJsp/foundBook");
        return mv;
    }*/

    @RequestMapping("/foundBook")
    public ModelAndView selectBooksByConditions(Book book,int userId,@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "5") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        PageInfo<Book> pi = userServiceInf.showBooksByConditions_US(book,pageNum,pageSize);
        mv.addObject("user",userServiceInf.selectUserByUserId(userId));
        mv.addObject("pi",pi);
        mv.setViewName("userJsp/fullSearchBook");
        return mv;
    }

    //借书操作
    @RequestMapping("/borrowBook")
    public ModelAndView borrowBook(int bookId,int userId){
        ModelAndView mv=new ModelAndView();
        int flag=userServiceInf.borrowBook(bookId,userId);
        if(flag==0){
            mv.setViewName("userJsp/error");
        }else{
            mv.addObject("userId",userId);
            mv.setViewName("redirect:bookList");
        }
        return mv;
    }

    //查看当前借书信息
    @RequestMapping("/showBorrowedBook")
    public ModelAndView showBorrowedBook(int userId){
        ModelAndView mv=new ModelAndView();
        List<Book> booklist=userServiceInf.selectBorrowedBook_US(userId);
        mv.addObject("booklist",booklist);
        mv.setViewName("userJsp/showBorrow");
        return mv;
    }

    //查看用户所有借书记录
    @RequestMapping("/showHistorysByUserId")
    public ModelAndView showHistoryByConditions(int userId){
        ModelAndView mv=new ModelAndView();
        History history=new History();
        history.setUserId(userId);
        List<History> histories=userServiceInf.showHistoryByConditions_US(history);
        mv.addObject("histories",histories);
        mv.addObject("userId",userId);
        mv.setViewName("userJsp/showHistory");
        return  mv;
    }

    //还书操作
    @RequestMapping("/returnBook")
    public ModelAndView returnBook(int historyId,int userId){
        History history=userServiceInf.selectHistoryByHistoryId(historyId);
        ModelAndView mv=new ModelAndView();
        int flag=userServiceInf.returnBook(history);
        System.out.println(flag);
        if(flag==0){
            mv.setViewName("userJsp/error");
        }else {
            mv.addObject("userId",userId);
            mv.setViewName("redirect:showHistorysByUserId");
        }
        return mv;
    }

    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable() String page){
        page = "userJsp/" + page;
        return page;
    }
}
