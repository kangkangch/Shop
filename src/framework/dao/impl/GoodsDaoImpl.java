package framework.dao.impl;

import framework.dao.GoodsDao;
import framework.pojo.Goods;

import java.util.List;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {

    @Override
    public int addGoods(Goods goods) {
        String sql = "insert into goods(`name`,`price`,`sales`,`stock`,`img_path`,`seller_id`,`category_id`,`goods_info`) values(?,?,?,?,?,?,?,?)";
        return update(sql,goods.getName(),goods.getPrice(),goods.getSales(),goods.getStock(),goods.getImgPath(),goods.getSellerId(),goods.getCategoryId(),goods.getGoodsInfo());
    }

    @Override
    public int deleteGoods(Integer id) {
        String sql = "delete from goods where id = ?";
        return update(sql,id);
    }

    @Override
    public int updateGoods(Goods goods) {
        String sql = "update goods set `name`=?,`price`=?,`sales`=?,`stock`=?,`img_path`=?,`seller_id`=?,`category_id`=? `goods_info`=? where id = ?";
        return update(sql,goods.getName(),goods.getPrice(),goods.getSales(),goods.getStock(),goods.getImgPath(),goods.getSellerId(),goods.getCategoryId(),goods.getGoodsInfo(),goods.getId());
    }

    @Override
    public Goods queryGoodsById(Integer id) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path` imgPath,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods where id = ?";
        return queryForOne(Goods.class,sql,id);
    }

    @Override
    public List<Goods> queryGoods() {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path` imgPath,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods";
        return queryForList(Goods.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from goods";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Goods> queryForPageItems(int begin, int pageSize) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path`,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods limit ?,?";
        return queryForList(Goods.class,sql,begin,pageSize);
    }

    @Override
    public Integer queryForPageTotalCountByPrice(int min, int max) {
        String sql = "select count(*) from goods where price between ? and ?";
        Number count = (Number) queryForSingleValue(sql,min,max);
        return count.intValue();

    }

    //????????????
    @Override
    public List<Goods> queryForPageItemsByPrice(int begin, int pageSize, int min, int max) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path`,`seller_id` sellerId,`category_id`,`goods_info` goodsInfo categoryId from goods where price between ? and ? order by price limit ?,?";
        return queryForList(Goods.class,sql,min,max,begin,pageSize);
    }

//    ?????????????????????
    @Override
    public Integer queryForPageTotalCountByName(String goods_name) {
        String sql = "select count(*) from goods where name like \"%\" ?"+"\"%\";";
        Number count = (Number) queryForSingleValue(sql,goods_name);
        return count.intValue();
    }

//    ?????????????????????
    @Override
    public List<Goods> queryForPageItemsByName(int begin, int pageSize, String goods_name) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path`,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods where name like \"%\" ?"+"\"%\" limit ?,?";
        return queryForList(Goods.class,sql,goods_name,begin,pageSize);
    }

    @Override
    public String queryForImgPath(Integer id) {
        String sql = "select `img_path` from goods where id = ?";
        String string = (String) queryForSingleValue(sql,id);
        return string;
    }

    //????????????????????????????????????id???????????????????????????
    @Override
    public Integer queryForPageTotalCountBySellerId(int sellerId) {
        String sql = "select count(*) from goods where seller_id = ?";
        Number count = (Number) queryForSingleValue(sql,sellerId);
        return count.intValue();
    }

    @Override
    public List<Goods> queryForPageItemsBySellerId(int begin, int pageSize, int sellerId) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path`,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods where seller_id = ? limit ?,?";
        return queryForList(Goods.class,sql,sellerId,begin,pageSize);
    }

    //???GoodsName?????????????????????sellerId????????????????????????????????????????????????????????????
    @Override
    public Integer queryForPageTotalCountBySellerIdAndGoodsName(int sellerId, String goodsName) {
        String sql = "select count(*) from goods where seller_id = ? and name like \"%\" ?"+"\"%\"";
        Number count = (Number) queryForSingleValue(sql,sellerId,goodsName);
        return count.intValue();
    }

    @Override
    public List<Goods> queryForPageItemsBySellerIdAndGoodsName(int begin, int pageSize, int sellerId, String goodsName) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path`,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods where seller_id = ? and name like \"%\" ?"+"\"%\" limit ?,?";
        return queryForList(Goods.class,sql,sellerId,goodsName,begin,pageSize);
    }

    @Override
    public List<Goods> queryGoodsByNumberAndCategory(Integer max, int i) {
        String sql = "select `id`,`name`,`price`,`sales`,`stock`,`img_path` ImgPath,`seller_id` sellerId,`category_id` categoryId,`goods_info` goodsInfo from goods where category_id = ? order by rand() limit ?";
        return queryForList(Goods.class,sql,i,max);
    }
}
