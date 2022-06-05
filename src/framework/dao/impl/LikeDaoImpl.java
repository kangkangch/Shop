package framework.dao.impl;

import framework.dao.LikeDao;
import framework.pojo.Goods;
import framework.pojo.Like;

import java.util.List;

public class LikeDaoImpl extends BaseDao implements LikeDao {
    @Override
    public Like getLikeById(Integer userId) {
        String sql = "select `user_id`userId, `food`,`clothes`,`daily`,`furniture`,`electric`,`fun` from user_like where user_id = ?; ";
        return queryForOne(Like.class, sql, userId);
    }

    @Override
    public int setLikeById(Integer userId, Like like) {
        String sql = "update user_like set `food`=?,`clothes`=?,`daily`=?,`furniture`=?,`electric`=?,`fun`=? where user_id = ?";
        return update(sql,like.getFood(),like.getClothes(),like.getDaily(),like.getFurniture(),like.getElectric(),like.getFun(),userId);
    }

    @Override
    public int setLike(Like like) {
        String sql = "update user_like set `food`=?,`clothes`=?,`daily`=?,`furniture`=?,`electric`=?,`fun`=? where user_id = ?";
        return update(sql,like.getFood(),like.getClothes(),like.getDaily(),like.getFurniture(),like.getElectric(),like.getFun(),like.getUserId());
    }

    @Override
    public int addLikeById(Integer userId, Like like) {
        String sql = "insert into user_like(`user_id`,`food`,`clothes`,`daily`,`furniture`,`electric`,`fun`) values(?,?,?,?,?,?,?)";
        return update(sql,userId,like.getFood(),like.getClothes(),like.getDaily(),like.getFurniture(),like.getElectric(),like.getFun());
    }

    @Override
    public int addLike(Like like) {
        String sql = "insert into user_like(`user_id`,`food`,`clothes`,`daily`,`furniture`,`electric`,`fun`) values(?,?,?,?,?,?,?)";
        return update(sql,like.getUserId(),like.getFood(),like.getClothes(),like.getDaily(),like.getFurniture(),like.getElectric(),like.getFun());
    }

    @Override
    public List<Like> queryLikes() {
        String sql = "select `user_id`userId,`food`,`clothes`,`daily`,`furniture`,`electric`,`fun` from user_like";
        return queryForList(Like.class,sql);
    }
}
