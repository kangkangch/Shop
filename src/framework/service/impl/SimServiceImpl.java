package framework.service.impl;

import framework.pojo.Like;
import framework.pojo.User;
import framework.service.LikeService;
import framework.service.SimService;
import framework.service.UserService;
import framework.service.impl.LikeServiceImpl;

import java.util.List;

public class SimServiceImpl implements SimService {
    /*类class Sim {}用于进行余弦相似度的计算，
     * 利用用户之间的相似度做评分预测，并比较预测值与真实值的误差(对所有用户做平均)*/
    LikeService likeService = new LikeServiceImpl();
    UserService userService = new UserServiceImpl();

    @Override
    //使用余弦相似度算法计算两个用户间的相似度
    public double similarity(Like like_a, Like like_b) {

        //将两个用户的喜爱表转化为数组储存
        Integer[] la = likeService.trans(like_a);
        Integer[] lb = likeService.trans(like_b);
        System.out.println("la:" + la + ";lvb:" + lb);

        int size = la.length;
        double[] va = new double[size];
        double[] vb = new double[size];

        //找出两个数组的最大值
        int max_a = la[0];
        int max_b = lb[0];
        for (int i = 0; i < size; i++) {
            if (la[i] > max_a) max_a = la[i];
            if (lb[i] > max_b) max_b = lb[i];
        }

        //如果max为0则没有喜好数据，返回相似度0
        if (max_a == 0 || max_b == 0) {
            return 0;
        }
        //将两个数组归一化并且设置值最大为5
        for (int i = 0; i < size; i++) {
            va[i] = ((double) la[i] / max_a) * 5;
            vb[i] = ((double) lb[i] / max_b) * 5;
        }

        double simVal = 0;

        double num = 0;
        double den = 1;
        double powa_sum = 0;
        double powb_sum = 0;
        for (int i = 0; i < size; i++) {
            double a = va[i];
            double b = vb[i];

            num = num + a * b;
            powa_sum = powa_sum + (double) Math.pow(a, 2);
            powb_sum = powb_sum + (double) Math.pow(b, 2);
        }
        double sqrta = (double) Math.sqrt(powa_sum);
        double sqrtb = (double) Math.sqrt(powb_sum);
        den = sqrta * sqrtb;

        simVal = num / den;
        System.out.println("用户" + like_a.getUserId() + "和用户" + like_b.getUserId() + "的相似度为" + simVal);

        return simVal;
    }

    //比较后返回相似度前二的用户id
    @Override
    public Integer[] compare(Like like) {
        int userId = like.getUserId();
        List<Like> allLike = likeService.getAllLike();
        int size = allLike.size();

        User user = userService.queryUserById(userId);

        //创建数组存储比较后的相似度
        double[] sim = new double[size];

        //将所有用户比较后的相似度存储在数组中
        for (int i = 0; i < size; i++) {
            if (allLike.get(i).getUserId() == userId) sim[i] = -1;
            else sim[i] = similarity(like, allLike.get(i));
        }

        Integer[] users_id = new Integer[]{0, 0};

        double first = 0;
        double second = 0;

        //第一次遍历找到第一个相似用户
        for (int i = 0; i < size; i++) {
            // 首先找与自身类别不同的用户
            if (user.getCategoryId() != userService.queryUserById(allLike.get(i).getUserId()).getCategoryId()) {
                if (sim[i] > first ) {
                    first = sim[i];
                    users_id[0] = allLike.get(i).getUserId();
                } else {
                    if (sim[i] > second) {
                        second = sim[i];
                        users_id[1] = allLike.get(i).getUserId();
                    }
                }
            }
        }

        return users_id;
    }
}