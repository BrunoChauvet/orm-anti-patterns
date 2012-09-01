package com.dius.transaction.web;

import org.hibernate.SessionFactory;
import org.hibernate.stat.Statistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class StatisticsController {
    @Autowired
    private SessionFactory sessionFactory;

    @RequestMapping("/stats")
    public ModelAndView stats() {
        ModelAndView mav = new ModelAndView("stats");

        Statistics statistics = sessionFactory.getStatistics();
        mav.addObject("statistics", statistics);
        mav.addObject("statisticsCustomer", statistics.getEntityStatistics("com.dius.transaction.model.Customer"));
        mav.addObject("statisticsOrder", statistics.getEntityStatistics("com.dius.transaction.model.Order"));
        mav.addObject("statisticsPaymentMethod", statistics.getEntityStatistics("com.dius.transaction.model.PaymentMethod"));

        return mav;
    }

    @RequestMapping("/reset")
    public View reset() {
        Statistics statistics = sessionFactory.getStatistics();
        statistics.clear();
        return new RedirectView("/stats", true);
    }
}
