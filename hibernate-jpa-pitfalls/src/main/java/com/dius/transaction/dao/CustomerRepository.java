package com.dius.transaction.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dius.transaction.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    @Query("SELECT DISTINCT c " //
            + "FROM Customer c " //
            + "LEFT JOIN FETCH c.orders")
    public List<Customer> findAllCustomersFetchOrders();

    @Query("SELECT DISTINCT c " //
            + "FROM Customer c " //
            + "LEFT JOIN FETCH c.orders o " //
            + "LEFT JOIN FETCH o.paymentMethod")
    public List<Customer> findAllCustomersFetchOrdersAndPaymentMethods();

    @Query("SELECT DISTINCT c " //
            + "FROM Customer c " //
            + "LEFT JOIN FETCH c.orders")
    public List<Customer> findAllCustomersFetchOrders(Pageable pageable);
}
