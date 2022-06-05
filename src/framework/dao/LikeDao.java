package framework.dao;

import framework.pojo.Like;

import java.util.List;

public interface LikeDao {
    public Like getLikeById(Integer userId);
    public int setLikeById(Integer userId,Like like);

    public int setLike(Like like);

    public int addLikeById(Integer userId, Like like);

    public int addLike(Like like);

    public List<Like> queryLikes();
}
