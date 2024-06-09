package com.coffeeshake_backend.services.impl;

import com.coffeeshake_backend.model.Product;
import com.coffeeshake_backend.repository.ProductRepository;
import com.coffeeshake_backend.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    @Override
    public List<Product> getProductsByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public List<Product> getProductsByCategory(String category) {
        return productRepository.findByCategory(category);
    }

    @Override
    public List<Product> getProductsAvailables() {
        return productRepository.findByAvailability();
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product createProduct(Product product) throws Exception {
        List<Product> products = productRepository.findByName(product.getNameProduct());
        if (!products.isEmpty()) {
            System.out.println("ERROR: Product already exists");
            return null;
        } else {
            return productRepository.save(product);
        }
    }

    @Override
    public Product updateProduct(Product product) throws Exception {
        Product prod = getProductById(product.getIdProduct());

        if (prod == null) {
            prod.setNameProduct(product.getNameProduct());
            prod.setCategory(product.getCategory());
            prod.setPrice(product.getPrice());
            prod.setDescription(product.getDescription());
            prod.setEnabled(product.isEnabled());

            return productRepository.save(prod);

        } else {
            System.out.println("ERROR: Product not found");
            return null;
        }
    }

    @Override
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
