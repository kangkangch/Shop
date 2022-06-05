package framework.filter;

import framework.pojo.Manager;
import framework.pojo.Seller;
import framework.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import javax.swing.JOptionPane;

public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        Manager manager = (Manager) httpServletRequest.getSession().getAttribute("manager");
        Seller seller = (Seller) httpServletRequest.getSession().getAttribute("seller");
        if(user != null || manager!=null || seller!=null){//只要有一个登录了，就放行
            filterChain.doFilter(servletRequest,servletResponse);
        }else{

            httpServletRequest.getRequestDispatcher("/pages/client/index.jsp").forward(servletRequest,servletResponse);
//            JOptionPane.showMessageDialog(null,"请先登录账号","消息提示",JOptionPane.WARNING_MESSAGE);
//            httpServletRequest.getRequestDispatcher("/pages/client/index.jsp").forward(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
