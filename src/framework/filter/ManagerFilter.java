package framework.filter;

import framework.pojo.Manager;
import framework.pojo.Seller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.IOException;

public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        Manager manager = (Manager) httpServletRequest.getSession().getAttribute("manager");
        Seller seller = (Seller) httpServletRequest.getSession().getAttribute("seller");
        if(manager != null || seller != null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            httpServletRequest.getRequestDispatcher("/pages/tips/manager.jsp").forward(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
