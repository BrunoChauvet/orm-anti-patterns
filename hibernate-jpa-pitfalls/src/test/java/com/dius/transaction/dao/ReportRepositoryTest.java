package com.dius.transaction.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dius.transaction.model.Customer;
import com.dius.transaction.model.Order;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/transaction-properties.xml", "classpath:/transaction-database.xml" })
public class ReportRepositoryTest extends AbstractTransactionalJUnit4SpringContextTests {
    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    private Customer customer1;
    private Customer customer2;

    @Before
    public void createCustomers() {
        customer1 = new Customer();
        customer1.setName("John");
        customer1 = customerRepository.save(customer1);

        customer2 = new Customer();
        customer2.setName("William");
        customer2 = customerRepository.save(customer2);

        addOrderToCustomer(customer1, 120.0D);
        addOrderToCustomer(customer1, 80.0D);

        addOrderToCustomer(customer2, 47.50D);
        addOrderToCustomer(customer2, 55.60D);
        addOrderToCustomer(customer2, 100.0D);
        addOrderToCustomer(customer2, 100.0D);
    }

    @Test
    public void shouldGenerateCustomerReport() {
        List<Map<String, Object>> customerReport = reportRepository.customerReport();

        Assert.assertEquals(customerReport.size(), 2);

        Map<String, Object> reportEntry1 = customerReport.get(0);
        Assert.assertEquals(reportEntry1.get("customer"), customer1);
        Assert.assertEquals(((BigDecimal) reportEntry1.get("total")).doubleValue(), 200.0D);

        Map<String, Object> reportEntry2 = customerReport.get(1);
        Assert.assertEquals(reportEntry2.get("customer"), customer2);
        Assert.assertEquals(((BigDecimal) reportEntry2.get("total")).doubleValue(), 303.1D);
    }

    private Order addOrderToCustomer(Customer customer, double amount) {
        Order order = new Order();
        order.setAmount(new BigDecimal(amount));
        order.setDate(new Date());
        order.setCustomer(customer);
        order.setPaymentMethod(paymentMethodRepository.findAll().get(0));
        return orderRepository.save(order);
    }
}
