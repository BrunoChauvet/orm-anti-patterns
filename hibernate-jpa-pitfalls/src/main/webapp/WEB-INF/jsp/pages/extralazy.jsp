<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>Extra Lazy Fetching</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/findCustomersLastOrder" />" class="button">Click me</a> to display the last Order of each Customer
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="Customer.java">
				@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
			    @LazyCollection(LazyCollectionOption.EXTRA)
			    @IndexColumn(name = "order_index")
			    private List&lt;Order&gt; orders = new ArrayList&lt;Order&gt;();
			</pre>
			<div class="clear"></div>
			<pre class="brush: xml" title="JSP snippet">
				&lt;c:forEach items="&#36;{customers}" var="customer"&gt;
					&lt;c:set var="lastOrderIndex" value="&#36;{fn:length(customer.orders) - 1}"/&gt;
					&lt;tr&gt;
						&lt;td&gt;&lt;c:out value="&#36;{customer.name}" /&gt;&lt;/td&gt;
						&lt;td&gt;&lt;fmt:formatNumber value="&#36;{customer.orders[lastOrderIndex].amount}" maxFractionDigits="2" type="currency" currencySymbol="&#36;"/&gt;&lt;/td&gt;
						&lt;td&gt;&lt;fmt:formatDate value="&#36;{customer.orders[lastOrderIndex].date}"/&gt;&lt;/td&gt;
						&lt;td&gt;&lt;c:out value="&#36;{customer.orders[lastOrderIndex].paymentMethod.name}"/&gt;&lt;/td&gt;
					&lt;/tr&gt;
				&lt;/c:forEach&gt;
			</pre>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			Customer.getOrders() not fetching the Orders<br/>
			Customer.getOrders().size() issues a COUNT query<br/>
			Customer.getOrders().get(index) loads the specific Entity<br/>
		</div>
	</div>
	<div class="clear"></div>
</div>