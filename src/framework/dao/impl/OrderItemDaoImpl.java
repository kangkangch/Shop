package framework.dao.impl;

import framework.dao.OrderItemDao;
import framework.pojo.OrderItem;

import java.util.List;

public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {
    @Override
    public int addOrderItem(OrderItem orderItem) {
        String sql = "insert into order_item(`name`,`count`,`price`,`total_price`,`order_id`,`seller_id`,`create_time`,`goods_id`,`user_id`) values(?,?,?,?,?,?,?,?,?)";
        return update(sql,orderItem.getName(),orderItem.getCount(),orderItem.getPrice(),orderItem.getTotalPrice(),orderItem.getOrderId(),orderItem.getSellerId(),orderItem.getCreateTime(),orderItem.getGoodsId(),orderItem.getUserId());
    }

    @Override
    public List<OrderItem> queryForOrderItemByOrderId(String orderId) {
        String sql = "select `id`, `name`, `count`, `price`, `total_price` totalPrice, `order_id` orderId, `seller_id` sellerId, `create_time` createTime,`goods_id` goodsId,`user_id` userId from order_item where order_id = ?";
        return queryForList(OrderItem.class, sql, orderId);
    }

    @Override
    public List<OrderItem> queryBySellerId(Integer sellerId) {
        String sql = "select `id`, `name`, `count`, `price`, `total_price` totalPrice, `order_id` orderId, `seller_id` sellerId, `create_time` createTime,`goods_id` goodsId,`user_id` userId from order_item where seller_id = ?";
        return queryForList(OrderItem.class, sql, sellerId);
    }

    @Override
    public Integer queryForTotalCount() {
        String sql = "select count(*) from `order_item`";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<OrderItem> queryForPageItemsBySellerId(int begin, int pageSize, Integer sellerId) {
        String sql = "select `id`, `name`, `count`, `price`, `total_price` totalPrice, `order_id` orderId, `seller_id` sellerId, `create_time` createTime,`goods_id` goodsId,`user_id` userId from order_item where seller_id = ? limit ?,?;";
        return queryForList(OrderItem.class, sql, sellerId, begin, pageSize);
    }
}
