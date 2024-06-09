package com.coffeeshake_backend.services;

import com.coffeeshake_backend.model.Order;

import java.util.List;

public interface OrderService {

    Order createOrder(Order order);
    Order getOrderById(Long idOrder);
    List<Order> getAllOrders();
    List<Order> getOrdersByUserId(Long idUser);
    List<Order> getOrdersByStatus(String status);
    Order updateOrderStatus(Long idOrder, String status);
    void deleteOrderById(Long id);
}
