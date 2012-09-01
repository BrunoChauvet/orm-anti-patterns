<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>Paginate Results</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/findOrders/0" />" class="button">Click me</a> to display the first 50 Orders
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="Customer.java">
				public class Customer {
				    // No reference to Unbounded Collection of Orders
				}
			</pre>
			<div class="clear"></div>
			<pre class="brush: java" title="Order.java">
				public class Order {
					@ManyToOne(fetch = FetchType.LAZY)
				    private Customer customer;
				
				    @OneToOne(fetch = FetchType.LAZY)
				    private PaymentMethod paymentMethod;
				}
			</pre>
			<div class="clear"></div>
			<pre class="brush: java" title="Named Query">
				@Query("SELECT DISTINCT o "
		            + "FROM Order o "
		            + "LEFT JOIN FETCH o.customer c "
		            + "ORDER BY c.name, o.date")
				public List&lt;Order&gt; findOrders(Pageable page);
			</pre>
			<div class="clear"></div>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			Selects one database row per entry to display on page
			<br/>
			Enforce the fetching of Orders to be done through the Repository
			<br/>
			Take advantage of the cache for Payment Methods
		</div>
	</div>
	<div class="clear"></div>
</div>