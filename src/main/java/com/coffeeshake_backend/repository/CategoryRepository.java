package com.coffeeshake_backend.repository;

import com.coffeeshake_backend.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    @Procedure(name = "sp_get_category_by_name")
    List<Category> findByName(@Param("category_name") String name);

}
