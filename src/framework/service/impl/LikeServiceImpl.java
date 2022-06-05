package framework.service.impl;

import framework.dao.LikeDao;
import framework.dao.impl.LikeDaoImpl;
import framework.pojo.Like;
import framework.service.LikeService;
import framework.service.UserService;

import java.util.List;

public class LikeServiceImpl implements LikeService {

    LikeDao likeDao = new LikeDaoImpl();
    UserService userService = new UserServiceImpl();

    @Override
    public void setLikeById(Integer userId, Like like) {
        likeDao.setLikeById(userId, like);
    }

    //在setLike的同时修改用户的喜爱类型
    @Override
    public void setLike(Like like) {
        //在每次修改用户的Like后修改用户的喜爱分类
        int userId = like.getUserId();
        //获取修改后用户的喜爱表
        Integer[] categories = trans(like);
        //用max记录用户最高like评分
        int max = 0;
        int favorite = 0;
        //获取到用户最喜爱类型
        for (int i = 0; i < categories.length; i++) {
            if (categories[i] > max) {
                favorite = i+i;
                max = categories[i];
            }
        }
        if (favorite!=0){
            //修改用户最喜爱类型
            userService.setCategoryId(userId,favorite);
        }
        likeDao.setLike(like);
    }

    @Override
    public Like getLikeById(Integer userId) {
        return likeDao.getLikeById(userId);
    }

    @Override
    public void addLikeById(Integer userId, Like like) {
        likeDao.addLikeById(userId, like);
    }

    @Override
    public void addLike(Like like) {
        likeDao.addLike(like);
    }

    @Override
    public Integer[] trans(Like like) {
        Integer[] categories = new Integer[6];
        categories[0] = like.getFood();
        categories[1] = like.getClothes();
        categories[2] = like.getFurniture();
        categories[3] = like.getFurniture();
        categories[4] = like.getElectric();
        categories[5] = like.getFun();
        return categories;
    }

    @Override
    public List<Like> getAllLike() {
        return likeDao.queryLikes();
    }
}
