package com.dius.transaction.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dius.transaction.dao.CustomerRepository;
import com.dius.transaction.dao.OrderRepository;
import com.dius.transaction.model.Customer;
import com.dius.transaction.model.Order;

@Service
public class CustomerService {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Transactional(readOnly = true)
    public List<Customer> findAllCustomers() {
        return customerRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Customer> findAllCustomersFetchOrders() {
        return customerRepository.findAllCustomersFetchOrders();
    }

    @Transactional(readOnly = true)
    public List<Customer> findAllCustomersFetchOrdersAndPaymentMethods() {
        return customerRepository.findAllCustomersFetchOrdersAndPaymentMethods();
    }

    @Transactional(readOnly = true)
    public List<Customer> findAllCustomersFetchOrders(Pageable pageable) {
        return customerRepository.findAllCustomersFetchOrders(pageable);
    }

    @Transactional(readOnly = true)
    public List<Customer> findAllCustomersSubSelectOrders() {
        return entityManager.unwrap(Session.class).createCriteria(Customer.class).list();
    }

    @Transactional(readOnly = true)
    public List<Order> findOrders(Pageable pageable) {
        return orderRepository.findOrders(pageable);
    }
}
