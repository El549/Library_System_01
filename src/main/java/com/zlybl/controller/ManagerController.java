package com.zlybl.controller;

import com.github.pagehelper.PageInfo;
import com.zlybl.pojo.Book;
import com.zlybl.pojo.History;
import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;
import com.zlybl.service.ManagerServiceInf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerServiceInf managerService;

    //管理员登录
    @RequestMapping("/mLogin")
    public ModelAndView managerLogin_MC(Manager manager, HttpSession session){
        System.out.println(manager);
        ModelAndView mv = new ModelAndView();
        //调用service层的登录方法
        Manager m = managerService.managerLogin(manager);
        if(m!=null){
            //把查询出来的用户放入session
            session.setAttribute("manager",m);
            //登录成功 跳转到管理员全查页面
            System.out.println("success");
            mv.setViewName("managerJsp/managerInfo");
        }else {
            //登录失败
            System.out.println("defeat");
            mv.setViewName("managerJsp/managerLogin");    //重新登录
        }
        return mv;
    }

    //管理员退出登录
    @RequestMapping("/mLogout")
    public String managerLogout_MC(HttpSession session){
        //让session失效
        session.invalidate();
        return "managerJsp/managerLogin";
    }
    
    //获得管理员信息
    @RequestMapping("showManagerInfo_method")
    public String showManagerInfo(int managerId, Model model){
        //调用service层方法
        Manager manager = managerService.selectManagerByManagerId_MS(managerId);
        //把查询出来的manager存入Model对象中  这样我们前端页面可以取值
        model.addAttribute("manager",manager);
        return "managerJsp/managerInfo";
    }
    
    //修改管理员信息
    @RequestMapping("changeManagerInfo_method")
    public String changeManagerInfo(Manager manager){
        System.out.println(manager);
        return managerService.changeManagerInfo(manager)>0?"redirect:mLogin":"managerJsp/error";
    }
    
    //查询所有书籍
    /*@RequestMapping("/showAllBook_method")
    public ModelAndView showAllBook_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据

        List<Book> bookList = managerService.showAllBook_MS();
        //System.out.println(bookList);
        //查询过后得到的数据 应该传递到前端  把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        //跳转全查页面
        mv.setViewName("managerJsp/manageBook");
        return mv;
    }*/

    //分页查询所有书籍
    @RequestMapping("/showAllBook_method")
    public ModelAndView showAllBook_MC(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageInfo<Book> pi = managerService.showAllBook_MS(pageNum,pageSize);
        mv.addObject("pi",pi);
        mv.setViewName("/managerJsp/manageBook");
        return mv;
    }
    
    //按条件查询多本书籍
    @RequestMapping("/showBooks")
    public ModelAndView showBookByConditions_MC(Book book){
        //创建ModelAndView对象
        System.out.println(book);
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = managerService.showBookByConditions_MS(book);
        System.out.println(bookList);
        //把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        mv.setViewName("managerJsp/manageBook");
        return mv;
    }
    
    //图书高级检索
    @RequestMapping("/foundBook_method")
    public ModelAndView foundBook(Book book){
        //创建ModelAndView对象
        System.out.println(book);
        ModelAndView mv = new ModelAndView();
        List<Book> bookList = managerService.showBookByConditions_MS(book);
        System.out.println(bookList);
        //把查询出来的booklist存入到modelandview对象中 方便前端取值
        mv.addObject("blist",bookList);
        mv.setViewName("managerJsp/manageBook");
        return mv;
    }
    
    //删除书籍
    @RequestMapping("/deleteBook_method")
    public String deleteBook_MC(int bookId){
        System.out.println(bookId);
        return managerService.deleteBook_MS(bookId)>0?"redirect:showAllBook_method":"managerJsp/error";
    }
    
    //查询所有用户
    /*@RequestMapping("/showAllUser_method")
    public ModelAndView showAllUser_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据
        List<User> userList = managerService.showAllUser();
        System.out.println(userList);
        //把查询出来的userlist存入到modelandview对象中 方便前端取值
        mv.addObject("ulist",userList);
        //跳转全查页面
        mv.setViewName("managerJsp/manageUser");
        return mv;
    }*/

    //分页查询所有用户
    @RequestMapping("/showAllUser_method")
    public ModelAndView showAllUser_MC(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageInfo<User> pi = managerService.showAllUser(pageNum,pageSize);
        mv.addObject("pi",pi);
        mv.setViewName("managerJsp/manageUser");
        return mv;
    }

    //删除用户
    @RequestMapping("/deleteUser_method")
    public String deleteUser_MC(int userId){
        System.out.println(userId);
        return managerService.deleteUser(userId)>0?"redirect:showAllUser_method":"managerJsp/error";
    }

    //查询所有借阅记录
    /*@RequestMapping("/showAllHistory_method")
    public ModelAndView showAllHistory_MC(){
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        //调用业务逻辑层 经过处理的数据
        List<History> historyList = managerService.showAllHistory_MS();
        System.out.println(historyList);
        //把查询出来的historyList存入到modelandview对象中,方便前端取值
        mv.addObject("hlist",historyList);
        //跳转全查页面
        mv.setViewName("managerJsp/manageHistory");
        return mv;
    }*/

    //分页查询所有借阅记录
    @RequestMapping("/showAllHistory_method")
    public ModelAndView showAllHistory_MC(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "10") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        PageInfo<History> pi = managerService.showAllHistory_MS(pageNum,pageSize);
        mv.addObject("pi",pi);
        mv.setViewName("managerJsp/manageHistory");
        return mv;
    }
    
    //删除借阅记录
    @RequestMapping("/deleteHistory_method")
    public String deleteHistory_MC(int historyId){
        System.out.println(historyId);
        return managerService.deleteHistory_MS(historyId)>0?"redirect:showAllHistory_method":"managerJsp/error";
    }

    //添加书籍
    @RequestMapping("/addBook_method")
    public String addBook_MC(Book book){
        return managerService.addBook_MS(book)>0?"redirect:showAllBook_method": "managerJsp/addBook";
    }

    //查询单本书籍
    @RequestMapping("/showBookByBookId_method")
    public String showBookByBookId_MC(int bookId, Model model){
        Book book = managerService.showBookByBookId_MS(bookId);
        model.addAttribute("book",book);
        return "managerJsp/updateBook";
    }
    //修改书籍
    @RequestMapping("/updateBook_method")
    public String updateBook_MC(Book book){
        return managerService.updateBook_MS(book)>0?"redirect:showAllBook_method": "managerJsp/error";
    }

    //添加用户
    @RequestMapping("/addUser_method")
    public String addUser_MC(User user){
        return managerService.addUser_MS(user)>0?"redirect:showAllUser_method": "managerJsp/error";
    }

    //查询单个用户
    @RequestMapping("/showUserByUserId_method")
    public String showUserByUserId(int userId,Model model){
        User user = managerService.showUserByUserId(userId);
        model.addAttribute("user",user);
        return "managerJsp/updateUser";
    }
    
    //修改用户
    @RequestMapping("/updateUser_method")
    public String updateUser_MC(User user){
        return managerService.changeUserPassword(user)>0?"redirect:showAllUser_method": "managerJsp/error";
    }

    //查询单条借阅记录
    @RequestMapping("/showHistoryByHistoryId_method")
    public String showHistoryByHistoryId_MC(int historyId,Model model){
        History history = managerService.showHistoryByHistoryId_MS(historyId);
        model.addAttribute("history",history);
        return "managerJsp/updateHistory";
    }
    
    //修改借阅记录
    @RequestMapping("/updateHistory_method")
    public String updateHistory_MC(History history){
        return managerService.updateHistory_MS(history)>0?"redirect:showAllHistory_method": "managerJsp/error";
    }

    //页面通用跳转方法
    @RequestMapping("{page}")
    public String toPage(@PathVariable() String page){
        page = "managerJsp/"+page;
        return page;
    }
}
