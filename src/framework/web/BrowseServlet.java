package framework.web;

import framework.pojo.*;
import framework.service.BrowseService;
import framework.service.GoodsService;
import framework.service.LikeService;
import framework.service.UserService;
import framework.service.impl.BrowseServiceImpl;
import framework.service.impl.GoodsServiceImpl;
import framework.service.impl.LikeServiceImpl;
import framework.service.impl.UserServiceImpl;
import framework.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class BrowseServlet extends BaseServlet {
    private BrowseService browseService = new BrowseServiceImpl();
    private LikeService likeService = new LikeServiceImpl();
    private UserService userService = new UserServiceImpl();
    private GoodsService goodsService = new GoodsServiceImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            add(req, resp);
        } else {
            try {
                Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);
                method.invoke(this, req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = WebUtils.parseInt(req.getParameter("userId"), 0);
        int goodsId = WebUtils.parseInt(req.getParameter("goodsId"), 0);
        int categoryId = WebUtils.parseInt(req.getParameter("categoryId"), 0);
        String beginTime = req.getParameter("beginTime");
        String endTime = req.getParameter("endTime");
        String time = req.getParameter("time");
        //?????????5?????????????????????????????????
        if (WebUtils.parseInt(time, 0) >= 5) {
            Browse browse = new Browse(userId, goodsId, categoryId, beginTime, endTime, time);
            if (beginTime != null) browseService.addBrowse(browse);

            //?????????????????????????????????20???+1?????????,??????????????????????????????????????????3
            Like like = likeService.getLikeById(userId);
            //???????????????????????????
            Integer[] categories = likeService.trans(like);
            System.out.println(categoryId);
            System.out.println(categories[2]);
            for (int i = 0; i < 6; i++) {
                if (categoryId == i + 1) {
                    int like_num = WebUtils.parseInt(time, 0) / 20;
                    if (like_num > 3) like_num = 3;
                    //???????????????????????????????????????2???????????????+2??????
                    categories[i] += like_num;
                }
            }
            System.out.println(categoryId);
            System.out.println(categories[2]);
            System.out.println("????????????????????????" + like);
            Like new_like = new Like(userId, categories[0], categories[1], categories[2], categories[3], categories[4], categories[5]);
            likeService.setLike(new_like);
            //??????????????????
            int favorite = 0;
            int max = 0;
            for (int i = 0; i < 6; i++) {
                if (categories[i] > max) {
                    max = categories[i];
                    favorite = i;
                }
            }
            userService.setCategoryId(favorite, userId);
            System.out.println("????????????????????????" + new_like);
        }
    }

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        Manager manager = (Manager) req.getSession().getAttribute("manager");
        if (manager == null) {
            //??????????????????????????????????????????
            System.out.println("?????????????????????");
        } else {
            Page<Browse> page = browseService.page(pageNo, pageSize);
            page.setUrl("browseServlet?action=page");
            req.setAttribute("page", page);
            req.getRequestDispatcher("/pages/manager/browse.jsp").forward(req, resp);
        }
    }

    protected void pageByUserId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        int userId = WebUtils.parseInt(req.getParameter("userId"), 0);

        Manager manager = (Manager) req.getSession().getAttribute("manager");
        if (manager == null) {
            //??????????????????????????????????????????
            System.out.println("?????????????????????");
        } else {
            Page<Browse> page = browseService.pageByUserId(pageNo, pageSize, userId);
            page.setUrl("browseServlet?action=pageByUserId&userId=" + userId);
            req.setAttribute("page", page);
            req.setAttribute("userId", userId);
            req.getRequestDispatcher("/pages/manager/browse.jsp").forward(req, resp);
        }
    }

    protected void browseBySellerId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int sellerId = WebUtils.parseInt(req.getParameter("sellerId"), 0);
        List<Goods> allGoods= goodsService.queryGoods();
        List<Browse> allBrowse = browseService.queryBrowse();
        List<Integer> goodIds=new ArrayList<Integer>();
        List<Browse> sellerBrowse=new ArrayList<Browse>();
        //?????????????????????????????????????????????id???????????????????????????
        for (Goods goods : allGoods) {
            if (goods.getSellerId() == sellerId) {
                goodIds.add(goods.getId());
            }
        }

        //??????????????????????????????id
        for (Browse browse : allBrowse) {
            //?????????????????????id??????????????????????????????
            for (Integer goodsId : goodIds) {
                if (browse.getGoodsId() == goodsId) {
                    sellerBrowse.add(browse);
                    break;
                }
            }
        }
        req.setAttribute("items",sellerBrowse);
        req.getRequestDispatcher("/pages/manager/browse_seller.jsp").forward(req, resp);
    }
}
