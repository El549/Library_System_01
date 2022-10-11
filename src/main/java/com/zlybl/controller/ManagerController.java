package com.zlybl.controller;

import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;
import com.zlybl.service.ManagerServiceImpl;
import com.zlybl.service.ManagerServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerServiceInf managerservice;

    //管理员登录
    @RequestMapping("/mLogin")
    public ModelAndView managerLogin_MC(Manager manager, HttpSession session){
        System.out.println(manager);
        ModelAndView mv = new ModelAndView();
        //调用service层的登录方法
        Manager m = managerservice.managerLogin(manager);
        if(m!=null){
            //把查询出来的用户放入session
            session.setAttribute("manager",m);
            //登录成功 跳转到管理员全查页面
            System.out.println("success");
            mv.setViewName("managerInfo");
        }else {
            //登录失败
            System.out.println("defeat");
            mv.setViewName("managerLogin");    //重新登录
        }
        return mv;
    }
    //获得管理员信息
    @RequestMapping("showManagerInfo_method")
    public String showManagerInfo(int managerId, Model model){
        //调用service层方法
        Manager manager = managerservice.selectManagerByManagerId_MS(managerId);
        //把查询出来的manager存入Model对象中  这样我们前端页面可以取值
        model.addAttribute("manager",manager);
        return "managerInfo";
    }
    //修改管理员信息
    @RequestMapping("changeManagerInfo_method")
    public String changeManagerInfo(Manager manager){
        System.out.println(manager);
        return managerservice.changeManagerInfo(manager)>0?"redirect:mLogin":"error";
    }
    //查询所有书籍
    @RequestMapping("/showAllBook_method")
    public ModelAndView showAllBook_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据

        List<Book> bookList = managerservice.showAllBook_MS();
        //System.out.println(bookList);
        //查询过后得到的数据 应该传递到前端  把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        //跳转全查页面
        mv.setViewName("manageBook");
        return mv;
    }
    //按条件查询多本书籍
    @RequestMapping("/showBooks")
    public ModelAndView showBookByConditions_MC(Book book){
        //创建ModelAndView对象
        System.out.println(book);
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = managerservice.showBookByConditions_MS(book);
        System.out.println(bookList);
        //把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        mv.setViewName("manageBook");
        return mv;
    }
    //图书高级检索
    @RequestMapping("/foundBook_method")
    public ModelAndView foundBook(Book book){
        //创建ModelAndView对象
        System.out.println(book);
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = managerservice.showBookByConditions_MS(book);
        System.out.println(bookList);
        //把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        mv.setViewName("manageBook");
        return mv;
    }
    //删除书籍
    @RequestMapping("/deleteBook_method")
    public String deleteBook_MC(int bookId){
        System.out.println(bookId);
        return managerservice.deleteBook_MS(bookId)>0?"redirect:showAllBook_method":"error";
    }
    //查询所有用户
    @RequestMapping("/showAllUser_method")
    public ModelAndView showAllUser_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据
        List<User> userList = managerservice.showAllUser();
        System.out.println(userList);
        //把查询出来的userlist存入到modelandview对象中 方便前端取值
        mv.addObject("ulist",userList);
        //跳转全查页面
        mv.setViewName("manageUser");
        return mv;
    }

    //删除用户
    @RequestMapping("/deleteUser_method")
    public String deleteUser_MC(int userId){
        System.out.println(userId);
        return managerservice.deleteUser(userId)>0?"redirect:showAllUser_method":"error";
    }

    //查询所有借阅记录
    @RequestMapping("/showAllHistory_method")
    public ModelAndView showAllHistory_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据
        List<History> historyList = managerservice.showAllHistory_MS();
        System.out.println(historyList);
        //把查询出来的historyList存入到modelandview对象中,方便前端取值
        mv.addObject("hlist",historyList);
        //跳转全查页面
        mv.setViewName("manageHistory");
        return mv;
    }
    //删除借阅记录
    @RequestMapping("/deleteHistory_method")
    public String deleteHistory_MC(int historyId){
        System.out.println(historyId);
        return managerservice.deleteHistory_MS(historyId)>0?"redirect:showAllHistory_method":"error";
    }
    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable() String page){
        return page;
    }

}
