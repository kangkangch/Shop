package framework.web;

import framework.pojo.Goods;
import framework.pojo.Like;
import framework.pojo.User;
import framework.service.*;
import framework.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class RecommendServlet extends BaseServlet {

    UserService userService = new UserServiceImpl();
    GoodsService goodsService = new GoodsServiceImpl();
    LikeService likeService = new LikeServiceImpl();
    SimService simService = new SimServiceImpl();

    protected void recommend(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Like> likes = likeService.getAllLike();
        //获取登录用户
        User user = (User) req.getSession().getAttribute("user");
        Like like = likeService.getLikeById(user.getId());

        //取得与当前用户相似排名前二的用户id
        Integer[] users_id = simService.compare(like);
        //获取所有商品
        List<Goods> goodsList = goodsService.queryGoods();

        //推荐的商品
        List<Goods> reList = new ArrayList<>();

        //如果商品太少则全部送出
        if (goodsList.size() <= 5) {
            //保存到request域
            req.setAttribute("list", goodsList);
            //请求重定向
            req.getRequestDispatcher("/pages/client/recommend.jsp").forward(req, resp);

            return;
        }

        //遍历商品列表先添加该用户喜欢的商品类
        for (Goods goods : goodsList) {
            if (goods.getCategoryId() == user.getCategoryId() && reList.size() < 5) {
                reList.add(goods);
            }
        }

        //如果数据太少导致没有返回用户id
        if (users_id[0] == 0) {
            //保存到request域
            req.setAttribute("list", reList);
            //请求重定向
            req.getRequestDispatcher("/pages/client/recommend.jsp").forward(req, resp);
            return;
        } else {
            //从相似度第一的用户选择该用户所喜爱的商品最多两件
            int num = 0;
            for (Goods goods : goodsList) {
                if (goods.getCategoryId() == users_id[0] && num < 2) {
                    if (reList.size() <= 2) {
                        reList.add(goods);
                        num += 1;
                    } else {
                        reList.set(num + 1, goods);
                    }
                }
            }
            if (users_id[1] == 0) {
                //保存到request域
                req.setAttribute("list", reList);
                //请求重定向
                req.getRequestDispatcher("/pages/client/recommend.jsp").forward(req, resp);
                return;
            } else {
                for (Goods goods : goodsList) {
                    if (goods.getCategoryId() == users_id[1]) {
                        if (reList.size() <= 4) reList.add(goods);
                        else reList.set(4, goods);
                    }
                }
            }
        }
        System.out.println(reList);
        //保存到request域
        req.setAttribute("list", reList);
        //请求重定向
        req.getRequestDispatcher("/pages/client/recommend.jsp").forward(req, resp);
    }
}
