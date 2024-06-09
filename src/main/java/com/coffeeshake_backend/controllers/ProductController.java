package com.coffeeshake_backend.controllers;

import com.coffeeshake_backend.model.Product;
import com.coffeeshake_backend.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
@CrossOrigin("*")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id) {
        return productService.getProductById(id);
    }

    @GetMapping("/name/{name}")
    public List<Product> getProductByName(@PathVariable String name) {
        return productService.getProductsByName(name);
    }

    @GetMapping("/category/{name_category}")
    public List<Product> getProductByCategory(@PathVariable String name_category) {
        return productService.getProductsByCategory(name_category);
    }

    @GetMapping("/")
    public List<Product> getProductsAvailable() {
        return productService.getProductsAvailables();
    }

    @GetMapping("/all")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @PostMapping("/save")
    public Product addProduct(@RequestBody Product product) {
        product.setImage("default.png");
        try {
            return productService.createProduct(product);
        } catch (Exception e) {
            throw new RuntimeException("ERROR: Error creating the product");
        }
    }

    @PutMapping("/update/{id}")
    public Product updateProduct(@PathVariable Long id, @RequestBody Product product) {
        try {
            product.setIdProduct(id);
            return productService.updateProduct(product);
        } catch (Exception e) {
            throw new RuntimeException("ERROR: Error updating the product");
        }
    }

    @DeleteMapping("/delete/{id}")
    public void deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
    }
}
