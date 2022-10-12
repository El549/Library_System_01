package com.zlybl.util;

import com.zlybl.pojo.Manager;
import com.zlybl.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //拦截器的本质是拦截uri
        String uri = request.getRequestURI();
        //登录页面的请求和登录方法的请求应该放开
        if(uri.contains("ogin")){
            return true;
        }
        //判断用户是否为登录状态
        User user = (User) request.getSession().getAttribute("user");
        Manager manager = (Manager) request.getSession().getAttribute("manager");
        if (uri.contains("manager")){
            //访问的是manager的方法
            if(manager!=null){
                //管理员已经登录
                return true;
            }else {
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        }else if (uri.contains("user")){
            //访问的是user的方法
            if(user!=null){
                //管理员已经登录
                return true;
            }else {
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
