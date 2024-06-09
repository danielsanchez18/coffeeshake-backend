package com.coffeeshake_backend.services;

import com.coffeeshake_backend.model.Product;

import java.util.List;

public interface ProductService {

    Product getProductById(Long id);
    List<Product> getProductsByName(String name);
    List<Product> getProductsByCategory(String category);
    List<Product> getProductsAvailables();
    List<Product> getAllProducts();
    Product createProduct(Product product) throws Exception;
    Product updateProduct(Product product) throws Exception;
    void deleteProduct(Long id);
}
