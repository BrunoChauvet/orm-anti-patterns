package com.dius.transaction.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dius.transaction.dao.CustomerRepository;
import com.dius.transaction.dao.ReportRepository;
import com.dius.transaction.model.Customer;
import com.dius.transaction.model.Order;

@Service
public class ReportService {
    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Transactional(readOnly = true)
    public List<Map<String, Object>> customerReportAsMap() {
        return reportRepository.customerReport();
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> customerReport() {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

        List<Customer> customers = customerRepository.findAllCustomersFetchOrders();
        for (Customer customer : customers) {
            Map<String, Object> customerMap = new HashMap<String, Object>();
            customerMap.put("customer", customer);

            double amount = 0.0D;
            Date minDate = null;
            List<Order> orders = customer.getOrders();
            for (Order order : orders) {
                amount += order.getAmount().doubleValue();
                minDate = (minDate == null || order.getDate().before(order.getDate())) ? order.getDate() : minDate;
            }
            customerMap.put("total", amount);
            customerMap.put("since", minDate);

            result.add(customerMap);
        }

        return result;
    }
}
