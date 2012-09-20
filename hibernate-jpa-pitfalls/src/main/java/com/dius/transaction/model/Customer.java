package com.dius.transaction.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.FetchProfile;
import org.hibernate.annotations.FetchProfile.FetchOverride;
import org.hibernate.annotations.FetchProfiles;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "t_customer")
@FetchProfiles({ @FetchProfile(name = "JOIN-ORDERS", fetchOverrides = { @FetchOverride(association = "orders", entity = Customer.class, mode = FetchMode.JOIN) }) })
@NamedQuery(name = "allCustomers", query = "FROM Customer c")
public class Customer {
    @Id
    @GeneratedValue
    private Long id;

    @NotEmpty
    private String name;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Fetch(FetchMode.SELECT)
    @JoinColumn(name = "customer", referencedColumnName = "id")
    // @LazyCollection(LazyCollectionOption.EXTRA)
    // @IndexColumn(name = "order_index")
    private List<Order> orders = new ArrayList<Order>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public Order addOrder(BigDecimal amount, Date date, PaymentMethod paymentMethod) {
        Order order = new Order(this, paymentMethod);
        order.setAmount(amount);
        order.setDate(date);
        orders.add(order);
        return order;
    }
}
