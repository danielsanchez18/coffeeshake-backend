package com.coffeeshake_backend.repository;

import com.coffeeshake_backend.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Procedure(name = "sp_get_order_by_user_id")
    List<Order> findByIdUser(@Param("user_id") Long idUser);

    @Procedure(name = "sp_get_order_by_status")
    List<Order> findByStatus(@Param("order_status") String status);
}
