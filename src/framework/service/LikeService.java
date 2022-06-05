package framework.service;

import framework.pojo.Like;

import java.util.List;
import java.util.Map;

public interface LikeService {
    public void setLikeById(Integer userId,Like like);

    public void setLike(Like like);

    public Like getLikeById(Integer userId);

    void addLikeById(Integer userId, Like like);

    public void addLike(Like like);

    public Integer[] trans(Like like);

    public List<Like> getAllLike();
}
