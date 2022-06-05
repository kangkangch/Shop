package framework.web;

import framework.pojo.Like;
import framework.pojo.LoginInfo;
import framework.pojo.User;
import framework.service.LikeService;
import framework.service.LoginInfoService;
import framework.service.OperationService;
import framework.service.UserService;
import framework.service.impl.LikeServiceImpl;
import framework.service.impl.LoginInfoServiceImpl;
import framework.service.impl.OperationServiceImpl;
import framework.service.impl.UserServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    private LoginInfoService loginInfoService = new LoginInfoServiceImpl();

    private OperationService operationService = new OperationServiceImpl();

    private LikeService likeService = new LikeServiceImpl();

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //删除session
        req.getSession().invalidate();
        //重定向到首页
        resp.sendRedirect(req.getContextPath());
//        System.out.println("111");
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getSession().removeAttribute("manager");
        req.getSession().removeAttribute("seller");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User loginUser = userService.login(new User(null, username, password, null, 1));
        if (loginUser == null) {
            req.setAttribute("msg", "账号或密码错误！");
            req.setAttribute("username", username);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            Integer id = loginUser.getId();
            LoginInfo loginInfo = WebUtils.copyParamToBean(req.getParameterMap(), new LoginInfo());
            loginInfo.setRoleId(id);
            loginInfoService.addRecord(loginInfo);

            req.setAttribute("username", username);
            req.setAttribute("user", loginUser);
            req.getSession().setAttribute("username", username);
            req.getSession().setAttribute("user", loginUser);
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60 * 60 * 24);
            resp.addCookie(cookie);
            resp.sendRedirect(req.getContextPath() + "/client/goodsServlet?action=page");
        }
    }

    protected void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        Integer categoryId = 1;

        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

        //检查用户名是否存在
        if (userService.existUsername(username)) {
            req.setAttribute("msg", "用户名已存在！");
            req.getRequestDispatcher("/pages/user/register.jsp").forward(req, resp);
        } else {
            userService.register(new User(null, username, password, email, categoryId));
            //往like表里面设置初始值
            //login方法就是查找账号密码符合的用户，通过用户对象获取到userId
            Integer userId = userService.login(new User(null, username, password, null, 0)).getId();
            //根据userId添加Like表，默认全是0
            likeService.addLike(new Like(userId, 0, 0, 0, 0, 0, 0));
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        }
    }
}
