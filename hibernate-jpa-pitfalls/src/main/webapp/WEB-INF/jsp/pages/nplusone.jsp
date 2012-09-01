<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>N+1</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/findAllCustomers" />" class="button">Click me</a>
			Hibernate fetching Orders for each Customer out of a transaction when rendering the view
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="Customer.java">
				public class Customer {
				    @OneToMany(mappedBy = "customer")
				    private List&lt;Order&gt; orders = new ArrayList&lt;Order&gt;();
				}
			</pre>
			<div class="clear"></div>
			<pre class="brush: java" title="Order.java">
				public class Order {
				    @ManyToOne
				    @NotNull
				    private Customer customer;
				
				    @OneToOne
				    @NotNull
				    private PaymentMethod paymentMethod;
				}
			</pre>
			<div class="clear"></div>
			<pre class="brush: java" title="Named Query">
				@Query("SELECT DISTINCT c "
		            + "FROM Customer c "
		            + "ORDER BY c.name")
		    	public List&lt;Customer&gt; findAllCustomers();
			</pre>
			<div class="clear"></div>
			<pre class="brush: xml" title="JSP snippet">
				&lt;c:forEach items="&#36;{customer.orders}" var="order"&gt;
					&lt;tr&gt;
						&lt;td&gt;&lt;fmt:formatNumber value="&#36;{order.amount}" maxFractionDigits="2" type="currency" currencySymbol="&#36;"/&gt;&lt;/td&gt;
						&lt;td&gt;&lt;fmt:formatDate value="&#36;{order.date}"/&gt;&lt;/td&gt;
						&lt;td&gt;&lt;c:out value="&#36;{order.paymentMethod.name}"/&gt;&lt;/td&gt;
					&lt;/tr&gt;
				&lt;/c:forEach&gt;
			</pre>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
</div>