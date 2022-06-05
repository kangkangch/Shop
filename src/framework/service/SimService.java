package framework.service;

import framework.pojo.Like;

public interface SimService {

    public double similarity(Like like_a, Like like_b);

    public Integer[] compare(Like like);
}
