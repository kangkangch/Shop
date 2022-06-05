package framework.web;

import framework.pojo.Operation;
import framework.pojo.Page;
import framework.service.OperationService;
import framework.service.impl.OperationServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OperationServlet extends BaseServlet{

    OperationService operationService = new OperationServiceImpl();

    protected void addOperation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Operation operation = WebUtils.copyParamToBean(req.getParameterMap(), new Operation());
        operationService.addOperation(operation);
    }

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 10);
        Page<Operation> page = operationService.page(pageNo,pageSize);
        page.setUrl("operationServlet?action=page");
        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/manager/operation_manager.jsp").forward(req,resp);
    }
}
