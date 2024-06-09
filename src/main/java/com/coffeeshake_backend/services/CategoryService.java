package com.coffeeshake_backend.services;

import com.coffeeshake_backend.model.Category;

import java.util.List;

public interface CategoryService {

    Category createCategory(Category category);
    Category getCategoryById(Long id);
    List<Category> getCategoriesByName(String name);
    List<Category> getAllCategories();
    void deleteCategory(Long id);
}
