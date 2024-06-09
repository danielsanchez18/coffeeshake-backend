package com.coffeeshake_backend.repository;

import com.coffeeshake_backend.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query(nativeQuery = true, value = "CALL sp_get_products_available()")
    List<Product> findByAvailability();

    @Query(nativeQuery = true, value = "CALL sp_get_products_by_category(:category_name)")
    List<Product> findByCategory(@Param("category_name") String category);

    @Query(nativeQuery = true, value = "CALL sp_get_products_by_name(:product_name)")
    List<Product> findByName(@Param("product_name") String name);
}
