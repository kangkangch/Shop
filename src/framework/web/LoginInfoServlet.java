package framework.web;

import framework.pojo.LoginInfo;
import framework.pojo.Page;
import framework.service.LoginInfoService;
import framework.service.impl.LoginInfoServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginInfoServlet extends BaseServlet{

    private LoginInfoService loginInfoService = new LoginInfoServiceImpl();


    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 10);
        Page<LoginInfo> page = loginInfoService.page(pageNo,pageSize);
        page.setUrl("loginInfoServlet?action=page");
        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/manager/login_manager.jsp").forward(req,resp);
    }

    protected void pageByRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 10);
        String role = req.getParameter("role");
        Page<LoginInfo> page = loginInfoService.pageByRole(pageNo,pageSize,role);

        StringBuilder stringBuilder = new StringBuilder("loginInfoServlet?action=pageByRole");
        if (role != null){
            stringBuilder.append("&role=").append(role);
        }
        page.setUrl(stringBuilder.toString());
        req.setAttribute("role",role);

        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/manager/login_manager.jsp").forward(req,resp);
    }
}
