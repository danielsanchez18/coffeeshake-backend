package com.coffeeshake_backend.services.impl;

import com.coffeeshake_backend.model.Order;
import com.coffeeshake_backend.repository.OrderDetailRepository;
import com.coffeeshake_backend.repository.OrderRepository;
import com.coffeeshake_backend.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Override
    public Order createOrder(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Order getOrderById(Long idOrder) {
        return orderRepository.findById(idOrder).orElse(null);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public List<Order> getOrdersByUserId(Long idUser) {
        return orderRepository.findByIdUser(idUser);
    }

    @Override
    public List<Order> getOrdersByStatus(String status) {
        return orderRepository.findByStatus(status);
    }

    @Override
    public Order updateOrderStatus(Long idOrder, String status) {
        Order order = orderRepository.findById(idOrder).orElseThrow(
                () -> new RuntimeException("ERROR: Order not found"));
        order.setStatus(status);
        return orderRepository.save(order);
    }

    @Override
    public void deleteOrderById(Long id) {
        orderRepository.deleteById(id);
    }
}
