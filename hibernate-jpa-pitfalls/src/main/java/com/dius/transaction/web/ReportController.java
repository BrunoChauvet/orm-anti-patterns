package com.dius.transaction.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dius.transaction.service.ReportService;

@Controller
@RequestMapping({ "/withSession", "/noSession" })
public class ReportController {
    private static final String REPORT_VIEW = "report";
    private static final String ENTRIES = "entries";

    @Autowired
    private ReportService reportService;

    @RequestMapping("/reportAsMap")
    public ModelAndView reportAsMap() {
        return new ModelAndView(REPORT_VIEW, ENTRIES, reportService.customerReportAsMap());
    }

    @RequestMapping("/report")
    public ModelAndView report() {
        return new ModelAndView(REPORT_VIEW, ENTRIES, reportService.customerReport());
    }
}
