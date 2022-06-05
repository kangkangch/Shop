package framework.web;

import framework.pojo.*;
import framework.service.*;
import framework.service.impl.*;
import framework.utils.WebUtils;
import framework.pojo.*;
import framework.service.*;
import framework.service.impl.*;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

public class OrderServlet extends BaseServlet {

    OrderService orderService = new OrderServiceImpl();

    private OperationService operationService = new OperationServiceImpl();

    GoodsService goodsService = new GoodsServiceImpl();

    LikeService likeService = new LikeServiceImpl();


    UserService userService = new UserServiceImpl();

    protected void addOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从session中获取购物车对象
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        //从session中获取用户对象，然后获取用户的id
        User user = (User) req.getSession().getAttribute("user");
        Integer userId = user.getId();

        //添加订单，获得订单编号
        String orderId = orderService.addOrder(cart, userId);

        //记录操作
        Operation operation = WebUtils.copyParamToBean(req.getParameterMap(), new Operation());
        operationService.addOperation(operation);

        //发送邮件
        SendMail(user.getEmail());
        System.out.println(user.getEmail());

        //根据订单编号获取订单项准备遍历
        List<OrderItem> orderItems = orderService.queryForOrderItemByOrderId(orderId);

        //通过userId查找当前用户喜欢的值，准备用来修改
        Like like = likeService.getLikeById(userId);

        //设置数组存储用户的喜爱值
        Integer[] categories = likeService.trans(like);

        //创建数组用于保存新的like值
        Integer[] newLike = new Integer[6];

        //根据订单项修改like表，需要用户编号userId，数量count，商品类型，而商品类型靠商品编号
        for (OrderItem orderItem : orderItems) {
            //获取购买数量count
            Integer count = orderItem.getCount();
            //获取商品id
            Integer goodsId = orderItem.getGoodsId();
            //通过商品id查找商品
            Goods goods = goodsService.queryGoodsById(goodsId);
            //获取这个商品的类型
            Integer categoryId = goods.getCategoryId();

            //根据订单修改喜爱值，每件订单为用户对该类型商品的喜爱值+4
            for (int i = 0; i < 6; i++) {
                if (categoryId == i + 1) {
                    //因为在加入购物车时已经加过2，结算只要+2就行
                    categories[i] += count * 2;
                }
            }
            likeService.setLike(new Like(userId, categories[0], categories[1], categories[2], categories[3], categories[4], categories[5]));
            System.out.println("购买后的喜欢值为" + likeService.getLikeById(userId));

            int favorite = 0;
            int max = 0;
            for (int i = 0; i < 6; i++) {
                if (categories[i] > max) {
                    max = categories[i];
                    favorite = i;
                }
            }
            userService.setCategoryId(favorite, userId);

        }

        req.getSession().setAttribute("orderId", orderId);

        resp.sendRedirect(req.getContextPath() + "/pages/cart/checkout.jsp");
    }

    protected void queryForAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //自己修改，如果检查到了manager对象才允许继续
        Manager manager = (Manager) req.getSession().getAttribute("manager");
        if (manager == null) {
            resp.sendRedirect(req.getContextPath() + "/pages/tips/manager.jsp");
        } else {
            List<Order> orders = orderService.queryForAll();
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(req, resp);
        }
    }

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), 10);
        Page<Order> page = orderService.page(pageNo, pageSize);
        page.setUrl("orderServlet?action=page");
        req.setAttribute("page", page);
        req.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(req, resp);
    }

    protected void queryByUserId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Integer userId = user.getId();
        List<Order> orders = orderService.queryByUserId(userId);
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/pages/order/order.jsp").forward(req, resp);
    }

    protected void queryBySellerId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Seller seller = (Seller) req.getSession().getAttribute("seller");
        Integer sellerId = seller.getId();
        Page<OrderItem> page = orderService.pages(pageNo, pageSize, sellerId);
        page.setUrl("orderServlet?action=queryBySellerId");
        req.setAttribute("page", page);
        req.getRequestDispatcher("/pages/order/order_item.jsp").forward(req, resp);
    }

    protected void queryForOrderItemByOrderId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        List<OrderItem> orderItems = orderService.queryForOrderItemByOrderId(orderId);
        req.setAttribute("item", orderItems);
        req.getRequestDispatcher("/pages/order/order_item.jsp").forward(req, resp);
    }

    protected static MimeMessage CreateMessage(Session session, String sendMail, String receiveMail) throws Exception {
        //设置邮件的寄信人，收信人，邮件主题，邮件内容，发送日期。
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(sendMail, "kangkang商城", "UTF-8"));

        message.setRecipients(MimeMessage.RecipientType.TO, String.valueOf(new InternetAddress(receiveMail, "亲爱的用户", "UTF-8")));

        message.setSubject("来自kangkang商城的购买通知", "UTF-8");

        message.setContent(" Dear customer, the goods you bought in kangkang mall have been delivered. Wishing you a happy shopping!", "text/html; charset=UTF-8");

        message.setSentDate(new Date());

        message.saveChanges();

        return message;
    }

    //发送邮件
    protected void SendMail(String receiveMailAccount) {
        //设置发送方的邮件账户以及中间服务器的ip，协议，发送邮件
        String myEmailAccount = "kangkang20211202@163.com";
        String myEmailPassword = "!qwe122699";
        String myEmailSMTPHost = "smtp.163.com";


        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", myEmailSMTPHost);

        Session session = Session.getInstance(props);

        session.setDebug(true);

        try {
            MimeMessage message = CreateMessage(session, myEmailAccount, receiveMailAccount);

            Transport transport = session.getTransport();

            transport.connect(myEmailSMTPHost, myEmailAccount, "UEJUACXJJXKEOCRE");

            transport.sendMessage(message, message.getAllRecipients());

            transport.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
