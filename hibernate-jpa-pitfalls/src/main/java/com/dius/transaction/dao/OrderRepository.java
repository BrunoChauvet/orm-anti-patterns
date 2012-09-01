package com.dius.transaction.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dius.transaction.model.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {
    @Query("SELECT DISTINCT o " //
            + "FROM Order o " //
            + "LEFT JOIN FETCH o.customer c " //
            + "ORDER BY c.name, o.date")
    public List<Order> findOrders(Pageable pageable);
}
