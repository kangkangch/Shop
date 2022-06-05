package framework.dao;

import framework.pojo.Order;
import framework.pojo.OrderItem;

import java.util.List;

public interface OrderItemDao {
    public int addOrderItem(OrderItem orderItem);
    Integer queryForTotalCount();
    List<OrderItem> queryForOrderItemByOrderId(String orderId);
    List<OrderItem> queryBySellerId(Integer sellerId);
    List<OrderItem> queryForPageItemsBySellerId(int begin, int pageSize, Integer sellerId);
}
