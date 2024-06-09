package com.coffeeshake_backend.services;

import com.coffeeshake_backend.model.OrderDetail;

import java.util.List;

public interface OrderDetailService {

    OrderDetail createOrderDetail(OrderDetail orderDetail);
    List<OrderDetail> getDetailsByOrderId(Long orderId);
    void deleteOrderDetail(Long orderDetailId);

}
