package framework.service;

import framework.pojo.Cart;
import framework.pojo.Order;
import framework.pojo.OrderItem;
import framework.pojo.Page;

import java.util.List;

public interface OrderService {

    public String addOrder(Cart cart, Integer userId);

    public List<Order> queryForAll();

    public List<Order> queryByUserId(Integer userId);

    public List<OrderItem> queryForOrderItemByOrderId(String orderId);

    List<OrderItem> queryBySellerId(Integer sellerId);

    Page<Order> page(int pageNo, int pageSize);

    Page<OrderItem> pages(int pageNo, int pageSize, Integer sellerId);
}
