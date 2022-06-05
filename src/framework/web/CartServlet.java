package framework.web;

import framework.pojo.Cart;
import framework.pojo.CartItem;
import framework.pojo.Goods;
import framework.pojo.Like;
import framework.service.GoodsService;
import framework.service.UserService;
import framework.service.impl.GoodsServiceImpl;
import framework.service.LikeService;
import framework.service.impl.LikeServiceImpl;
import framework.service.impl.UserServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CartServlet extends BaseServlet {

    private int number = -10;

    private GoodsService goodsService = new GoodsServiceImpl();
    private UserService userService = new UserServiceImpl();

    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取商品的id
        int id = WebUtils.parseInt(req.getParameter("id"), 0);

        //获取原库存,一起存到cart里面方便等会在购物车的地方再用上这个stock
        int stock = WebUtils.parseInt(req.getParameter("stock"), 0);

        //根据商品id找到对应的Goods对象
        Goods goods = goodsService.queryGoodsById(id);

        //创建一个cartItem对象，cartItem的id就是商品的id
        CartItem cartItem = new CartItem(id, goods.getName(), 1, goods.getPrice(), goods.getPrice(), stock, goods.getSellerId());

        //定义number表示还有多少次可以用
        if (number == -10) {
            number = stock - 1;
        } else {
            number -= 1;
        }

        //把number存到session域中
        req.getSession().setAttribute("number", number);

        //调用addItem方法添加到购物车
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart", cart);
        }
        cart.addItem(cartItem);

//      加购后修改用户喜爱值
        LikeService likeService = new LikeServiceImpl();
        int userId = WebUtils.parseInt(req.getParameter("userId"), 0);
        Like like = likeService.getLikeById(userId);
        int type = goods.getCategoryId();

        //设置数组存储用户的喜爱值
        Integer[] categories = likeService.trans(like);

        //根据加入购物车修改喜爱值，每次加购为用户对该类型商品的喜爱值+2
        for (int i = 0; i < 6; i++) {
            if (type == i + 1) {
                categories[i] += 2;
            }
        }

        System.out.println("加购前的喜爱值为" + like + "111" + type);
        Like new_like = new Like(userId, categories[0], categories[1], categories[2], categories[3], categories[4], categories[5]);
        likeService.setLike(new_like);
        System.out.println("加购后的喜爱值为" + new_like);

        int favorite = 0;
        int max = 0;
        for (int i = 0; i < 6; i++) {
            if (categories[i] > max) {
                max = categories[i];
                favorite = i;
            }
        }
        userService.setCategoryId(favorite, userId);

        String referer = req.getHeader("Referer");
        resp.sendRedirect(referer);
    }

    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.deleteItem(id);
            String referer = req.getHeader("Referer");
            resp.sendRedirect(referer);
        }
    }

    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.clear();
            String referer = req.getHeader("Referer");
            resp.sendRedirect(referer);
        }
    }

    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int count = WebUtils.parseInt(req.getParameter("count"), 0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.updateItem(id, count);
            String referer = req.getHeader("Referer");
            resp.sendRedirect(referer);
        }
    }
}
