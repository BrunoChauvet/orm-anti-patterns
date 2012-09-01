package com.dius.transaction.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dius.transaction.dao.CustomerRepository;
import com.dius.transaction.dao.OrderRepository;
import com.dius.transaction.service.DataLoadingService;

@Controller
public class DatabaseLoadController {
    @Autowired
    private DataLoadingService dataLoadingService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping("/load")
    public ModelAndView viewLoadPage(@ModelAttribute("form") LoadDatabaseForm loadDatabaseForm) {
        ModelAndView mav = new ModelAndView("load");
        mav.addObject("customerSize", customerRepository.count());
        mav.addObject("orderSize", orderRepository.count());
        mav.addObject("isLoading", dataLoadingService.isRunning());
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/load", method = RequestMethod.POST)
    public void runLoad(@ModelAttribute("form") LoadDatabaseForm loadDatabaseForm) {
        dataLoadingService.loadDatabase(loadDatabaseForm.getCustomerAmount(), loadDatabaseForm.getOrdersPerCutomer());
    }

    @ResponseBody
    @RequestMapping(value = "/clean", method = RequestMethod.POST)
    public void clean() {
        dataLoadingService.cleanDatabase();
    }

    @ResponseBody
    @RequestMapping("/loadProgression")
    public Double loadProgression() {
        return dataLoadingService.getProgression();
    }

    public static class LoadDatabaseForm {
        private Integer customerAmount;
        private Integer ordersPerCutomer;

        public Integer getCustomerAmount() {
            return customerAmount;
        }

        public void setCustomerAmount(Integer customerAmount) {
            this.customerAmount = customerAmount;
        }

        public Integer getOrdersPerCutomer() {
            return ordersPerCutomer;
        }

        public void setOrdersPerCutomer(Integer ordersPerCutomer) {
            this.ordersPerCutomer = ordersPerCutomer;
        }
    }
}
