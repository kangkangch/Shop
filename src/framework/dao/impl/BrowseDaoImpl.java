package framework.dao.impl;

import framework.dao.BrowseDao;
import framework.pojo.Browse;
import framework.pojo.Goods;

import java.util.List;

public class BrowseDaoImpl extends BaseDao implements BrowseDao {
    @Override
    public int addBrowse(Browse browse) {
        String sql = "insert into browse(`user_id`,`goods_id` ,`category_id`,`begin_time`,`end_time`,`time`) values(?,?,?,?,?,?)";
        return update(sql,browse.getUserId(),browse.getGoodsId(),browse.getCategoryId(),browse.getBeginTime(),browse.getEndTime(),browse.getTime());
    }

    @Override
    public List<Browse> queryBrowses() {
        String sql = "select `user_id` userId,`goods_id` goodsId,`category_id` categoryId,`begin_time` beginTime,`end_time` endTime,`time` from browse";
        return queryForList(Browse.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from browse";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Browse> queryForPageBrowses(int begin, int pageSize) {
        String sql = "select `user_id` userId,`goods_id` goodsId,`category_id` categoryId,`begin_time` beginTime,`end_time` endTime,`time` from browse limit ?,?";
        return queryForList(Browse.class,sql,begin,pageSize);
    }

    @Override
    public Integer queryForPageTotalCountByUserId(Integer userId) {
        String sql = "select count(*) from browse where user_id = ?";
        Number count = (Number) queryForSingleValue(sql,userId);
        return count.intValue();
    }

    @Override
    public List<Browse> queryForPageBrowsesByUserId(int begin, int pageSize, Integer userId) {
        String sql = "select `user_id` userId,`goods_id` goodsId,`category_id` categoryId,`begin_time` beginTime,`end_time` endTime,`time` from browse where user_id = ? limit ?,?";
        return queryForList(Browse.class,sql,userId,begin,pageSize);
    }

}
