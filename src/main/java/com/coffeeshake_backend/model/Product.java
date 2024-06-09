package com.coffeeshake_backend.model;

import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProduct;
    private String nameProduct;
    private String description;
    private Double price;
    private boolean enabled = true;
    private String image;

    @ManyToOne
    @JoinColumn(name = "id_category", nullable = false)
    private Category category;

    public Product() { }

    public Product(Long idProduct, String nameProduct, String description, Double price, boolean enabled, String image, Category category) {
        this.idProduct = idProduct;
        this.category = category;
        this.nameProduct = nameProduct;
        this.description = description;
        this.price = price;
        this.enabled = enabled;
        this.image = image;
    }

    public Long getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Long idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
