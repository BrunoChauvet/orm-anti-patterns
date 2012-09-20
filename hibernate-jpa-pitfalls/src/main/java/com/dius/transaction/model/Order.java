package com.dius.transaction.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "t_order")
public class Order {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    private BigDecimal amount;

    @NotNull
    private Date date;

    @ManyToOne
    @JoinColumn(name = "customer", insertable = false, updatable = false, nullable = true)
    private Customer customer;

    @OneToOne(fetch = FetchType.LAZY)
    private PaymentMethod paymentMethod;

    public Order() {
    }

    public Order(Customer customer, PaymentMethod paymentMethod) {
        this.customer = customer;
        this.paymentMethod = paymentMethod;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
