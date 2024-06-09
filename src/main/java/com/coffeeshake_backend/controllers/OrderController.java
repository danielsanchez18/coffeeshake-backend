package com.coffeeshake_backend.controllers;

import com.coffeeshake_backend.model.Order;
import com.coffeeshake_backend.services.OrderDetailService;
import com.coffeeshake_backend.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
@CrossOrigin("*")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @PostMapping("/register-order")
    public Order createOrder(@RequestBody Order order) {
        return orderService.createOrder(order);
    }

    @GetMapping("/get/id/{id}")
    public Order getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }

    @GetMapping("/get/all")
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/get/status/{status}")
    public List<Order> getOrdersByStatus(@PathVariable String status) {
        return orderService.getOrdersByStatus(status);
    }

    @PutMapping("/update/{id}")
    public Order updateOrderStatus(@PathVariable Long id, @RequestBody String newStatus) {
        return orderService.updateOrderStatus(id, newStatus);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteOrder(@PathVariable Long id) {
        orderService.deleteOrderById(id);
    }


}
