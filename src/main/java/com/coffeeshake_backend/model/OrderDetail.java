package com.coffeeshake_backend.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idDetail;

    @ManyToOne
    @JoinColumn(name = "id_order", nullable = false)
    @JsonBackReference
    private Order order;

    @ManyToOne
    @JoinColumn(name = "id_product", nullable = false)
    private Product product;

    private int quantity;
    private double unitPrice;
    private double subtotalPrice;

    public OrderDetail() { }

    public OrderDetail(Long idDetail, Order order, Product product, int quantity, double unitPrice, double subtotalPrice) {
        this.idDetail = idDetail;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.subtotalPrice = subtotalPrice;
    }

    public Long getIdDetail() {
        return idDetail;
    }

    public void setIdDetail(Long idDetail) {
        this.idDetail = idDetail;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSubtotalPrice() {
        return subtotalPrice;
    }

    public void setSubtotalPrice(double totalPrice) {
        this.subtotalPrice = totalPrice;
    }
}
