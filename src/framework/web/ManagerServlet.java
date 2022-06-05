package framework.web;


import framework.pojo.LoginInfo;
import framework.pojo.Manager;
import framework.service.LoginInfoService;
import framework.service.ManagerService;
import framework.service.impl.LoginInfoServiceImpl;
import framework.service.impl.ManagerServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ManagerServlet extends BaseServlet {

    ManagerService managerService = new ManagerServiceImpl();

    LoginInfoService loginInfoService = new LoginInfoServiceImpl();

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //删除session
        req.getSession().invalidate();
        //重定向到首页
        resp.sendRedirect(req.getContextPath());
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getSession().removeAttribute("user");
        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("seller");

        String name = req.getParameter("name");
        String password = req.getParameter("password");
        Manager manager = managerService.login(new Manager(null,name,password));
        if(manager == null){
            req.setAttribute("msg","账号或密码错误！");
            req.getRequestDispatcher("/pages/manager_login/login.jsp").forward(req,resp);
        }else {
            Integer id = manager.getId();
            LoginInfo loginInfo = WebUtils.copyParamToBean(req.getParameterMap(), new LoginInfo());
            loginInfo.setRoleId(id);
            loginInfoService.addRecord(loginInfo);

            req.setAttribute("manager",manager);
            req.getSession().setAttribute("manager",manager);
            Cookie cookie = new Cookie("managerName",manager.getName());
            cookie.setMaxAge(60*60*24);
            resp.addCookie(cookie);
            resp.sendRedirect(req.getContextPath() + "/client/goodsServlet?action=page");
        }
    }
}
