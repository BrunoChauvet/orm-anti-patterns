<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>Aggregate Queries bad</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/report" />" class="button">Click me</a> to report the total amount of Orders per Customer<br/>
			The calculation of the total amount of Orders is done in memory
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="ReportService.java">
				@Transactional(readOnly = true)
    			public List&lt;Map&lt;String, Object&gt;&gt; customerReport() {
    			
					List&lt;Customer&gt; customers = customerReporistory.findAllCustomersFetchOrders();
	
					for(Customer customer : customers) {
					    List&lt;Order&gt; orders = customer.getOrders();
					    double amount = 0.0D;
					    for(Order order : orders) {
					        amount += order.getAmount();
					    }
					    // Rest of implementation
					}
				}
			</pre>
			<div class="clear"></div>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			Solution does not scale<br/>
			100 customers => 330ms<br/>
			500 customers => 880ms<br/>
			1,000 customers => 2000ms<br/>
			10,000 => java.lang.OutOfMemoryError: GC overhead limit exceeded<br/>
			<br/><br/>
			Mapping entities consuming Memory
		</div>
	</div>
	<div class="clear"></div>
</div>