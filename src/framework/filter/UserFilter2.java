package framework.filter;

import framework.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.IOException;

public class UserFilter2 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        if(user != null){//只要有一个登录了，就放行
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            httpServletRequest.getRequestDispatcher("/pages/tips/user.jsp").forward(servletRequest,servletResponse);
//            JOptionPane.showMessageDialog(null,"请以商家身份登录后再操作","消息提示",JOptionPane.WARNING_MESSAGE);
//            httpServletRequest.getRequestDispatcher("/pages/client/index.jsp").forward(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
