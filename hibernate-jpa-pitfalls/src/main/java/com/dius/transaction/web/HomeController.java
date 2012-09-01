package com.dius.transaction.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @RequestMapping("/")
    public ModelAndView home() {
        return new ModelAndView("home");
    }

    @RequestMapping("/actions")
    public ModelAndView actions() {
        return new ModelAndView("actions");
    }
}
