package com.dius.transaction.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dius.transaction.model.Order;

@Repository
public interface ReportRepository extends org.springframework.data.repository.Repository<Order, Long> {
    @Query("SELECT new Map(c as customer, SUM(o.amount) as total, MIN(o.date) as since) " //
            + "FROM Customer c, Order o " //
            + "WHERE o.customer = c " //
            + "GROUP BY c " //
            + "ORDER BY c.name")
    public List<Map<String, Object>> customerReport();
}
