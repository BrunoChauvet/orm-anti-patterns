package com.dius.transaction.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dius.transaction.service.CustomerService;

@Controller
@RequestMapping({ "/withSession", "/noSession" })
public class CustomerController {
    private static final String LIST_CUSTOMERS_VIEW = "list-customers";
    private static final String LIST_ORDERS_VIEW = "list-orders";
    private static final String LIST_CUSTOMERS_LAST_ORDER_VIEW = "list-customers-last-order";

    private static final String CUSTOMERS = "customers";
    private static final String ORDERS = "orders";

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/findAllCustomers")
    public ModelAndView findAllCustomers() {
        return new ModelAndView(LIST_CUSTOMERS_VIEW, CUSTOMERS, customerService.findAllCustomers());
    }

    @RequestMapping("/findAllCustomersFetchOrders")
    public ModelAndView findAllCustomersFetchOrders() {
        return new ModelAndView(LIST_CUSTOMERS_VIEW, CUSTOMERS, customerService.findAllCustomersFetchOrders());
    }

    @RequestMapping("/findAllCustomersFetchOrdersAndPaymentMethods")
    public ModelAndView findAllCustomersFetchOrdersAndPaymentMethods() {
        return new ModelAndView(LIST_CUSTOMERS_VIEW, CUSTOMERS, customerService.findAllCustomersFetchOrdersAndPaymentMethods());
    }

    @RequestMapping("/findAllCustomersSubSelectOrders")
    public ModelAndView findAllCustomersSubSelectOrders() {
        return new ModelAndView(LIST_CUSTOMERS_VIEW, CUSTOMERS, customerService.findAllCustomersSubSelectOrders());
    }

    @RequestMapping("/findCustomers/{page}")
    public ModelAndView findAllCustomersFetchOrders(@PathVariable("page") Integer page) {
        Pageable pageable = new PageRequest(page, 5);
        return new ModelAndView(LIST_CUSTOMERS_VIEW, CUSTOMERS, customerService.findAllCustomersFetchOrders(pageable));
    }

    @RequestMapping("/findOrders/{page}")
    public ModelAndView findAllOrdersFetchOrders(@PathVariable("page") Integer page) {
        Pageable pageable = new PageRequest(page, 50);
        return new ModelAndView(LIST_ORDERS_VIEW, ORDERS, customerService.findOrders(pageable));
    }

    @RequestMapping("/findCustomersLastOrder")
    public ModelAndView findCustomersLastOrder() {
        return new ModelAndView(LIST_CUSTOMERS_LAST_ORDER_VIEW, CUSTOMERS, customerService.findAllCustomers());
    }
}
