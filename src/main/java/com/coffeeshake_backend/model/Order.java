package com.coffeeshake_backend.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idOrder;

    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false)
    @JsonBackReference
    private User user;

    private Date date;
    private String typeOrder;
    private String methodPayment;
    private String status;
    private String phone;
    private String comments;
    private int waitingTime;
    private double totalPrice;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private Set<OrderDetail> orderDetails = new HashSet<>();

    public Order() { }

    public Order(Long idOrder, User user, Date date, String typeOrder, String methodPayment, String status, String phone, String comments, int waitingTime, double totalPrice, Set<OrderDetail> orderDetails) {
        this.idOrder = idOrder;
        this.user = user;
        this.date = date;
        this.typeOrder = typeOrder;
        this.methodPayment = methodPayment;
        this.status = status;
        this.phone = phone;
        this.comments = comments;
        this.waitingTime = waitingTime;
        this.totalPrice = totalPrice;
        this.orderDetails = orderDetails;
    }

    public Long getIdOrder() { return idOrder; }

    public void setIdOrder(Long idOrder) { this.idOrder = idOrder; }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }

    public Date getDate() { return date; }

    public void setDate(Date date) { this.date = date; }

    public String getTypeOrder() { return typeOrder; }

    public void setTypeOrder(String typeOrder) { this.typeOrder = typeOrder; }

    public String getMethodPayment() { return methodPayment; }

    public void setMethodPayment(String methodPayment) { this.methodPayment = methodPayment; }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public String getComments() { return comments; }

    public void setComments(String comments) { this.comments = comments; }

    public int getWaitingTime() { return waitingTime; }

    public void setWaitingTime(int waitingTime) { this.waitingTime = waitingTime; }

    public double getTotalPrice() { return totalPrice; }

    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public Set<OrderDetail> getOrderDetails() { return orderDetails; }

    public void setOrderDetails(Set<OrderDetail> orderDetails) { this.orderDetails = orderDetails; }

}
