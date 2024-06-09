package com.coffeeshake_backend.repository;

import com.coffeeshake_backend.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    @Procedure(name = "sp_get_order_detail_by_order_id")
    List<OrderDetail> findByOrderId(@Param("order_id") Long id);
}
