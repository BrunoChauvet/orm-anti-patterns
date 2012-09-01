package com.dius.transaction.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang.math.RandomUtils;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dius.transaction.dao.CustomerRepository;
import com.dius.transaction.dao.PaymentMethodRepository;
import com.dius.transaction.model.Customer;
import com.dius.transaction.model.PaymentMethod;

@Service
public class DataLoadingService {
    private static final long JAN_01_2012 = 1325336400000L;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PaymentMethodRepository PaymentMethodRepository;

    @PersistenceContext
    private EntityManager entityManager;

    private Scanner scanner = new Scanner(this.getClass().getClassLoader().getResourceAsStream("data/names.txt"));
    private long totalOrders = 1L;
    private long counterOrders = 1L;
    private boolean running = false;

    public double getProgression() {
        return ((double) (counterOrders * 100)) / (double) (totalOrders);
    }

    public boolean isRunning() {
        return running;
    }

    @Transactional
    public synchronized void loadDatabase(final int customerAmount, final int ordersPerCustomer) {
        try {
            running = true;
            counterOrders = 0;
            totalOrders = customerAmount * ordersPerCustomer;

            List<PaymentMethod> paymentMethods = PaymentMethodRepository.findAll();

            for (int i = 0; i < customerAmount; i++) {
                if (!scanner.hasNextLine()) {
                    scanner.reset();
                }

                Customer customer = new Customer();
                customer.setName(scanner.nextLine());

                for (int j = 0; j < ordersPerCustomer; j++) {
                    customer.addOrder(BigDecimal.valueOf(RandomUtils.nextDouble() * 1000.0D),
                            new Date(JAN_01_2012 + RandomUtils.nextInt(1000 * 60 * 60 * 24 * 365)),
                            paymentMethods.get(RandomUtils.nextInt(paymentMethods.size())));
                    counterOrders++;
                }

                customer = customerRepository.save(customer);

                entityManager.flush();
                entityManager.unwrap(Session.class).clear();
            }
        } finally {
            running = false;
        }
    }

    @Transactional
    public void cleanDatabase() {
        customerRepository.deleteAll();
    }
}
